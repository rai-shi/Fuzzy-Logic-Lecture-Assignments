clear; 
clc;
x1=-1; 
xT=0; 
x2=1;
x=-2:0.001:5;

draw_triangle(x, x1, xT, x2);


function draw_triangle(X, x1, xT, x2)
    a=(X-x1)/(xT-x1);
    b=(x2-X)/(x2-xT);
    c=0;
    membership =max(min(a,b),c);
    disp(membership);
    grid on;
    hold off;    
end