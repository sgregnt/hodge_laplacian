%auxillary function to extract edges form incidence matrix
function [edges_points, edge_list] = getEdges(boundary_1d, point_cloud)

% sources
[row_s, col_s] = find(boundary_1d < -0.1);
source = sortrows([col_s, row_s]);

% targets
[row_t, col_t] = find(boundary_1d > 0.1);
target = sortrows([col_t, row_t]);

[h, w] = size(row_s);

edge_list = zeros(h, 2);

for i = 1: h
    % second index stores the zero dimension simplex index 
    edge_list(i,1) = source(i, 2);
    edge_list(i,2) = target(i, 2);
end

[h,w] = size(edge_list);
edges_points = zeros(h, 4);

for i = 1: h
    p_s = point_cloud(edge_list(i, 1), :);
    p_t = point_cloud(edge_list(i, 2), :);
    edges_points(i, :) = [p_s p_t];
end
    


