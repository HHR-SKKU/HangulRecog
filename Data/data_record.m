iniheader=1:19;
ininumber=zeros(1,19);
medheader=1:21;
mednumber=zeros(1,21);
finheader=1:28;
finnumber=zeros(1,28);

for i = 1:length(iniheader)
    filepath = sprintf('1_%d',i-1);
    ininumber(i) = length(dir(fullfile(filepath,'*.jpg')));
end
for i = 1:length(medheader)
    filepath = sprintf('2_%d',i-1);
    mednumber(i) = length(dir(fullfile(filepath,'*.jpg')));
end
for i = 1:length(finheader)
    filepath = sprintf('3_%d',i-1);
    finnumber(i) = length(dir(fullfile(filepath,'*.jpg')));
end
ini = [iniheader; ininumber];
med = [medheader; mednumber];
fin = [finheader; finnumber];

textid = fopen('Collected_data.txt','w');
fprintf(textid,'%6s\r\n','ini');
fprintf(textid,'%6d %12d\r\n',ini);
fprintf(textid,'%6s\r\n','med');
fprintf(textid,'%6d %12d\r\n',med);
fprintf(textid,'%6s\r\n','fin');
fprintf(textid,'%6d %12d\r\n',fin);

fclose(textid);