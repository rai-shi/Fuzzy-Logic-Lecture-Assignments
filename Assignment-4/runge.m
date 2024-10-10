function [x]=runge(A,B,U,X0,dt)
%*********************************************************************
% Differential equation analysis using the Runge-Kutta method.
% C(2002) - Associate Professor Dr. İsmail H. ALTAŞ
% A: (n,n) state matrix  
% B: (n,n) input coefficient vector  
% U: (n,1) input vector  
% X0: initial values  
% dt: time increment

%*********************************************************************
% Assignment of initial values
BOY=size(A);  LS=BOY(1); LK=BOY(2);

% Runge-Kutta Steps
for n=1:LS
    x0(n)=X0(n);
    AA1(n)=0;
end
for n=1:LS
    for m=1:LK
        AA(n,m)=A(n,m)*x0(m);
        BB(n)=B(n,n)*U(n);
     end
end
for q=1:LS
    AA1(q)=AA1(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end

%-------------------------------------------------------------------- 
% Step 2
for n=1:LS
    x0(n)=X0(n)+AA1(n)/2;
    BB1(n)=0;
end
for n=1:LS
    for m=1:LK
        AA(n,m)=A(n,m)*x0(m);
        BB(n)=B(n,n)*U(n);
     end
end
for q=1:LS
    BB1(q)=BB1(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end

%--------------------------------------------------------------------   
% Step 3
for n=1:LS
    x0(n)=X0(n)+BB1(n)/2;
    CC1(n)=0;
end
for n=1:LS
    for m=1:LK
        AA(n,m)=A(n,m)*x0(m);
        BB(n)=B(n,n)*U(n);
     end
end
for q=1:LS
    CC1(q)=CC1(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end

%--------------------------------------------------------------------
% Step 4 
for n=1:LS
    x0(n)=X0(n)+CC1(n);
    DD1(n)=0;
end
for n=1:LS
    for m=1:LK
        AA(n,m)=A(n,m)*x0(m);
        BB(n)=B(n,n)*U(n);
     end
end
for q=1:LS
    DD1(q)=DD1(q)+ dt*(sum(AA(q,:))+sum(BB(q)));
end

%--------------------------------------------------------------------
% Result Calculation
for n=1:LS
    x(n)=X0(n)+(AA1(n)+2*BB1(n)+2*CC1(n)+DD1(n))/6;
end
