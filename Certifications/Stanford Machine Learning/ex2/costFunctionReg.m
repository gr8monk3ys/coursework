function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% Compute hypothesis using sigmoid function
h = sigmoid(X * theta);

% Calculate cost function with regularization term
% Note that theta(1) is not regularized
J = (1/m) * sum(-y .* log(h) - (1 - y) .* log(1 - h)) + (lambda/(2*m)) * sum(theta(2:end).^2);

% Calculate gradient with regularization
% First calculate the gradient without regularization
grad_no_reg = (1/m) * (X' * (h - y));

% Add regularization term to all theta values except theta(1)
grad = grad_no_reg;
grad(2:end) = grad(2:end) + (lambda/m) * theta(2:end);

% =============================================================

end
