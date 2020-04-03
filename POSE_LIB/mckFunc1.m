
function [dxwdt] = mckFunc1(t,x)
dxwdt=zeros(2,1); % column vector

%%% example 1
Fin=0;
m=1;
c=2*0.7;
k=48;

%%% example 2
m=10; k=4000; c=20;
FinDC=10000;

%%% example 3
Fin=FinDC*cos(2*pi*10*t);

dxwdt(1)=x(2);
dxwdt(2)=1/m*(Fin-c*x(2)-k*x(1));

