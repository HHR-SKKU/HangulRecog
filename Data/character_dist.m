function result = character_dist(pic)
    i_end = size(pic,1);
    j_end = size(pic,2);
    repic = double(reshape(pic,i_end*j_end,1));
    msize = 4;
    c = std(repic);			%weight for binary algorithm ( have a standard deviation)
    pic2 =-1*ones(i_end+8*msize,j_end+8*msize);	%for parallel processing, create pic2
    %all of pixel is -1 for making edge to be -1 since 
    
    pic2([4*msize+1:i_end+4*msize],[4*msize+1:j_end+4*msize])=pic;
    for i = 4*msize+1:i_end+4*msize
        for j = 4*msize+1:j_end+4*msize
            newarr = pic2([i-4*msize:i+4*msize],[j-4*msize:j+4*msize]); %9 by 9 mask for binalization
            sumofpic = sum(sum(newarr)); %get all some of mask
            idx = find(newarr== -1); % get # of edge of pic2 by counting -1 pixel
            idxnum = length(idx); 
            T_point = (sumofpic+idxnum)/((8*msize+1)^2-idxnum); %T_point = mean of mask without edge
            T_point = max(T_point,c);
            if T_point>=pic2(i,j)
                pic(i-4*msize,j-4*msize) = 0;
            end
            
        end
        
    end
    result = pic;
end
