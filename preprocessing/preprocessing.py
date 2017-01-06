# -*- coding: utf-8 -*-
"""
Created on Thu Sep 29 13:27:38 2016

@author: kiwoong_lee
"""

import cv2
import numpy as np
import tkFileDialog as tkF
def LUT2label(im,LUT):
    Imin = np.min(im)
    Imax = np.max(im)
    I =np.array(range(Imin,Imax+1))
    I = I.reshape([I.shape[0],1])
    L = np.zeros([im.shape[0],im.shape[1]],dtype=int)
    for k in range(np.max(LUT)+1):
        i = np.where(LUT==k)[0]
        i1 = int(i[0])
        
        if(i.size>1):
            i2=int(i[-1])
        else:
            i2=i1
        
        bw = np.where((im>I[i1]) & (im<I[i2]))
        for j in range(bw[0].size):
            L[bw[0][j],bw[1][j]] = k

    return L
    
def FastCmeans(im,c=2):
    Imin = np.min(im)
    Imax = np.max(im)
    I =np.array(range(Imin,Imax+1))
    I = I.reshape([I.shape[0],1])
    H = np.zeros([I.shape[0],1],dtype=int)
    k = im.shape[0]*im.shape[1]
    imshap =im.shape
    im = im.reshape([im.shape[0]*im.shape[1],1])
    for i in range(k):
        H[im[i]-Imin]=H[im[i]-Imin]+1 
        
    dl=(Imax-Imin)/c
    C=np.arange(Imin+dl/2,Imax,dl)
    IH = np.multiply(H,I)
    dC = float("inf")
    
    while(dC>1e-6):
        C0 =C
        D = np.ndarray([I.shape[0],0])
        for i in range(C.shape[0]):
            D = np.concatenate((D,np.subtract(I,C[i])),axis=1)
        
        D = np.abs(D)
        LUT = np.argmin(D,axis=1)
        C = np.double(C)
        for i in(range(c)):
            C[i]=np.sum(np.uint(IH[LUT==i]))/np.sum(np.uint(H[LUT==i]))
            
        dC = np.max(np.abs(np.subtract(C,C0))) 

    L =LUT2label(im,LUT)
    L = L.reshape(imshap)
    return L,C,LUT    

            
        

    

class CoordinateStore:
    def __init__(self):
        self.points = np.array([[0,0]])

    def select_point(self,event,x,y,flags,param):
            if event == cv2.EVENT_LBUTTONDBLCLK:
                cv2.circle(imag,(x,y),3,(255,0,0),-1)
                self.points=np.append(self.points,np.array([[x,y]]),axis=0)


Options = dict(defaultextension = '.jpg',filetypes = [('Imag','*.jpg *.png *.bmp *.JPG *.PNG *.BMP *.TIF '),('All files','*.*')])
file_path = tkF.askopenfilename(**Options)
imag = cv2.imread(str(file_path.encode('euc-kr')),0) #두번쨰 변수: color축의 갯수



#instantiate class
coordinateStore1 = CoordinateStore()


# Create a black image, a window and bind the function to window

cv2.namedWindow('image')
cv2.setMouseCallback('image',coordinateStore1.select_point)

imag = cv2.resize(imag,(imag.shape[0]/2,imag.shape[1]/2),interpolation=cv2.INTER_CUBIC)
rows,cols= imag.shape

while(1):
    cv2.imshow('image',imag)
    k = cv2.waitKey(20) & 0xFF
    if k == 27:
        break
    if len(coordinateStore1.points)==5:
        break
cv2.destroyAllWindows()
coordinatepoints = np.float32(coordinateStore1.points[1:,:])
ncols=int(np.max(coordinatepoints[:,0])-np.min(coordinatepoints[:,0]))
nrows=int(np.max(coordinatepoints[:,1])-np.min(coordinatepoints[:,1]))
orig_cor = np.float32([[0,0],[int(cols),0],[0,int(rows)],[int(cols),int(rows)]])
M = cv2.getPerspectiveTransform(coordinatepoints,orig_cor)
imag = cv2.warpPerspective(imag,M,(cols,rows))
imag = cv2.resize(imag,(ncols,nrows),interpolation=cv2.INTER_CUBIC)
[L,C,LUT] = FastCmeans(imag)
onenum = np.where(L==1)[0].size
zeronum = np.where(L==0)[0].size
if(onenum > zeronum):
    L = np.ones(L.shape)-L
Cmeans =np.uint8(np.multiply(L,imag))    
imag = np.uint8(255*np.ones([nrows,ncols]) - imag)

cv2.imshow('firstimag',imag)
cv2. imshow('Cmeans',Cmeans)

kernel = np.ones((5,5),np.uint8)
opening = cv2.morphologyEx(Cmeans, cv2.MORPH_OPEN, kernel)
binalimag = cv2.threshold(opening,1,255,cv2.THRESH_BINARY)[1]

keynum = float("inf")
key_Mat =0 



for i in list(range(-15,16)):
    M = cv2.getRotationMatrix2D((ncols/2,nrows/2),i,1) #opencv에서는 변환행렬을 만든 뒤에 곱하는 식으로 하는듯.
    dst_binal = cv2.warpAffine(binalimag,M,(ncols,nrows))
    projection_col = np.uint8(dst_binal.sum(1)!=0)
    linnum = 1
    linidx = 0
    linpos = np.zeros([20,1])
    for j in range(projection_col.size-1):
        if((projection_col[j]==0)&(projection_col[j+1]!=0)):
            linpos[linidx] = j
            linidx = linidx+1
        if((projection_col[j]!=0)&(projection_col[j+1]==0)):
            linnum = linnum+1
            linpos[linidx] = j+1
            linidx = linidx+1
            
    sumnum = projection_col.sum(0)
    keyval = sumnum/linnum
        
    
    ## 현재값의 y축 projection 시킨거의 각 line의 길이의 평균 구하고
    if(keynum>keyval): ##기존꺼랑 비교
        key_Mat = M #key_Mat에 우리가 원하는 각의 matrix가 저장되어야되
        keynum = keyval
        keyline = linpos

dst = cv2.warpAffine(opening,key_Mat,(ncols,nrows))


linidx = 0
texton = 0
while(keyline[linidx]!=0): #assume denoising is performed perfectly. later we have to revice this code.
    linimag = dst[int(keyline[linidx]):int(keyline[linidx+1]),:]
    iteridx = True
    while(iteridx):
######### 여기서부터 while 문 통해 iteration 시켜야됨... 존니귀찮... 존니 싫다....##############
        projection_row = linimag.sum(0)
        characterarr = np.zeros([1000,1])
        characteridx = 0;
        wherecharacter = np.zeros([2000,1])
        for i in range(projection_row.size-1):
            if((projection_row[i]==0)&(projection_row[i+1]!=0)):
                texton = 1
                wherecharacter[2*characteridx] = i
                characteridx = characteridx+1
            if((projection_row[i]!=0)&(projection_row[i+1]==0)):
                texton = 0
                wherecharacter[2*characteridx-1] = i
            if(texton ==1):
                characterarr[characteridx-1] =characterarr[characteridx-1] + 1
             # row 로 projection후 글자 쪼개는거 필요!! 근데 좀 귀찮네..ㅋㅋㅋㅋ
        
        iteridx = True                
        meanval = characterarr[:characteridx].sum(0)/characteridx
        for j in range(characteridx):
            if(meanval*2/3>=characterarr[j]):
                characteridx=characteridx-1
                iteridx = True
                wherecharacter[2*j]
                
    
########여기까지  루프 ##############    
    linidx = linidx+2

cv2.imshow('imag',dst)


cv2.waitKey(0)
cv2.destroyAllWindows()

