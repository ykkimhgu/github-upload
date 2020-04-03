
function [dxwdt] = mckFunc(t,x1,x2)
dxwdt=zeros(2,1); % column vector

%%% example 2
% m=10; k=2000; c=20;
% FinDC=100;


m=10; k=1000; c=140;
FinDC=100;

%%% example 3
Fin=FinDC*cos(2*pi*0.5*t);

% y=x1, z=x2;
dxwdt(1)=x2;  % ydot=z
dxwdt(2)=1/m*(Fin-c*x2-k*x1);  % zdot

