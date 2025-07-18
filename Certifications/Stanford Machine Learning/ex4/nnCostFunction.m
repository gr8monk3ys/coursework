function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Part 1: Feedforward and Cost computation

% Add ones to the X data matrix as bias units
X = [ones(m, 1) X];

% Convert y to matrix of one-hot vectors
Y = zeros(m, num_labels);
for i = 1:m
    Y(i, y(i)) = 1;
end

% Forward propagation
a1 = X;                           % Input layer with bias (m x input_layer_size+1)
z2 = a1 * Theta1';                % Hidden layer activation (m x hidden_layer_size)
a2 = sigmoid(z2);                 % Hidden layer output
a2 = [ones(size(a2, 1), 1) a2];   % Add bias unit (m x hidden_layer_size+1)
z3 = a2 * Theta2';                % Output layer activation (m x num_labels)
a3 = sigmoid(z3);                 % Output layer output (m x num_labels)

% Calculate cost (without regularization)
J = (1/m) * sum(sum(-Y .* log(a3) - (1 - Y) .* log(1 - a3)));

% Add regularization term to cost (excluding bias terms)
reg_term = (lambda/(2*m)) * (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));
J = J + reg_term;

% Part 2: Backpropagation

% Initialize accumulators for the gradient calculations
Delta1 = zeros(size(Theta1));
Delta2 = zeros(size(Theta2));

% For each training example
for t = 1:m
    % Step 1: Forward pass (we've already computed this above, but now for a single example)
    a1t = X(t,:)';                  % (input_layer_size+1 x 1)
    z2t = Theta1 * a1t;             % (hidden_layer_size x 1)
    a2t = sigmoid(z2t);             % (hidden_layer_size x 1)
    a2t = [1; a2t];                 % Add bias unit (hidden_layer_size+1 x 1)
    z3t = Theta2 * a2t;             % (num_labels x 1)
    a3t = sigmoid(z3t);             % (num_labels x 1)
    
    % Step 2: Output layer error
    delta3 = a3t - Y(t,:)';         % (num_labels x 1)
    
    % Step 3: Hidden layer error
    delta2 = (Theta2' * delta3) .* [1; sigmoidGradient(z2t)]; % (hidden_layer_size+1 x 1)
    delta2 = delta2(2:end);         % Remove bias unit (hidden_layer_size x 1)
    
    % Step 4: Accumulate gradient
    Delta2 = Delta2 + delta3 * a2t';
    Delta1 = Delta1 + delta2 * a1t';
end

% Step 5: Calculate average gradient
Theta1_grad = (1/m) * Delta1;
Theta2_grad = (1/m) * Delta2;

% Part 3: Add regularization to gradients
Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + (lambda/m) * Theta1(:, 2:end);
Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + (lambda/m) * Theta2(:, 2:end);

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
