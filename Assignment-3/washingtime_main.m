% ********** INPUTS AND OUTPUTS **********
% Mud Sets
MUD = [0,10,20,30,40,50,60,70,80,90,100];
SD = [0,0,50];
MD = [0,50,100];
LD = [50,100,100];

MUD_ = [SD;MD;LD;];
mud_title = "Mud Sets";

% Axunge Sets
AXUNGE = [0,10,20,30,40,50,60,70,80,90,100];
NG = [0,0,50];
MG = [0,50,100];
LG = [50,100,100];

AXUNGE_ = [NG; MG; LG;];
axunge_title = "Axunge Sets";

% Time Sets
TIME = [0,10,20,30,40,50,60];
VS = [0,0,10];
S = [0,10,25];
M = [10,25,40];
L = [25,40,60];
VL = [40,60,60];

TIME_ = [VS;S;M;L;VL];
time_title = "Time Sets";

draw_triangles(MUD, MUD_, mud_title);
draw_triangles(AXUNGE, AXUNGE_, axunge_title);
draw_triangles(TIME, TIME_, time_title);

% ********** FUZZICATION OF INPUTS **********
input_mud = 60;
disp(" Membership Degree's for Mud Sets, SD-MD-LD");
MuSD = calculateMembership(input_mud,SD);
MuMD = calculateMembership(input_mud,MD);
MuLD = calculateMembership(input_mud,LD);

input_axunge = 70;
disp("Membership Degree's for Axunge Sets, NG-MG-LG");
MuNG = calculateMembership(input_axunge,NG);
MuMG = calculateMembership(input_axunge,MG);
MuLG = calculateMembership(input_axunge,LG);

% ********** RULES **********
% Rules 
%        SD    MD    LD  
% NG  [  VS    M     L
% MG     S     M     L
% LG     M     L     VL ]

% VS 0 S 10 M 25 L 40 VL 60
% The peak values of the sets to which the rule outputs belong.
K = [ 0 25 40
      10 25 40
      25 40 60];

% ********** RULE PROCESSING **********
% The minimum of the inputs is taken for each output of the rules in the rule table.
MU = [min(MuNG, MuSD) min(MuNG, MuMD) min(MuNG, MuLD)
      min(MuMG, MuSD) min(MuMG, MuMD) min(MuMG, MuLD)
      min(MuLG, MuSD) min(MuLG, MuMD) min(MuLG, MuLD) ]

% ********** RESULTS **********
% The x value of the peak value of the output set to which each output in the rule table belongs is multiplied by the output (given in the K variable).
MUK = [MU(1,1)*K(1,1) MU(1,2)*K(1,2) MU(1,3)*K(1,3)
       MU(2,1)*K(2,1) MU(2,2)*K(2,2) MU(2,3)*K(2,3) 
       MU(3,1)*K(3,1) MU(3,2)*K(3,2) MU(3,3)*K(3,3) ]

% ********** DEFUZZICATION **********
% Defuzzification using the centroid method.
sum_of_areas(MU,MUK);

% average of maximum 
maximum = max(max(MU));
z1 = maximum*15+10;
z2 = -(maximum*15-40);
zMORT = (z1+z2)/2;
disp("Actual output using the maximum average method: ");
disp(zMORT);


function sum_of_areas(MU, MUK)
    TOP1 = 0; 
    TOP2 = 0;
    for n=1:3
        for m=1:3
            TOP1 = TOP1 + MUK(n,m);
            TOP2 = TOP2 + MU(n,m);
        end
    end
    disp("Actual output using the centroid method: ");
    z = TOP1/TOP2
end

function draw_triangles(X, U, title_)
    % X: Space
    % U : Set lists  
    figure;
    hold on;
    plot(X, zeros(size(X)), 'k--'); % X axis
    colors = {'r', 'g', 'b', 'y', 'm'};

    for i = 1:length(U)
        x = zeros(1,3);
        y = zeros(1,3); % Y vector to 
        for j = 1:3
            x(j) = U(i,j);
        end
        if i == 1 % Right boundary triangle              
            y = [1,1,0];
        elseif i == length(U)              
            y = [0,1,1]; % Left boundary triangle 
        else   
            y = [0,1,0]; % Middle triangle
        end

        plot(x, y, colors{i}); % Triangle i
    end
    xlabel('Set');
    ylabel('Membership Degree');
    title(title_);
    
    axis([min(X)-1 max(X)+1 -1 5]);
    grid on;
    hold off;
end

function membership = calculateMembership(X,trianle)
    x1 = trianle(1);
    xT = trianle(2);
    x2 = trianle(3);

    a=(X-x1)/(xT-x1);
    b=(x2-X)/(x2-xT);
    c=0;
    membership =max(min(a,b),c);
    disp(membership);
    return 
end