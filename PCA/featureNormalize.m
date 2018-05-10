function [X_norm, mu, sigma] = featureNormalize(X)  
    %
    % function [X_norm, mu, sigma] = featureNormalize(X)
    %
    % X is a m*n matrice, each row represents a sample,
    % ane each row corespond to a specific parameter.
    
    mu = mean(X);  
    X_norm = bsxfun(@minus, X, mu);  

    sigma = std(X_norm);  
    X_norm = bsxfun(@rdivide, X_norm, sigma);  
    
end 