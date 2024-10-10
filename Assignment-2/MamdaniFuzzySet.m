% Temperature
temperature = 25;
FT = [-20,-20,0];
CT = [-20,0,20];
WT = [0,20,40];
HT = [20,40,40];

% Solar Radiation
irradation = 75;
LI = [50,50,100];
SuI = [50,100,150];
GI = [100,150,200];
HI = [150,200,200];

disp("Temperature Sets Membership Degree");
MuFT = calculateMembership(temperature,FT);
MuCT = calculateMembership(temperature,CT);
MuWT = calculateMembership(temperature,WT);
MuHT = calculateMembership(temperature,HT);
disp("Solar Radiation Sets Membership Degree");
MuLI = calculateMembership(irradation,LI);
MuSuI = calculateMembership(irradation,SuI);
MuGI = calculateMembership(irradation,GI);
MuHI = calculateMembership(irradation,HI);

% Rules 
%        LI   SuI   GI   HI
% FT   [  0    0.3   0.6  1
% CT      0    0.3   0.6  1
% WT      0    0.3   0.6  1
% HT      0    0.3   0.6  1  ]
K = [
    0 0.3 0.6 1
    0 0.3 0.6 1
    0 0.3 0.6 1
    0 0.3 0.6 1
    ];

% Rule Processing,
%          MuLI MuSuI MuGI MuHI
% MuFT   [  
% MuCT      min()
% MuWT     
% MuHT       ]

MU = [ min(MuFT, MuLI) min(MuFT, MuSuI) min(MuGI, MuGI) min(MuFT, MuHI)
    min(MuCT, MuLI) min(MuCT, MuSuI) min(MuCT, MuGI) min(MuCT, MuHI)
    min(MuWT, MuLI) min(MuWT, MuSuI) min(MuWT, MuGI) min(MuWT, MuHI)
    min(MuHT, MuLI) min(MuHT, MuSuI) min(MuHT, MuGI) min(MuHT, MuHI) ]

% Results
MUK = [MU(1,1)*K(1,1) MU(1,2)*K(1,2) MU(1,3)*K(1,3) MU(1,4)*K(1,4)
    MU(2,1)*K(2,1) MU(2,2)*K(2,2) MU(2,3)*K(2,3) MU(2,4)*K(2,4)
    MU(3,1)*K(3,1) MU(3,2)*K(3,2) MU(3,3)*K(3,3) MU(3,4)*K(3,4)
    MU(4,1)*K(4,1) MU(4,2)*K(4,2) MU(4,3)*K(4,3) MU(4,4)*K(4,4) ]

% Defuzzification (the method of total areas)
TOP1 = 0; 
TOP2 = 0;
for n=1:3
    for m=1:3
        TOP1 = TOP1 + MUK(n,m);
        TOP2 = TOP2 + MU(n,m);
    end
end
disp("Result: ")
z = TOP1/TOP2

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