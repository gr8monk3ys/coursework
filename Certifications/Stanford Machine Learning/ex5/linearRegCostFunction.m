function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% Compute hypothesis (predictions)
h = X * theta;

% Compute the cost
J = (1/(2*m)) * sum((h - y).^2);

% Add regularization term to cost (excluding theta(1))
J = J + (lambda/(2*m)) * sum(theta(2:end).^2);

% Compute the gradient
grad = (1/m) * (X' * (h - y));

% Add regularization to gradient (excluding theta(1))
temp = theta;
temp(1) = 0;  % Don't regularize the bias term
grad = grad + (lambda/m) * temp;

% =========================================================================

grad = grad(:);

end
