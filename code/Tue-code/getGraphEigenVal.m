function [eigen_pos1] = getGraphEigenVal(simp_comp, pers_par, dim_max, draw_graph) 

boundaryMatricies = getVRboundaryMatricies(simp_comp, dim_max, pers_par, draw_graph);

A = boundaryMatricies{1, 2};
B = boundaryMatricies{1, 3};

L1 = A'*A + B*B';

[eigenmap, D] = eig(L1);

eigen_vec = diag(D);
eigen_sorted = sort(eigen_vec);
eigen_pos = eigen_sorted(round(eigen_sorted, 5) > 0);

eigen_pos1 = eigen_pos(1,1);
