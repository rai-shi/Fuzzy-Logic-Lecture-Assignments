clear; clf;
x=-5:0.001:5; % Universal Set Of X
ar=4; 
cSG=3; % Right curve
aL=-4; 
cSL=-3; % Left curve

draw_sigmoid(x, ar, cSG, aL, cSL);


function draw_sigmoid(x, ar, cSG, aL, cSL)
    SIGMOR=(1./(1+exp(-ar*(x-cSG))));
    SIGMOL=(1./(1+exp(-aL*(x-cSL))));
    plot(x,SIGMOR,x,SIGMOL)
    xlabel('Universal Set Of X');
    ylabel('Sigmoid UF'); 
    grid on;
    hold off;    
end
