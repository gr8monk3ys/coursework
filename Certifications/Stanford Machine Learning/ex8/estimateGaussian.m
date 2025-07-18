function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%

% Compute the mean of each feature (column-wise)
mu = mean(X)'; % Transpose to get n x 1 vector

% Compute the variance of each feature (column-wise)
% Using the formula: sigma^2 = (1/m) * sum((x_i - mu)^2)
sigma2 = var(X, 1)'; % Use var with normalization by m (not m-1), then transpose

% =============================================================


end
