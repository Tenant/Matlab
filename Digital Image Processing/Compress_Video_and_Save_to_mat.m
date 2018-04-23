% ѹ����Ƶ�ļ��������ݴ���data.mat
[fileName,pathName] = uigetfile('*.*','Please select an image');

if(fileName)  
    fileName = strcat(pathName,fileName);  
    fileName = lower(fileName);
else     
    msgbox('��ѡ����Ƶ��'); 
    clear fileName pathName
    return; %�˳�����  
end

frames = VideoReader(fileName);
num=frames.NumberOfFrames;

rate=input('������ѹ��������');

for ii=1:num
    img=read(frames,ii);
    img=imresize(img,rate);
    data(:,:,:,ii)=img(:,:,:);
end

save data data
clear fileName pathName frames num rate img ii
fprintf('ͼ��ѹ����ɣ�');
