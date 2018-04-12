% 使用movie函数来创建动画，步骤如下：
% 1. 调用moviein函数对内存进行初始化，创建一个足够大的矩阵，
% 使之能够容纳基于当前坐标大小的一系列指定的图形（此处称为帧）
% 2. 调用getframe函数生成每个帧。该函数返回一个列矢量，利用这个矢量，
% 就可以创建一个电影动画矩阵
% 3. 调用movie函数按照指定的速度进行指定次数播放该电影动画。例如：
% movie(M, n)可以播放由矩阵M所定义的画面n次，默认n时只播放一次
%
% getframe调用格式：
% f = getframe，从当前图形框中得到动画帧
% f = getframe(h)，从图形句柄h中得到动画帧
% f = getframe(h，rect)，从图形句柄h的指定区域rect中得到动画帧
%
% movie调用格式：
% movie(M)，将矩阵M中的动画帧播放一次
% movie(M, n)，将矩阵M中的动画帧播放n次
% movie(M, n, fps)，将矩阵M中的动画帧以每秒fps帧的速度播放n次
%
% Retrieved from https://blog.csdn.net/zengxiantao1994/article/details/77482852

%% 演示山峰函数绕Z轴旋转的动画
clc; clear;

[X,Y,Z]=peaks(30);
surf(X,Y,Z);

axis([-3, 3, -3, 3, -10, 10]);
axis off

% shading：是用来处理色彩效果的，分以下三种：  
% 1、no shading 一般的默认模式 即shading faceted  
% 2、shading flat 在faceted的基础上去掉图上的网格线  
% 3、shading interp 在flat的基础上进行色彩的插值处理，使色彩平滑过渡
shading interp

% colormap：设定和获取当前的色图。  
% 1、colormap(map)：设置颜色图为矩阵map。如果map中的任何值在区间[0,1]之外，MATLAB返回错误。  
% 2、colormap('default')：将当前的颜色图设置为默认的颜色图。  
% 3、cmap=colormap：返回当前的颜色图。返回的值都在区间[0,1]内。  
% map是一个3列矩阵，其元素数值定义在区间[0,1]。矩阵的每行元素表示1一个真色彩向量，即红、绿、蓝3基色的系数。  
% hot为matlab中预定义的色图样式中的一种，表示：黑、红、黄、白色浓淡交错。
colormap(hot)

M=moviein(20);
for ii=1:20
    view(-37.5+24*(i-1), 30)
    M(ii)=getframe;
end

movie(M,2)

%% 动态展示plot绘图过程
clc; clear;

M=moviein(16);

for k=1:16
    plot(fft(eye(k+16)));
    axis equal
    M(k)=getframe;
end

movie(M,5)






