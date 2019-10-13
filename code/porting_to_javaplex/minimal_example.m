%% inits & point cloud genration 

clc; clear; close all;
import edu.stanford.math.plex4.*;

points_on_one_side = 4;
point_cloud = get_square(points_on_one_side);
[h, w] = size(point_cloud);

%% javaplex stream parameters

max_dimension = 2;
max_filtration = 0.6; 
num_divisions = 2; 
radius = max_filtration / 2.0;

%% Generate Vietoris Rips Stream

m_space = metric.impl.EuclideanMetricSpace(point_cloud);
stream = api.Plex4.createVietorisRipsStream(point_cloud, ... 
                                            max_dimension, ... 
                                            max_filtration, ...
                                            num_divisions);

%% plot Vietoris Rips filtration for persitant parameter max_filtration

figure(1)
radii = ones(1, h) * radius;
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
hold on;
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
alpha(obj, .2)
scatter(point_cloud(:,1), point_cloud(:,2), 'o', 'filled');
axis equal; xlim([-1 2]); ylim([-1 2]);
hold off;

%% extract boundary matrix for 1-simplices (edges)

dimension = 1;
d_1 = streams.utility.StreamUtility.createBoundaryMatrixAsDoubleSum(stream,...
                                                                    dimension);
converter = api.Plex4.createHomMatrixConverter(stream, stream);
boundary_1d_mat = converter.toArray(d_1);


%% draw 1-simplices.

% extract edges from boundary matrix
edge_list = find_edges(boundary_1d_mat);

[h,w] = size(edge_list);

% edges list
edges_points = zeros(h, 4);
for i = 1 : h
    % source point
    p_s = point_cloud(edge_list(i, 1), :);
    % target points
    p_t = point_cloud(edge_list(i, 2), :);
    edges_points(i, :) = [ p_s p_t];
end

figure(2);
marker_size = 15;
scatter(point_cloud(:,1), point_cloud(:,2), marker_size, 'og', 'filled');
hold on;
draw_arrows(edges_points);
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
alpha(obj, .2)
axis equal; xlim([-1 2]); ylim([-1 2]);
hold off;

%% extract boundary matrix for 2-simplices (triangles)

d_2 = streams.utility.StreamUtility.createBoundaryMatrixAsDoubleSum(stream, 2);
converter = api.Plex4.createHomMatrixConverter(stream, stream);
boundary_2d_mat = converter.toArray(d_2);
triangle_list = find_triangles(boundary_2d_mat, edge_list, point_cloud);

%% draw triangles
figure(3);
marker_size = 15;
scatter(point_cloud(:,1), point_cloud(:,2), marker_size, 'og', 'filled');
hold on;
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
alpha(obj, .2)
draw_triangles(triangle_list)
axis equal; xlim([-1 2]); ylim([-1 2]);
hold off;