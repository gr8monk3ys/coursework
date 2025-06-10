function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the similarity between x1
%               and x2 computed using a Gaussian kernel with bandwidth
%               sigma
%
% The Gaussian kernel (RBF) is defined as:
% K(x1, x2) = exp(-||x1 - x2||^2 / (2 * sigma^2))

% Calculate the L2 norm squared of the difference between x1 and x2
diff = x1 - x2;
squared_distance = sum(diff .^ 2);

% Calculate the Gaussian kernel value
sim = exp(-squared_distance / (2 * sigma^2));

% =============================================================
    
end
