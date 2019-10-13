function triangle_list = getTriangles(boundary_2d, edge_list, point_cloud)

% sources
[row_s, col_s] = find(boundary_2d < -0.1);
edge_source = sortrows([col_s, row_s]);

% targets
[row_t, col_t] = find(boundary_2d > 0.1);
edge_target = sortrows([col_t, row_t]);


all_edges = [edge_source; edge_target];

%sorted by row with stands for triangle, so the 
% row count triangles, colums should correspond to 
% edges.
all_edges = sortrows(all_edges);
   
[h, w] = size(row_s);

triangle_list = zeros(h, 2 * 3);
tri_i = 1;

for i = 1: 3: (h * 3) 
    
    i1 = i;
    i2 = i + 1; 
    i3 = i + 2;  

    % adjust indexing
    edge_i1 = all_edges(i1, 2);
    edge_i2 = all_edges(i2, 2);
    edge_i3 = all_edges(i3, 2);
    
    vertices_i1 = edge_list(edge_i1, :);
    vertices_i2 = edge_list(edge_i2, :);
    vertices_i3 = edge_list(edge_i3, :);

    triangle_points = unique([vertices_i1 vertices_i2 vertices_i3]);    
    x_p = [0 0 0];
    y_p = [0 0 0];

    x_p(1) = point_cloud(triangle_points(1), 1);
    y_p(1) = point_cloud(triangle_points(1), 2);

    x_p(2) = point_cloud(triangle_points(2), 1);
    y_p(2) = point_cloud(triangle_points(2), 2);

    x_p(3) = point_cloud(triangle_points(3), 1);
    y_p(3) = point_cloud(triangle_points(3), 2);
   

    triangle_list(tri_i, 1) = x_p(1);
    triangle_list(tri_i, 2) = x_p(2);
    triangle_list(tri_i, 3) = x_p(3);
    
    triangle_list(tri_i, 4) = y_p(1);
    triangle_list(tri_i, 5) = y_p(2);
    triangle_list(tri_i, 6) = y_p(3);

    tri_i = tri_i +1;
end





