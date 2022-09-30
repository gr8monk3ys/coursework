function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Define the range of values to test
values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% Initialize variables to track the best parameters
best_error = Inf;
best_C = 0;
best_sigma = 0;

% Try all combinations of C and sigma from the range
for C_value = values
    for sigma_value = values
        % Train the SVM model
        model = svmTrain(X, y, C_value, @(x1, x2) gaussianKernel(x1, x2, sigma_value));
        
        % Get predictions for validation set
        predictions = svmPredict(model, Xval);
        
        % Calculate error rate
        error = mean(double(predictions ~= yval));
        
        % Update best parameters if current error is lower
        if error < best_error
            best_error = error;
            best_C = C_value;
            best_sigma = sigma_value;
        end
    end
end

% Set the optimal parameters found
C = best_C;
sigma = best_sigma;

% =========================================================================

end
