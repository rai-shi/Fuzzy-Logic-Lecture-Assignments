function y=limiter(alt,ust,x)
% C(2001) - Associate Professor Dr. İsmail H. ALTAŞ
% Ensures that a variable stays within its lower and upper bounds.
if x <= alt
   y=alt;
elseif x>= ust
   y=ust;
else
   y=x;
end
