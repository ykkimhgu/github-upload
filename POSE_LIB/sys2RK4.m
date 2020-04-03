function [x, y, z] = sys2RK4(OdeFunc,a,b,h,yINI,zINI)
% Sys2ODEsRK4 solves a system of two first-order initial value ODEs using
% second-order Ronge-Kutta method.
% The independent variable is x, and the dependent variables are y and z.
% Input variables:
% ODE1   Name of a function file that calculates dy/dx.
% ODE2   Name of a function file that calculates dz/dx.
% a      The first value of x.
% b      The last value of x.
% h      The size of a increment.
% yINI     The initial value of y.
% zINI     The initial value of z.
% Output variable:
% x      A vector with the x coordinate of the solution points.
% y      A vector with the y coordinate of the solution points.
% z      A vector with the z coordinate of the solution points.

x(1) = a; y(1) = yINI;  z(1) = zINI;
N = (b - a)/h;
for i = 1:N
    x(i+1) = x(i) + h;    
    K1 = OdeFunc(x(i),y(i), z(i));
    Ky1 = K1(1);
    Kz1 = K1(2);
    
    xhalf = x(i) + h/2;
    yK2 = y(i) + Ky1*h/2;
    zK2 = z(i) + Kz1*h/2;    
    K2=OdeFunc(xhalf,yK2, zK2);     
    Ky2 = K2(1);
    Kz2 = K2(2);
    
    yK3 = y(i) + Ky2*h/2;
    zK3 = z(i) + Kz2*h/2;    
    K3 = OdeFunc(xhalf,yK3,zK3);
    Ky3 = K3(1);
    Kz3 = K3(2);
    
    yK4 = y(i) + Ky3*h;
    zK4 = z(i) + Kz3*h;    
    K4 = OdeFunc(x(i+1),yK4,zK4);
    Ky4 = K4(1);
    Kz4 = K4(2);
    
    y(i+1) = y(i) + (Ky1 + 2*Ky2 + 2*Ky3 + Ky4)*h/6;
    z(i+1) = z(i) + (Kz1 + 2*Kz2 + 2*Kz3 + Kz4)*h/6;
    
end