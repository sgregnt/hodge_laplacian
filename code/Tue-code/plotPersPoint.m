function [IncidenceMatrix, n_vertices, n_edges, n_triangles, A, B] = plotPersPoint(point_cloud, pers_par, color, scale)

h = size(point_cloud, 1); 
circles_r = pers_par / 2;
radii = ones(1, h) * circles_r;
draw_graph = 0;
dim_max = 3;
boundaryMatricies = getVRboundaryMatricies(point_cloud, dim_max, pers_par, draw_graph);
[IncidenceMatrix, n_vertices, n_edges, n_triangles, A, B] = getComplexParams(point_cloud, boundaryMatricies);
[edges_points, edge_list] = getEdges(A, point_cloud);
triangle_list = getTriangles(B, edge_list, point_cloud);
marker_size = 15;
scatter(point_cloud(:,1), point_cloud(:,2), marker_size, 'og', 'filled');
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
hold on;
drawTriangles(triangle_list, color)
axis equal; xlim(scale * [-0.4 1.4]); ylim(scale * [-0.4 1.4]);
hold off;