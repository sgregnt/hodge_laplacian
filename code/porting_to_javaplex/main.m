% inits 
clc; clear; close all;
import edu.stanford.math.plex4.*;

% construct graph
% get a new ExplicitSimplexStream
stream = api.Plex4.createExplicitSimplexStream();

% construct a circle with 5

stream.addVertex(0);
stream.addVertex(1);
stream.addVertex(2);
stream.addVertex(3);
stream.addVertex(4);

n1 = 5;  

stream.addElement([0, 1]);
stream.addElement([1, 2]);
stream.addElement([2, 3]);
stream.addElement([3, 0]);

n2 = 4;

% print out the total number of simplices in the complex
num_simplices = stream.getSize()

% get persistence algorithm over Z/2Z
persistence = api.Plex4.getModularSimplicialAlgorithm(3, 2);

% compute and print the intervals
circle_intervals = persistence.computeIntervals(stream);

% sparse boundary formal sum
d_1 = streams.utility.StreamUtility.createBoundaryMatrixAsDoubleSum(stream, 1);

% convert from sparse form to array
converter = api.Plex4.createHomMatrixConverter(stream, stream);
d_1_array = converter.toArray(d_1);
d_1_array_incidence = transpose(d_1_array);

% Boundary 1
B1 = get_boundary_k(stream, n1, n2);
L0 = transpose(B1)* B1;
SL0 = sparse(L0);
[V,D] = eig(L0);


% example with point cloud data

%% point cloud
r = 1; % radius
theta = 2 * pi.* linspace(0, 360, 8) ./ 360;  
m = r * [cos(theta') sin(theta')];

p = 4;
m = get_square(p);
m = [0 0; 0 0.5; 0 1; 
     0.5 1; 1 1;
     1 0.5; 1 0;
     0.5 0;
     ];
point_cloud = m;
[h, w] = size(m);

figure(1);
axis equal;
xlim([-1 2])
ylim([-1 2])
%%
m_space = metric.impl.EuclideanMetricSpace(m);

% point_cloud, max_d, max_t, num_divisions
max_dimension = 2;
max_filtration = 0.55;
num_divisions = 2; 
% add max filtration to the plots
circles_r = max_filtration/2.0;
radii = ones(1,h) * circles_r;
hold on;
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
scatter(point_cloud(:,1), point_cloud(:,2), 'o', 'filled');

hold off;
alpha(obj, .2)
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


