function eig_vals = getTriangles(point_cloud, pers_params)


n = size(pers_params, 1)
eig_vals = zeros(size(pers_params)) 
draw_graph = 0;
dim_max = 3;


for i = 1: n
    pers_par = pers_params(i);
    boundaryMatricies = getVRboundaryMatricies(point_cloud, dim_max, pers_par, draw_graph);
    [IncidenceMatrix, n_vertices, n_edges, n_triangles, A, B] = getComplexParams(point_cloud, boundaryMatricies);
    L1 = A'* A + B * B';
    eig_val = getFirstNonZeroEig(L1);
    eig_vals(i) = eig_val;
end

