% [coeff,score,latent,tsquared,explained,mu] = pca(X)
%
% X:
% m*n矩阵，每行对应一个样本，每列对应一个特定参数.
%
% coeff:
% 主成分系数 应该就是协方差矩阵的特征向量矩阵(也就是映射矩阵),
% 完整输出的情况下是一个p-by-p 的matrix.每一列都是一个特征向量,
% 按对应的特征值的大小,从大到小进行排列.
% 
% score:
% 重建后的数据集
%
% latent:
% 主成分方差 也就是各特征向量对应的特征值,从大到小进行排列.
%
% explained:
% 每一个主成分所贡献的比例,可以更直观的选择所需要降维的维数了.
%
% mu:
% X 按列的均值,当前仅当 'Centered'置于'true'(默认值)时才会返回此变量.

load hald

[wcoeff,~,latent,~,explained] = pca(ingredients,'VariableWeights','variance')

% Note that the coefficient matrix, wcoeff, is not orthonormal.
% Calculate the orthonormal coefficient matrix.
coefforth = inv(diag(std(ingredients)))* wcoeff

% Check orthonormality of the new coefficient matrix, coefforth.
coefforth*coefforth'

 
 