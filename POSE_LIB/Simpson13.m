function I = Simpson13(y,a,b)
% Simpson 1/3 numerically integrate using the Composite Simpson Method.
% Input Variables:
% Fun Name for the function to be integrated.
% (Fun is assumed to be written with element-by-element calculations.).
% a  Lower limit of integration.
% b  Upper limit of integration.
% N  Number of subintervals. Must be even 
% N=2 for basic Simpson. 
%
% Output Variable:
% I  Value of the integral.
 
% Check for the valid argument and if N is even
% if (nargin ~=4)
%     error(message('Invalid Argument'));
% end
% if mod(N,2)
%     error(message('N must be even'));
% end

%x=a:h:b;
%y=Fun(x);
%x=1:1:length(y);
% Basic
%I=(h/3)*(Fun(a)+4*Fun((a+b)/2)+ Fun(b));
% Composite
N=length(y)-1;
h = (b-a)/N;
I=h/3*(y(1)+4*sum(y(2:2:N))+2*sum(y(3:2:(N-1)))+y(N+1));









