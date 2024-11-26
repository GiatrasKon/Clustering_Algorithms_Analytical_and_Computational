% Clustering Algorithms Course - Homework 1 - Exercise 4
% MSc DSIT, 2023-2024
% Konstantinos Giatras
clc, clearvars, close all

% Set the random seed for reproducibility
randn('seed', 0);

% Define the means for each of the 4 distributions
md = [0 0; 10 0; 0 9; 9 8];

% Define the covariance matrices for each distribution
S(:, :, 1) = eye(2); % Identity matrix for the 1st distribution
S(:, :, 2) = [1 -0.2; -0.2 1.5]; % Covariance matrix for the 2nd distribution
S(:, :, 3) = [1 -0.4; -0.4 1.1]; % Covariance matrix for the 3rd distribution
S(:, :, 4) = [0.3 0.2; 0.2 0.5]; % Covariance matrix for the 4th distribution

% Number of points to generate for each distribution
n_points = 100 * ones(1, 4);

% Initialize the array to hold all the points and the labels
X = [];
labels = [];

% Generate the points for each distribution and concatenate them
for i = 1:4
    X_temp = mvnrnd(md(i, :), S(:, :, i), n_points(i));
    X = [X; X_temp]; % Keep as 400x2
    labels = [labels; i * ones(n_points(i), 1)]; % Create labels
end

% Determine the range of the current dataset to define the bounds for the noise
min_vals = min(X, [], 1);
max_vals = max(X, [], 1);

% Generate 99 noisy points uniformly spread among the existing points
noise_points = bsxfun(@plus, bsxfun(@times, rand(99, 2), (max_vals - min_vals)), min_vals);
X = [X; noise_points];
labels = [labels; 5 * ones(99, 1)]; % Label for noise

% Add the last point [100, 100]
X = [X; [100, 100]];
labels = [labels; 6]; % Label for the outlier

% Plot the dataset
figure, hold on;
colors = ['r', 'g', 'b', 'm', 'c', 'k']; % Define the colors for each group, including noise and outlier
markers = ['.', '.', '.', '.', '.', '+']; % Define the markers for each group, including noise and outlier
for i = 1:6
    plot(X(labels==i,1), X(labels==i,2), [colors(i) markers(i)], 'MarkerSize', 12);
end
% Set the axis to be equal and add grid
axis equal;
grid on;
% Add title and labels to the plot
title('Generated Data Set with Noise and Outlier');
xlabel('X Coordinate');
ylabel('Y Coordinate');
% Add a legend
legend('Group 1', 'Group 2', 'Group 3', 'Group 4', 'Noise', 'Outlier');
% Hold off to prevent further plotting on the same figure
hold off;

X = X';  % Make it an lxN matrix to prepare it as input for the k-means algorithm

% Clustering of the data with k-means
% For each m we perform s=100 different runs, with different initializations
N = size(X, 2); % Total number of data points
J_tot = [];
for m = 2:15
    J_temp = [];
    for s = 1:100
        te = randperm(N);
        theta_ini = X(:, te(1:m));
        theta = theta_ini;
        [theta, bel, J] = k_means(X, theta);
        J_temp = [J_temp J];
    end
    J = mean(J_temp);
    J_tot = [J_tot J];
end

% Plot J_tot to see how the cost function varies with the number of clusters
figure;
plot(2:15, J_tot, '-o');
title('Average Cost Function J for Different Numbers of Clusters (Elbow Curve)');
xlabel('Number of Clusters');
ylabel('Average Cost Function J');
grid on;

% Run k-means for the best clustering m=4
m = 4; % Best number of clusters determined from the elbow curve
J_temp = [];
% Initialize bel_temp as an empty matrix to store the labels from each run
bel_temp = [];
for s = 1:50
    te = randperm(N);
    theta_ini = X(:, te(1:m)); % Initial centroids
    theta = theta_ini;
    [theta, bel, J] = k_means(X, theta); % Run k-means
    J_temp = [J_temp J];
    bel_temp = [bel_temp; reshape(bel, 1, N)]; % Reshape bel to be a row vector and concatenate it to bel_temp
end
% Find the run with the minimum cost function J
[J_min, pos] = min(J_temp);
bel_best = bel_temp(pos, :); % Extract the best set of labels corresponding to the minimum J

% Visualize the best clustering result
figure, hold on;
colors = ['r', 'g', 'b', 'm']; % Colors for each cluster
cluster_handles = zeros(1, m); % Handles for the clusters for use in the legend
centroid_handle = []; % Handle for the centroids for use in the legend
% Plot clusters
for i = 1:m
    cluster_points = X(:, bel_best == i);
    cluster_handles(i) = plot(cluster_points(1, :), cluster_points(2, :), [colors(i) '.'], 'MarkerSize', 12);
end
% Plot centroids
centroid_handle = plot(theta(1, :), theta(2, :), 'kx', 'MarkerSize', 15, 'LineWidth', 2);
% Create legend
legend_handles = [cluster_handles centroid_handle]; % Combine cluster and centroid handles
legend(legend_handles, {'Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Centroids'});
title(sprintf('Best K-means Clustering Result for m = %d Clusters', m));
xlabel('X Coordinate');
ylabel('Y Coordinate');
axis equal;
grid on;
hold off;