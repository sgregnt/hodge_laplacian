function eig_vals = getEigValsFromFiltration(vector)

n = size(vector, 2);
a = vector(1)
for i = 2: n
    if (b - a) > 
    disp(pers_par)
    boundaryMatricies = getVRboundaryMatricies(point_cloud, dim_max, pers_par, draw_graph);
    [IncidenceMatrix, n_vertices, n_edges, n_triangles, A, B] = getComplexParams(point_cloud, boundaryMatricies);
    L1 = A'* A + B * B';
    eig_val = getFirstNonZeroEig(L1);
    eig_vals(i) = eig_val;
end

