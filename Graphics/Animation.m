% ʹ��movie�����������������������£�
% 1. ����moviein�������ڴ���г�ʼ��������һ���㹻��ľ���
% ʹ֮�ܹ����ɻ��ڵ�ǰ�����С��һϵ��ָ����ͼ�Σ��˴���Ϊ֡��
% 2. ����getframe��������ÿ��֡���ú�������һ����ʸ�����������ʸ����
% �Ϳ��Դ���һ����Ӱ��������
% 3. ����movie��������ָ�����ٶȽ���ָ���������Ÿõ�Ӱ���������磺
% movie(M, n)���Բ����ɾ���M������Ļ���n�Σ�Ĭ��nʱֻ����һ��
%
% getframe���ø�ʽ��
% f = getframe���ӵ�ǰͼ�ο��еõ�����֡
% f = getframe(h)����ͼ�ξ��h�еõ�����֡
% f = getframe(h��rect)����ͼ�ξ��h��ָ������rect�еõ�����֡
%
% movie���ø�ʽ��
% movie(M)��������M�еĶ���֡����һ��
% movie(M, n)��������M�еĶ���֡����n��
% movie(M, n, fps)��������M�еĶ���֡��ÿ��fps֡���ٶȲ���n��
%
% Retrieved from https://blog.csdn.net/zengxiantao1994/article/details/77482852

%% ��ʾɽ�庯����Z����ת�Ķ���
clc; clear;

[X,Y,Z]=peaks(30);
surf(X,Y,Z);

axis([-3, 3, -3, 3, -10, 10]);
axis off

% shading������������ɫ��Ч���ģ����������֣�  
% 1��no shading һ���Ĭ��ģʽ ��shading faceted  
% 2��shading flat ��faceted�Ļ�����ȥ��ͼ�ϵ�������  
% 3��shading interp ��flat�Ļ����Ͻ���ɫ�ʵĲ�ֵ����ʹɫ��ƽ������
shading interp

% colormap���趨�ͻ�ȡ��ǰ��ɫͼ��  
% 1��colormap(map)��������ɫͼΪ����map�����map�е��κ�ֵ������[0,1]֮�⣬MATLAB���ش���  
% 2��colormap('default')������ǰ����ɫͼ����ΪĬ�ϵ���ɫͼ��  
% 3��cmap=colormap�����ص�ǰ����ɫͼ�����ص�ֵ��������[0,1]�ڡ�  
% map��һ��3�о�����Ԫ����ֵ����������[0,1]�������ÿ��Ԫ�ر�ʾ1һ����ɫ�����������졢�̡���3��ɫ��ϵ����  
% hotΪmatlab��Ԥ�����ɫͼ��ʽ�е�һ�֣���ʾ���ڡ��졢�ơ���ɫŨ������
colormap(hot)

M=moviein(20);
for ii=1:20
    view(-37.5+24*(i-1), 30)
    M(ii)=getframe;
end

movie(M,2)

%% ��̬չʾplot��ͼ����
clc; clear;

M=moviein(16);

for k=1:16
    plot(fft(eye(k+16)));
    axis equal
    M(k)=getframe;
end

movie(M,5)






