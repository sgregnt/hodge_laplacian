function fig = draw_arrows(ponits_array)
h = size(ponits_array, 1);
for i =1: h
    p1 = ponits_array(i, 1:2);          % First Point
    p2 = ponits_array(i, 3:4);          % Second Point
    dp = p2-p1;                         % Difference
    h = quiver(p1(1),p1(2),dp(1),dp(2),1, 'color', 'red');   
    set(h,'MaxHeadSize',0.5);
end
    


