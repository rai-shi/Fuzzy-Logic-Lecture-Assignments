clear; 
clc;
xT=0;
w=1.5; 
x=-5:0.01:5;

draw_gaussian(x, xT, w);


function draw_gaussian(x, xT, w)
    a=(x-xT)/w; 
    b=-(1/2)*(a.^2);
    GAUSS=exp(b); 
    plot(x,GAUSS);
    xlabel('Crisp value of X'); 
    ylabel('Degree of Membership');
    grid on;
    hold off;    
end
