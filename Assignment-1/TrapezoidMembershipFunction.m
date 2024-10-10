clear; 
clc;
x1=-1.5; 
xT1=-0.5; 
xT2=0.5; 
x2=1.5;
x=-2:0.01:2;

draw_trapezoid(x, x1, xT1, xT2, x2);


function draw_trapezoid(x, x1, xT1, xT2, x2)
    a=(x-x1)/(xT1-x1);
    b=1;
    c=(x2-x)/(x2-xT2);
    d=0;
    min_value=min(a,c);
    membership=max(min(min_value,b),d);
    plot(x,membership)
    xlabel('Crisp value of X'); 
    ylabel('Degree of Membership');
    grid on;
    hold off;    
end
