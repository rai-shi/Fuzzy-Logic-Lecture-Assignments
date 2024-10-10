clear; 
clc;
xT=0; 
d=2; 
m=1; 
POW1= 2*m;
x=-5:0.01:5;

draw_CAUCHY(x, xT, d, m, POW1);


function draw_CAUCHY(x, xT, d, m, POW1)
    CAUCH=((x-xT)/d).^POW1;
    CAUCHY=1./(1.+CAUCH);
    plot(x,CAUCHY)
    xlabel('Crisp value of X'); 
    ylabel('Degree of Membership');
    grid on;
    hold off;    
end
