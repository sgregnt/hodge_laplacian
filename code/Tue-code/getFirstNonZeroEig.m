%auxillary function to extract edges form incidence matrix
function [eig_val, eigen_vec] = getFirstNonZeroEig(mat)
[eigenmap, D] = eig(mat);
eigen_vec = diag(D);
eigen_sorted = sort(eigen_vec);
eigen_pos = eigen_sorted(round(eigen_sorted, 5) > 0);
eig_val = eigen_pos(1);

    


