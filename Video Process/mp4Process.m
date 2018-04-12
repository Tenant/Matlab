filename='胖子的世界.mp4';

% 打开原始文件
frames=VideoReader(filename);
num=frames.NumberOfFrames;
Height=frames.Height;
Width=frames.Width;
FrameRate=frames.FrameRate;

% 创建目标文件
movie=VideoWriter([filename(1: strfind(maskfile, '.')-1), '_process'], 'MPEG-4');
movie.FrameRate=FrameRate;
open(movie);

% 逐帧处理并保存
for ii=1:num
    img=read(frames, ii);
    img=rgb2gray(img);
    %imwrite(img, ['frame_',num2str(ii),'.bmp'], 'bmp'); % 逐帧保存为bmp图片
    %img=imread(['frame_',num2str(ii),'.bmp']);
     writeVideo(movie, img);
end

% 关闭目标文件指针
close(movie);


