% ʹ��comet��comet3�����������ʵ㶯�����䲽������:
% step1�������ʵ��������˶��켣����x��y��z
% step2��ʹ��comet����comet3ֱ�ӻ��ƶ���
%
% ����comet��comet3���ø�ʽ:
% comet(y)����ʾ�ʵ���������y�Ķ����켣����ά��
% comet(x, y)����ʾ�ʵ���������y��x�Ķ����켣����ά��
% comet(x, y, p)��ͬ�����Ч����������ض���켣β���ߵĳ���p*length(y)��
% ����p�ǽ���0��1֮�������Ĭ��Ϊ0.1
%
% Retrieved from https://blog.csdn.net/zengxiantao1994/article/details/77482852

%% ����comet���ƶ�ά�ʵ��˶�
% x, y�ֱ�ָ���ʵ��˶������е�x�����y����
t=linspace(0, 4*pi, 1000);
x=cos(t); 
y=sin(t);
comet(x,y,0.1)

%% ����comet3������ά�ʵ��˶�
% X, Y, Z�ֱ�ָ���ʵ��˶������е�X���ꡢY�����Z����
theta=linspace(0, 4*pi, 1000);
beta=linspace(0, pi, 1000);
X=sin(beta).*cos(theta);
Y=sin(beta)*sin(theta);
Y=sin(beta).*sin(theta);
Z=cos(beta);
comet3(X, Y,Z,0.3)