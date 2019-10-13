%auxillary function to extract edges form incidence matrix
function edge_list = find_edges(incidence_matrix)

% sources
[row_s, col_s] = find(incidence_matrix < -0.1);
source = sortrows([row_s, col_s]);

% targets
[row_t, col_t] = find(incidence_matrix > 0.1);
target = sortrows([row_t, col_t]);

[h, w] = size(row_s);

edge_list = zeros(h, 2);

for i = 1: h
    % second index stores the zero dimension simplex index 
    edge_list(i,1) = source(i, 2);
    edge_list(i,2) = target(i, 2);
end
    

