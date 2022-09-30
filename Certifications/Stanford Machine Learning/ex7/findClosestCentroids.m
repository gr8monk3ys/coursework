function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% Get the number of examples
m = size(X, 1);

% For each example in X
for i = 1:m
    % Initialize minimum distance and closest centroid index
    min_dist = Inf;
    closest_centroid = 0;
    
    % Find the centroid with minimum distance to the example
    for j = 1:K
        % Calculate the Euclidean distance between the example and centroid
        dist = sum((X(i, :) - centroids(j, :)) .^ 2);
        
        % Update if this centroid is closer than previous closest
        if dist < min_dist
            min_dist = dist;
            closest_centroid = j;
        end
    end
    
    % Assign the closest centroid index to idx
    idx(i) = closest_centroid;
end

% =============================================================

end

