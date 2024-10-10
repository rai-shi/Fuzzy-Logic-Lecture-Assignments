X = [-5,-4,-3,-2,-1,0,1,2,3,4,5];
A = [-4, -2, 0];
B = [-2, 0, 2];
C = [0, 2, 4];

draw_triangles(X, A, B, C);


function draw_triangles(X, A, B, C)
    % X: Space
    % A, B, C: Triangle parameters (x1, x2, x3)
    
    % Triangle A 
    Ax = [A(1), A(2), A(3)]; % x coodinates
    Ay = [0, 1, 0]; % y coodinates
    
    % Triangle B 
    Bx = [B(1), B(2), B(3)];
    By = [0, 1, 0];
    
    % Triangle C
    Cx = [C(1), C(2), C(3)];
    Cy = [0, 1, 0];
    
    figure;
    hold on;
    
    plot(X, zeros(size(X)), 'k--'); % X axis
    plot(Ax, Ay, 'r'); % A Triangle
    plot(Bx, By, 'g'); % B Triangle
    plot(Cx, Cy, 'b'); % C Triangle
    
    xlabel('X');
    ylabel('Y');
    title('Triangles');
    
    axis([min(X)-1 max(X)+1 -1 5]);
    grid on;
    hold off;
end
