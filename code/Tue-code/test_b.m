close  all; clc; 

%% generate data on unit square

% number of data point on a side of the unit square
rng(4);
p = 4; 
tmp = get_square(p);
point_cloud = tmp + rand(size(tmp))* 0.025;
h = size(point_cloud, 1); 

%% plot data

figure(1)
hold on;
scatter(point_cloud(:,1), point_cloud(:,2), 'o', 'filled');
scatter(tmp(:,1), tmp(:,2), 'o', 'filled');

%% generate Vietoris-Ribs simplicial complex 

% filtration parameter
min_pers_par = 1.1 * sqrt(2) * 1/(p-1);
pers_par = min_pers_par + 0.1; 
circles_r = pers_par / 2;
radii = ones(1, h) * circles_r;
dim_max = 3;
draw_graph = 0;

boundaryMatricies = getVRboundaryMatricies(point_cloud, dim_max, pers_par, draw_graph);
[IncidenceMatrix, n_vertices, n_edges, n_triangles, A, B] = getComplexParams(point_cloud, boundaryMatricies);

%% plotVietoris-Ribs filtration. 

figure(2)
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
hold on;
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
scatter(point_cloud(:,1), point_cloud(:,2), 'o', 'filled');
alpha(obj, .2)
axis equal; xlim([-1 2]); ylim([-1 2]);
hold off;

%% retrieve edge of the complex

[edges_points, edge_list] = getEdges(A, point_cloud);

%% plot edges of the complex 

figure(3);
marker_size = 15;
scatter(point_cloud(:,1), point_cloud(:,2), marker_size, 'og', 'filled');
hold on;
draw_arrows(edges_points)
axis equal; xlim([-1 2]); ylim([-1 2]);
hold on;
viscircles(point_cloud, radii, 'Color','b', 'LineStyle',':');
obj = circles(point_cloud(:,1), point_cloud(:,2),radii,'color','black');
hold off;
alpha(obj, .2)
hold off;

%% retrieve triangles of the complex

triangle_list = getTriangles(B, edge_list, point_cloud);

%% plot triangles

figure(4);
marker_size = 15;
scatter(point_cloud(:,1), point_cloud(:,2), marker_size, 'og', 'filled');
hold on;
draw_triangles(triangle_list)
axis equal; xlim([-1 2]); ylim([-1 2]);
hold off;

%% calculate Hodge-1 Laplcian eigen-value

L1 = A'* A + B * B';
[eig_val, eigen_vec] = getFirstNonZeroEig(L1);
display(eig_val);

%% square

close all;
rng(10);
p = 4; 
tmp = get_square(p);
point_cloud = tmp + rand(size(tmp))* 0.01;
radii_pers = 0.4:0.0005:0.7;
pers_params = radii_pers * 2;
res = getEigValsFromFiltration(point_cloud, pers_params);

figure()
hax = subplot(3,2,[1 2]);  
plot(radii_pers, res)
title('Vietoris Rip filtration vs Hodge 1 laplacian non zero eigven value.')
xlabel('Filtration radius');
lab = ylabel('$ \lambda(\Delta_1)>0 $');
set(lab,'Interpreter','latex');
hold on;
p1 = 0.49;
p2 = 0.51;
p3 = 0.55; 
plotSample3Points(point_cloud, hax, p1, p2, p3,1);


%% dense square 

close all;
rng(10);
p = 6; 
tmp = get_square(p);
point_cloud = tmp + rand(size(tmp))* 0.025;
radii_pers = 0.4:0.005:0.7;
pers_params = radii_pers * 2;
res = getEigValsFromFiltration(point_cloud, pers_params);
figure()
hax = subplot(3,2,[1 2]);  
plot(radii_pers, res)
title('Vietoris Rip filtration vs Hodge 1 laplacian non zero eigven value.')
xlabel('Filtration radius');
lab = ylabel('$ \lambda(\Delta_1)>0 $');
set(lab,'Interpreter','latex');
hold on;
p1 = 0.49;
p2 = 0.51;
p3 = 0.55; 
plotSample3Points(point_cloud, hax, p1, p2, p3,1);

%% circle

close all;
rng(10);
p = 12; 
C = [0.5 0.5];
theta = 0:2 * pi/p:2 * pi; % the angle
tmp = [cos(theta') + C(1) sin(theta') + C(2)];
point_cloud = tmp + rand(size(tmp))* 0.025;
radii_pers = 0.8:0.0025:1.1;
pers_params = radii_pers * 2;
res = getEigValsFromFiltration(point_cloud, pers_params);
figure()
hax = subplot(3,2,[1 2]);  
plot(radii_pers, res)
title('Vietoris Rip filtration vs Hodge 1 laplacian non zero eigven value.')
xlabel('Filtration radius');
lab = ylabel('$ \lambda(\Delta_1)>0 $');
set(lab,'Interpreter','latex');
hold on;
p1 = 0.855;
p2 = 0.885;
p3 = 1; 
plotSample3Points(point_cloud, hax, p1, p2, p3, 1.3);

%% circle dense
close all;
rng(10);
p = 25; 
C = [0.5 0.5];
theta = 0:2 * pi/p:2 * pi; % the angle
tmp = [cos(theta') + C(1) sin(theta') + C(2)];
point_cloud = tmp + rand(size(tmp))* 0.025;
radii_pers = 0.8:0.0025:1.1;
pers_params = radii_pers * 2;
res = getEigValsFromFiltration(point_cloud, pers_params);
figure()
hax = subplot(3,2,[1 2]);  
plot(radii_pers, res)
title('Vietoris Rip filtration vs Hodge 1 laplacian non zero eigven value.')
xlabel('Filtration radius');
lab = ylabel('$ \lambda(\Delta_1)>0 $');
set(lab,'Interpreter','latex');
hold on;
p1 = 0.87;
p2 = 0.908;
p3 = 1; 
plotSample3Points(point_cloud, hax, p1, p2, p3, 1.3);

%% swiss roll 
close all;
rng(10); % for reproducibility
N = 30;
t = linspace(0, 1, p) * 7 * pi/2;
t = t';
t_norm = t./max(t);
h = 11 * rand(N,1);
tmp = [t_norm.* cos(t), t_norm.* sin(t)] + [0.5 0.5] ;
point_cloud = tmp;
radii_pers = 0.3:0.01:0.5;
pers_params = radii_pers * 2;
res = getEigValsFromFiltration(point_cloud, pers_params);
figure()
hax = subplot(3,2,[1 2]);  
plot(radii_pers, res)
title('Vietoris Rip filtration vs Hodge 1 laplacian non zero eigven value.')
xlabel('Filtration radius');
lab = ylabel('$ \lambda(\Delta_1)>0 $');
set(lab,'Interpreter','latex');
p1 = 0.31;
p2 = 0.4;
p3 = 0.48; 
plotSample3Points(point_cloud, hax, p1, p2, p3, 1.3);


%% open dense square

close all;
rng(10); % for reproducibility
p = 7; 
tmp = get_square(p);
point_cloud = tmp + rand(size(tmp))* 0.025;
figure()
hold on;
point_cloud = point_cloud(1:19,:);
radii_pers = 0.4:0.005:0.7;
pers_params = radii_pers * 2;
res = getEigValsFromFiltration(point_cloud, pers_params);
figure()
hax = subplot(3,2,[1 2]);  
plot(radii_pers, res)
title('Vietoris Rip filtration vs Hodge 1 laplacian non zero eigven value.')
xlabel('Filtration radius');
lab = ylabel('$ \lambda(\Delta_1)>0 $');
set(lab,'Interpreter','latex');
p1 = 0.49;
p2 = 0.51;
p3 = 0.55; 
plotSample3Points(point_cloud, hax, p1, p2, p3, 1.3);



%% multiple rectangles 
close all;
p = 4; 
tmp1 = 0.25 * get_square(p) + [0.4 0.4];
tmp2 = get_square(6);
tmp = [tmp1; tmp2];
point_cloud = tmp + rand(size(tmp))* 0.025;
figure()
hold on;
scatter(point_cloud(:,1), point_cloud(:,2), 'o', 'filled');
axis equal; xlim([-0.5 1.5]); ylim([-0.5 1.5]);

min_radii = min_pers_par /2;
radii_pers = 0.1:0.05:0.3;
pers_params = radii_pers * 2;
res = getEigValsFromFiltration(point_cloud, pers_params);

figure()
hax = subplot_tight(3,2, 1, [0.05 0.05]);  
plot(radii_pers, res)

p1 = 0.49;
p2 = 0.51;
p3 = 0.55; 
plotSample3Points(point_cloud, hax, p1,p2,p3);

tightfig;
