clear; 
clc;
xT=2; 
T=2*xT; 
D=T/2; 
x1=xT-D; 
x2=xT+D;
x=x1:0.001:x2; 
w=pi/T;

draw_sinusoid(xT, T, D, x1, x2, x, w);


function draw_sinusoid(xT, T, D, x1, x2, x, w)
    A=abs(sin(w*x)); % sinus function
    plot(x,A); 
    xlabel('Crisp value of X'); 
    ylabel('SINUSOID UF');
    grid on;
    hold off;    
end



