% 使用comet、comet3函数来产生质点动画，其步骤如下:
% step1：求解出质点完整的运动轨迹坐标x，y和z
% step2：使用comet或者comet3直接绘制动点
%
% 函数comet和comet3调用格式:
% comet(y)，显示质点绕着向量y的动画轨迹（二维）
% comet(x, y)，显示质点绕着向量y与x的动画轨迹（二维）
% comet(x, y, p)，同上面的效果，但额外地定义轨迹尾巴线的长度p*length(y)，
% 其中p是介于0和1之间的数，默认为0.1
%
% Retrieved from https://blog.csdn.net/zengxiantao1994/article/details/77482852

%% 利用comet绘制二维质点运动
% x, y分别指定质点运动过程中的x坐标和y坐标
t=linspace(0, 4*pi, 1000);
x=cos(t); 
y=sin(t);
comet(x,y,0.1)

%% 利用comet3绘制三维质点运动
% X, Y, Z分别指定质点运动过程中的X坐标、Y坐标和Z坐标
theta=linspace(0, 4*pi, 1000);
beta=linspace(0, pi, 1000);
X=sin(beta).*cos(theta);
Y=sin(beta)*sin(theta);
Y=sin(beta).*sin(theta);
Z=cos(beta);
comet3(X, Y,Z,0.3)