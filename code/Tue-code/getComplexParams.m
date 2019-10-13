function [IncidenceMatrix, n_vertices, n_edges, n_triangles, A, B] = getComplexParams(point_cloud, boundaryMatricies)

A = boundaryMatricies{1, 2};
B = boundaryMatricies{1, 3};

n_vertices = size(point_cloud, 1);
n_edges = size(A, 2);
n_triangles = size(B, 2);

IncidenceMatrix = zeros(n_vertices + n_edges + n_triangles);

s_edges = n_vertices + 1;
f_edges = s_edges + n_edges - 1;
IncidenceMatrix(1: n_vertices, s_edges: f_edges) = A;

s_tri = f_edges + 1;
f_tri = s_tri + n_triangles - 1;
IncidenceMatrix(s_edges: f_edges, s_tri: f_tri) = B;