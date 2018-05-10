% [coeff,score,latent,tsquared,explained,mu] = pca(X)
%
% X:
% m*n����ÿ�ж�Ӧһ��������ÿ�ж�Ӧһ���ض�����.
%
% coeff:
% ���ɷ�ϵ�� Ӧ�þ���Э��������������������(Ҳ����ӳ�����),
% ����������������һ��p-by-p ��matrix.ÿһ�ж���һ����������,
% ����Ӧ������ֵ�Ĵ�С,�Ӵ�С��������.
% 
% score:
% �ؽ�������ݼ�
%
% latent:
% ���ɷַ��� Ҳ���Ǹ�����������Ӧ������ֵ,�Ӵ�С��������.
%
% explained:
% ÿһ�����ɷ������׵ı���,���Ը�ֱ�۵�ѡ������Ҫ��ά��ά����.
%
% mu:
% X ���еľ�ֵ,��ǰ���� 'Centered'����'true'(Ĭ��ֵ)ʱ�Ż᷵�ش˱���.

load hald

[wcoeff,~,latent,~,explained] = pca(ingredients,'VariableWeights','variance')

% Note that the coefficient matrix, wcoeff, is not orthonormal.
% Calculate the orthonormal coefficient matrix.
coefforth = inv(diag(std(ingredients)))* wcoeff

% Check orthonormality of the new coefficient matrix, coefforth.
coefforth*coefforth'

 
 