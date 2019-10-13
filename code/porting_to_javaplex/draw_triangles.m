function fig = draw_triangles(triangle_list)
[h , w] = size(triangle_list);

for i=1:h
    x_p = triangle_list(i, 1:3);
    y_p = triangle_list(i, 4:6);
    obj = fill(x_p,y_p,'r');
    alpha(obj, .2);
end