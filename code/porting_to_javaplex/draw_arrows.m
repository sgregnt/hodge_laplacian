function fig = draw_arrows(ponits_array)
h = size(ponits_array, 1);
for i =1: h
    p1 = ponits_array(i, 1:2);          % First Point
    p2 = ponits_array(i, 3:4);          % Second Point
    dp = p2-p1;                         % Difference
    h = quiver(p1(1),p1(2),dp(1),dp(2),1, 'color', 'red');   
    set(h,'MaxHeadSize',0.5);
    
    % uncomment to plot coordinates
    %text(p1(1),p1(2), sprintf('(%.1f,%.1f)',p1), 'Color','red','FontSize',font_size);
    %text(p2(1),p2(2), sprintf('(%.1f,%.1f)',p2), 'Color','red','FontSize',font_size);
end
    


