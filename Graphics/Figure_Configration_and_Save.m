% Matlab����imshow/plot���Բ��Զ�������ʾͼ��

% 'border','tight'����Ϲ�����˼��ȥ��ͼ���ܱ߿հ�
% 'InitialMagnification','fit'��ϵ���˼��ͼ���������figure����
imshow(strain_image,'border','tight','initialmagnification','fit');

% ���ô��ڴ�С��ֻ���ô��ڴ�С���У����麬�壺[left bottom width height]
set (gcf,'Position',[230,245,500,370])

% ʹͼƬ�������figure��Ҳ���ǳɹ涨����״
axis normal

% ����ͼƬ
saveas(gcf,'strain.jpg','jpg');
