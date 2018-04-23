% 压缩视频文件并将数据存入data.mat
[fileName,pathName] = uigetfile('*.*','Please select an image');

if(fileName)  
    fileName = strcat(pathName,fileName);  
    fileName = lower(fileName);
else     
    msgbox('请选择视频！'); 
    clear fileName pathName
    return; %退出程序  
end

frames = VideoReader(fileName);
num=frames.NumberOfFrames;

rate=input('请输入压缩比例：');

for ii=1:num
    img=read(frames,ii);
    img=imresize(img,rate);
    data(:,:,:,ii)=img(:,:,:);
end

save data data
clear fileName pathName frames num rate img ii
fprintf('图像压缩完成！');
