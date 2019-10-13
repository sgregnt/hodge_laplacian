% tests
close  all;
clc; 

figure()
p = 4; 
point_cloud = get_square(p);
[h,w] = size(point_cloud); 
circles_r = 3;
radii = ones(1, h) * circles_r;
hold on;


scatter(point_cloud(:,1), point_cloud(:,2), 'o', 'filled');
simp_comp = point_cloud + rand(size(point_cloud)) * 0.01;
scatter(simp_comp(:,1), simp_comp(:,2), 'o', 'filled');
a = squareXX{4};
scatter(a(:,1), a(:,2), 'o', 'filled');
a = squareXX{10};
scatter(a(:,1), a(:,2), 'o', 'filled');

pers_par = 3; 
dim_max = 3;
draw_graph = 1;
debug = 0;

if debug == 1

    getGraphEigenVal(simp_comp, pers_par, dim_max, draw_graph);

    pers_par = 4;
    getGraphEigenVal(simp_comp, pers_par, dim_max, draw_graph);

    pers_par = 8; 
    getGraphEigenVal(simp_comp, pers_par, dim_max, draw_graph);

    
end 

s = 0.05;
pers_parms = s:s:1;
pers_parms = 2 * 1/p; 
n = size(pers_parms);
eig_vals = zeros(size(pers_parms));
draw_graph = 0;

for i=1:n(1,2) 
    pers_par = pers_parms(i);    
    x = getGraphEigenVal(simp_comp, pers_par, dim_max, draw_graph);
    eig_vals(1, i) = x(1,1);
end
0
figure();
x_vals = pers_parms;
y_vals = eig_vals;
plot(x_vals, y_vals);
% 1/0
% boundaryMatricies = getVRboundaryMatricies(simp_comp, dim_max, pers_par, draw_graph);
% A = boundaryMatricies{1,2};
% B = boundaryMatricies{1,3};
% L1 = A'*A + B*B';
% [eigenmap, D] = eig(L1);
% eigen_vec = diag(D);
% eigen_sorted = sort(eigen_vec);
% eigen_pos = eigen_sorted(round(eigen_sorted, 5) > 0);
% display(eigen_pos(1));
% %BoundaryMatricies{j}=boundaryMatricies;
% pers_par = 5.05;
% draw_graph = 1;
% x = getGraphEigenVal(simp_comp, pers_par, dim_max, draw_graph);
% disp(x);
% 
% pers_par = 4.95;
% draw_graph = 1;
% x = getGraphEigenVal(simp_comp, pers_par, dim_max, draw_graph);
% disp(x);