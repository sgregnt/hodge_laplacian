function matrix = get_square(n)

d = 1;
line = transpose(linspace(0, d, n));
side1 = zeros(n, 2);
side2 = d * ones(n, 2);
side3 = zeros(n, 2);
side4 = d * ones(n, 2);



side1(:,1) = line;
side2(:,1) = line;
side3(:,2) = line;
side4(:,2) = line;

matrix_all = [side1; side2; side3; side4];
matrix = unique(matrix_all,  'rows', 'stable');



