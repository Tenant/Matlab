% Matlab设置imshow/plot属性并自动保存显示图形

% 'border','tight'的组合功能意思是去掉图像周边空白
% 'InitialMagnification','fit'组合的意思是图像填充整个figure窗口
imshow(strain_image,'border','tight','initialmagnification','fit');

% 设置窗口大小。只设置窗口大小就行，数组含义：[left bottom width height]
set (gcf,'Position',[230,245,500,370])

% 使图片填充整个figure，也就是成规定的形状
axis normal

% 保存图片
saveas(gcf,'strain.jpg','jpg');
