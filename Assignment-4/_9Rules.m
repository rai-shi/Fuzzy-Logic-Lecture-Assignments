clc; clear all;
import runge.*
import limiter.*


% System Datas
A = [-4, 3; 1, -8];
B = [1, 0; 0, 1];
C = [1, 0];
D = [0];
% System Parameters
dt = 0.01;
tend = 1;
t0 = 0;
x0 = [0; 0];
U = [100; 0];
% Reference input value
r0 = 10;

% Fuzzy controller inputs
% The boundaries of the crisp sets e, de, and du
EMAX = r0; EMIN = -EMAX;
DEMAX = EMAX/10; DEMIN = -DEMAX;
DUMAX = 5; DUMIN = -5;

% Data for the membership functions
NLe = EMIN; NTe = NLe; NRe = 0; 
SLe = NTe; STe = 0; SRe = EMAX;
PLe = STe; PTe = EMAX; PRe = PTe;
NLde = DEMIN; NTde = NLde; NRde = 0;
SLde = NTde; STde = 0; SRde = DEMAX;
PLde = STde; PTde = DEMAX; PRde = PTde;
NLdu = DUMIN; NTdu = DUMIN; NRdu = 0;
SLdu = NTdu; STdu = 0; SRdu = DUMAX;
PLdu = STdu; PTdu = DUMAX; PRdu = PTdu;

% Membership matrix
DU = [NTdu NTdu STdu
      NTdu STdu PTdu
      STdu PTdu PTdu];

% Initial values for the error and the controller
e0 = EMAX; 
C = zeros(1, 1001); % Cumulative control action
ee = EMAX; dee = 0;

% Simulation Loop
k = 1;
while t0 < tend
    % Error and error change calculation
    E = limiter(EMIN, EMAX, ee); % limit E 
    FSE = Membership3([NLe NTe NRe], [SLe STe SRe], [PLe PTe PRe], E); % The membership value for each set in E is calculated.
    DE = limiter(DEMIN, DEMAX, dee); % limit DE 
    FSDE = Membership3([NLde NTde NRde], [SLde STde SRde], [PLde PTde PRde], DE); % The membership value for each set in DE is calculated.
    
    % Defuzzification
    FSDU = min(FSE' * ones(1, 3), ones(3, 1) * FSDE);
    DDU = FSDU .* DU;
    DUTOP1 = sum(DDU(:)); 
    DUTOP2 = sum(FSDU(:));
    DV = (DUTOP1/DUTOP2);

    % Control action calculation
    C(k+1) = C(k) + DV;
    CC = limiter(0, 5, C(k+1)); 
    UU0 = CC * U;

    % Solution of the state equation using Runge-Kutta.
    [x] = runge(A, B, UU0, x0, dt);
    t(k) = t0 + dt; t0 = t(k);
    r(k) = r0; y(k) = x0(1); 
    e(k) = r(k) - y(k); de(k) = e(k) - e0;
    ee = e(k); dee = de(k); e0 = e(k); 
    x0 = x; % Update the initial values for the next step.

    k = k + 1;
end

% Plotting
subplot(211)
plot(t, y, t, r); xlabel('time (sn)'); ylabel('y'); grid
subplot(212)
plot(t, e); xlabel('time (sn)'); ylabel('e'); grid


function FS = Membership3(A, B, C, x)
    % Calculates the membership values for the triangular membership functions A, B, and C.
    FS = zeros(1, 3);
    FS(1) = calculateTriangleMembership(x, A);
    FS(2) = calculateTriangleMembership(x, B);
    FS(3) = calculateTriangleMembership(x, C);
end

function membership = calculateTriangleMembership(X,trianle)
    x1 = trianle(1);
    xT = trianle(2);
    x2 = trianle(3);

    a=(X-x1)/(xT-x1);
    b=(x2-X)/(x2-xT);
    c=0;
    membership =max(min(a,b),c);
    return 
end
