filename='���ӵ�����.mp4';

% ��ԭʼ�ļ�
frames=VideoReader(filename);
num=frames.NumberOfFrames;
Height=frames.Height;
Width=frames.Width;
FrameRate=frames.FrameRate;

% ����Ŀ���ļ�
movie=VideoWriter([filename(1: strfind(maskfile, '.')-1), '_process'], 'MPEG-4');
movie.FrameRate=FrameRate;
open(movie);

% ��֡��������
for ii=1:num
    img=read(frames, ii);
    img=rgb2gray(img);
    %imwrite(img, ['frame_',num2str(ii),'.bmp'], 'bmp'); % ��֡����ΪbmpͼƬ
    %img=imread(['frame_',num2str(ii),'.bmp']);
     writeVideo(movie, img);
end

% �ر�Ŀ���ļ�ָ��
close(movie);


