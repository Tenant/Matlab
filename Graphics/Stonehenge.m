% 利用英格兰索尔兹伯里附件史前纪念碑巨石阵预测日月食演示动画
% By Gao Shuqi, on 2018-04-13
% Reference: F. Hoyle, Stonehenge -- An Eclipse Predictor, Science, 1966: 454-556

%%
figure('Color', 'w', 'MenuBar', 'none', 'InnerPosition', [0 0 480 480]);
colormap=[65/255, 131/255, 196/255];
sun=animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'r', 'MarkerFaceColor', 'r');
moon=animatedline('LineStyle', 'none', 'Marker', 'o', 'Color', 'b', 'MarkerFaceColor', 'b');
axis([-1, 1, -1, 1]);
axis off

R_sun=0.8;
R_moon=0.7;
R_stone=1;
t=linspace(0, 2800, 1000);
s=linspace(0, 2*pi, 56);
T_sun=56*13/2; % 每13天将Sun逆时针移动2个洞
T_moon=56/2; % 每天将Moon逆时针移动2个洞

x_sun=R_sun*cos(2*pi/T_sun*t);
y_sun=R_sun*sin(2*pi/T_sun*t);
x_moon=R_moon*cos(2*pi/T_moon*t+pi);
y_moon=R_moon*sin(2*pi/T_moon*t+pi);
x_stone=R_stone*cos(s);
y_stone=R_stone*sin(s);

hold on
for ii=1:56
    plot(x_stone(ii), y_stone(ii), 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k');
end
line([-R_stone+0.1, R_stone-0.1], [0, 0], 'LineStyle', ':', 'Color', 'k');

for ii=1:length(t)
    addpoints(sun, x_sun(ii), y_sun(ii));
    addpoints(moon, x_moon(ii), y_moon(ii));
    drawnow
    
    if(ii~=length(t))
        clearpoints(sun);
        clearpoints(moon);
    end
end



