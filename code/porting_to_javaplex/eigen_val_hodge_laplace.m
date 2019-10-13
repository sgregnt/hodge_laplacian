% run main_triangles first


incidence_2_mat_only_edges = incidence_2_matrix;
%mmm = incidence_2_matrix;
% remoce columns with all zeros
incidence_2_mat_only_edges( :, ~any(incidence_2_mat_only_edges,1) ) = [];
incidence_2_matrix = incidence_2_mat_only_edges;