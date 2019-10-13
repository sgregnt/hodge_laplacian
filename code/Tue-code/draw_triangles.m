function fig = drawTriangles(triangle_list, color)
[h , w] = size(triangle_list);

for i=1:h
    x_p = triangle_list(i, 1:3);
    y_p = triangle_list(i, 4:6);
    obj = fill(x_p,y_p,'Color', color);
    alpha(obj, .2);
end