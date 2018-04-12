% Matlab利用animatedline()绘制Lissajous曲线动态并保存GIF
% Retrieved from http://tinyland.site/posts/2017-07-02-matlab-implementation-for-lissajous-curve-animation-demo.html

%% Matlab动态绘制Lissajous曲线
figure('Color', 'w', 'Menubar', 'none', 'InnerPosition', [0 0 480 480]);
map=[65/255, 131/255, 196/255];
headMarker = animatedline('LineStyle','none','Marker','o','Color',map,'MarkerFaceColor',map);
body=animatedline('Linestyle', '-', 'LineWidth', 1.3, 'Color', map);
axis([-1, 1, -1, 1]);
axis off

a=13; % 沿X轴做简谐振动质点的角频率
b=18; % 沿Y轴做简谐振动质点的角频率
phi=pi*0; % 两质点简谐运动相位差

t=linspace(0, 2*pi, 1000);
x=sin(a*t+phi);
y=sin(b*t);

im=cell(1, length(t));

for ii=1:length(t)
    addpoints(headMarker, x(ii), y(ii));
    addpoints(body, x(ii), y(ii));
    drawnow
    
    frame=getframe;
    im{ii}=frame2im(frame);
    
    if(ii~=length(t))
        clearpoints(headMarker);
    end
end

%% 写入GIF
filename='Lissajous.gif';

for ii=1:length(t)
    [A, map]=rgb2ind(im{ii}, 256);
    if ii==1
        imwrite(A, map, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0);
    end
end