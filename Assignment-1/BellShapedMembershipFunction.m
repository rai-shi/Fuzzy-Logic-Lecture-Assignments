clear; 
clc;
xT=0; 
d=2; 
m=4;
x=-5:0.01:5;

draw_bell_shaped(x, xT, d, m);


function draw_bell_shaped(x, xT, d, m)
    A = (abs((x-xT)/d)).^(2*m);
    BELL=1./(1.+A);
    plot(x,BELL);
    xlabel('Crisp value of X'); 
    ylabel('Degree of Membership');
    grid on;
    hold off;    
end
