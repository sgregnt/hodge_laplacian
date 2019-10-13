clc; clear; close all;
import edu.stanford.math.plex4.*;
stream = api.Plex4.createExplicitSimplexStream();

% generates point colud data on unit square in R2.
%
point_cloud = get_square(p);
[h, w] = size(m);

m_space = metric.impl.EuclideanMetricSpace(m);

max_dimension = 1;
max_filtration = 0.4; 
num_divisions = 2; 

circles_r = max_filtration/2.0;
radii = ones(1,h) * circles_r;

figure(1);
axis equal;
xlim([-1 2])
ylim([-1 2])
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
hold on;
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
scatter(point_cloud(:,1), point_cloud(:,2), 'o', 'filled');
hold off;
alpha(obj, .2)

1/0
stream = api.Plex4.createVietorisRipsStream(point_cloud, max_dimension, max_filtration);

d_1 = streams.utility.StreamUtility.createBoundaryMatrixAsDoubleSum(stream, 1);
converter = api.Plex4.createHomMatrixConverter(stream, stream);
d_1_array = converter.toArray(d_1);
d_1_array_incidence = transpose(d_1_array);
stream.getSize()

incidence_matrix = d_1_array;
edge_list = find_edges(incidence_matrix);

[h,w] = size(edge_list);
edges_points = zeros(h, 4);
for i = 1: h
    p_s = point_cloud(edge_list(i, 1), :);
    p_t = point_cloud(edge_list(i, 2), :);
    edges_points(i, :) = [ p_s p_t];
end

figure(2);
marker_size = 15;
scatter(point_cloud(:,1), point_cloud(:,2), marker_size, 'og', 'filled');
hold on;
draw_arrows(edges_points)
axis equal;
xlim([-1 2])
ylim([-1 2])
hold on;
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
hold off;
alpha(obj, .2)
hold off;


