%% Equantions 
n=6;      %number of state
m=6;      %number of output state

f=@(x)[x(1);x(2);x(3);x(4);x(5);x(6)];  % nonlinear state equations
h=@(x)[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2];
x0=[0 0 0 0 0 0];

%% H jacobian 2 lasers
clear all;
syms x1 x2 y1 y2 L z1 z2 roll pitch yaw dx dy dz
H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2];
H_jac=jacobian(H,[roll pitch yaw dx dy dz])
rank(H_jac)

f=[roll; pitch; yaw; dx; dy; dz];
A_jac=jacobian(f,[roll pitch yaw dx dy dz])

%% finding rank numerical data 2 lasers
clear all;
x=[0.1 0.1 0.1 0.1 10 50];
L=100; z1=50; z2=50; Y3=20;
x1=100;y1=-10; x2=-100;y2=-10; x3=0; y3=20;
roll=x(1);pitch=x(2); yaw=x(3); dx=x(4); dy=x(5); dz=x(6);

H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2];
rank(H)

H_jac = [  y1*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y1*cos(pitch)*cos(yaw)*sin(roll) - x1*cos(yaw)*sin(pitch), - y1*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x1*cos(pitch)*sin(yaw), 1, 0, 0;
 -y1*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y1*cos(pitch)*sin(roll)*sin(yaw) - x1*sin(pitch)*sin(yaw),   x1*cos(pitch)*cos(yaw) - y1*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0;
                                  y1*cos(pitch)*cos(roll),                 - x1*cos(pitch) - y1*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1;
  y2*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y2*cos(pitch)*cos(yaw)*sin(roll) - x2*cos(yaw)*sin(pitch), - y2*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x2*cos(pitch)*sin(yaw), 1, 0, 0;
 -y2*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y2*cos(pitch)*sin(roll)*sin(yaw) - x2*sin(pitch)*sin(yaw),   x2*cos(pitch)*cos(yaw) - y2*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0;
                                  y2*cos(pitch)*cos(roll),                 - x2*cos(pitch) - y2*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1]

rank(H_jac)


%% H jacobian with 2 EDM+1laser
clear all;
syms x1 x2 y1 y2 x3 y3  L Y3 z1 z2 roll pitch yaw dx dy dz
H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y3+0+dy-Y3];
H_jac=jacobian(H,[roll pitch yaw dx dy dz])

%% H jacobian Rank with 2 EDM+1laser
clear all;
x=[0 0.000 0 0 0 50];
L=100; z1=50; z2=50; Y3=20;
x1=100;y1=0; x2=-100;y2=0; x3=0; y3=20;
roll=x(1);pitch=x(2); yaw=x(3); dx=x(4); dy=x(5); dz=x(6);

H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y3+0+dy-Y3];
rank(H)

H_jac =[ y1*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y1*cos(pitch)*cos(yaw)*sin(roll) - x1*cos(yaw)*sin(pitch), - y1*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x1*cos(pitch)*sin(yaw), 1, 0, 0;
 -y1*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y1*cos(pitch)*sin(roll)*sin(yaw) - x1*sin(pitch)*sin(yaw),   x1*cos(pitch)*cos(yaw) - y1*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0;
                                  y1*cos(pitch)*cos(roll),                 - x1*cos(pitch) - y1*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1;
  y2*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y2*cos(pitch)*cos(yaw)*sin(roll) - x2*cos(yaw)*sin(pitch), - y2*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x2*cos(pitch)*sin(yaw), 1, 0, 0;
 -y2*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y2*cos(pitch)*sin(roll)*sin(yaw) - x2*sin(pitch)*sin(yaw),   x2*cos(pitch)*cos(yaw) - y2*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0;
                                  y2*cos(pitch)*cos(roll),                 - x2*cos(pitch) - y2*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1;
  y3*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y3*cos(pitch)*cos(yaw)*sin(roll) - x3*cos(yaw)*sin(pitch), - y3*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x3*cos(pitch)*sin(yaw), 1, 0, 0;
 -y3*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y3*cos(pitch)*sin(roll)*sin(yaw) - x1*sin(pitch)*sin(yaw),   x1*cos(pitch)*cos(yaw) - y3*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0]
 
rank(H_jac)


%% H jacobian 2 EDM+1laser - 6 eq
clear all;
syms x1 x2 y1 y2 x3 y3  L Y3 z1 z2 roll pitch yaw dx dy dz
H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx];
rank(H)
H_jac=jacobian(H,[roll pitch yaw dx dy dz])

%% finding rank numerical data 2 EDM+1laser - 6eq
clear all;
x=[0 0 0 0 0 50];
L=100; z1=50; z2=50; Y3=20;
x1=100;y1=0; x2=-100;y2=0; x3=0; y3=20;
roll=x(1);pitch=x(2); yaw=x(3); dx=x(4); dy=x(5); dz=x(6);

H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx];
rank(H)

H_jac =[y1*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y1*cos(pitch)*cos(yaw)*sin(roll) - x1*cos(yaw)*sin(pitch), - y1*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x1*cos(pitch)*sin(yaw), 1, 0, 0;
                                  y1*cos(pitch)*cos(roll),                 - x1*cos(pitch) - y1*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1;
  y2*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y2*cos(pitch)*cos(yaw)*sin(roll) - x2*cos(yaw)*sin(pitch), - y2*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x2*cos(pitch)*sin(yaw), 1, 0, 0;
 -y2*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y2*cos(pitch)*sin(roll)*sin(yaw) - x2*sin(pitch)*sin(yaw),   x2*cos(pitch)*cos(yaw) - y2*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0;
                                  y2*cos(pitch)*cos(roll),                 - x2*cos(pitch) - y2*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1;
  y3*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y3*cos(pitch)*cos(yaw)*sin(roll) - x3*cos(yaw)*sin(pitch), - y3*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x3*cos(pitch)*sin(yaw), 1, 0, 0];
rank(H_jac)

%% H jacobian with 3 EDMs
clear all;
syms x1 x2 y1 y2 x3 y3  L Y3 z1 z2 z3 roll pitch yaw dx dy dz
H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y3+0+dy-Y3;
    -sin(pitch)*x3+(cos(pitch)*sin(roll))*y3+0+dz-z3];
H_jac=jacobian(H,[roll pitch yaw dx dy dz])

%% H jacobian Rank with 3 EDMs
clear all;
x=[0 0.000 0 0 0 50];
L=100; z1=50; z2=50; z3=50; Y3=-20;
x1=100;y1=0; x2=-100;y2=0; x3=0; y3=20;
roll=x(1);pitch=x(2); yaw=x(3); dx=x(4); dy=x(5); dz=x(6);

H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    -sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y3+0+dy-Y3;
    -sin(pitch)*x3+(cos(pitch)*sin(roll))*y3+0+dz-z3];
rank(H)

%% H jacobian with 3 EDMs
clear all;
syms x1 x2 y1 y2 x3 y3  L Y3 z1 z2 z3 roll pitch yaw dx dy dz

H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    %cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    %-sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    %x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y3+0+dy-Y3;
    -sin(pitch)*x3+(cos(pitch)*sin(roll))*y3+0+dz-z3];

H_jac=jacobian(H,[roll pitch yaw dx dy dz])

%% H jacobian Rank with 3 EDMs - 6 eq
clear all;
x=[0 0.000 0 0 0 50];
L=100; z1=50; z2=50; z3=50; Y3=-20;
x1=100;y1=0; x2=-100;y2=0; x3=0; y3=20;
roll=x(1);pitch=x(2); yaw=x(3); dx=x(4); dy=x(5); dz=x(6);

H=[x1*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y1+0+dx-L;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y1+0+dy;
    -sin(pitch)*x1+(cos(pitch)*sin(roll))*y1+0+dz-z1; 
    x2*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y2+0+dx+L;
    %cos(pitch)*sin(yaw)*x2+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y2+0+dy;
    %-sin(pitch)*x2+(cos(pitch)*sin(roll))*y2+0+dz-z2;
    %x3*cos(pitch)*cos(yaw)+(-cos(roll)*sin(yaw)+sin(roll)*sin(pitch)*cos(yaw))*y3+0+dx;
    cos(pitch)*sin(yaw)*x1+(cos(roll)*cos(yaw)+sin(roll)*sin(pitch)*sin(yaw))*y3+0+dy-Y3;
    -sin(pitch)*x3+(cos(pitch)*sin(roll))*y3+0+dz-z3];
rank(H)

H_jac =[  y1*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y1*cos(pitch)*cos(yaw)*sin(roll) - x1*cos(yaw)*sin(pitch), - y1*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x1*cos(pitch)*sin(yaw), 1, 0, 0;
 -y1*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y1*cos(pitch)*sin(roll)*sin(yaw) - x1*sin(pitch)*sin(yaw),   x1*cos(pitch)*cos(yaw) - y1*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0;
                                  y1*cos(pitch)*cos(roll),                 - x1*cos(pitch) - y1*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1;
  y2*(sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)), y2*cos(pitch)*cos(yaw)*sin(roll) - x2*cos(yaw)*sin(pitch), - y2*(cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw)) - x2*cos(pitch)*sin(yaw), 1, 0, 0;
 -y3*(cos(yaw)*sin(roll) - cos(roll)*sin(pitch)*sin(yaw)), y3*cos(pitch)*sin(roll)*sin(yaw) - x1*sin(pitch)*sin(yaw),   x1*cos(pitch)*cos(yaw) - y3*(cos(roll)*sin(yaw) - cos(yaw)*sin(pitch)*sin(roll)), 0, 1, 0;
                                  y3*cos(pitch)*cos(roll),                 - x3*cos(pitch) - y3*sin(pitch)*sin(roll),                                                                                  0, 0, 0, 1]
                              
rank(H_jac)


%% H jacobian Rank with 3 Points - 6 eq
clear all;
x=[0 0.000 0 0 0 50];
L=100; z1=50; z2=50; z3=50; Y3=-20;
x1=100;y1=0; x2=-100;y2=0; x3=0; y3=20;
roll=x(1);pitch=x(2); yaw=x(3); dx=x(4); dy=x(5); dz=x(6);



h=@(x)[x1*cos(x(2))*cos(x(3))+(-cos(x(1))*sin(x(3))+sin(x(1))*sin(x(2))*cos(x(3)) )*y1+ z1*( sin(x(1))*sin(x(3))+cos(x(3))*sin(x(2))*cos(x(1)) ) +x(4)-X1;
    cos(x(2))*sin(x(3))*x1+( cos(x(1))*cos(x(3))+sin(x(1))*sin(x(2))*sin(x(3)) )*y1+z1*( -sin(x(1))*cos(x(3))+sin(x(3))*sin(x(2))*cos(x(1)) )+x(5)-Y1;
    -sin(x(2))*x1+(cos(x(2))*sin(x(1)))*y1+z1*( cos(x(2))*cos(x(1)) )+x(6)-Z1; 
    x2*cos(x(2))*cos(x(3))+(-cos(x(1))*sin(x(3))+sin(x(1))*sin(x(2))*cos(x(3)) )*y2+z2*( sin(x(1))*sin(x(3))+cos(x(3))*sin(x(2))*cos(x(1)) )+x(4)-X2;
    cos(x(2))*sin(x(3))*x2+( cos(x(1))*cos(x(3))+sin(x(1))*sin(x(2))*sin(x(3)) )*y2+z2*( -sin(x(1))*cos(x(3))+sin(x(3))*sin(x(2))*cos(x(1)) )+x(5)-Y2;
    -sin(x(2))*x2+(cos(x(2))*sin(x(1)))*y2+z2*( cos(x(2))*cos(x(1)) )+x(6)-Z2;
    x3*cos(x(2))*cos(x(3))+(-cos(x(1))*sin(x(3))+sin(x(1))*sin(x(2))*cos(x(3)) )*y3+z3*( sin(x(1))*sin(x(3))+cos(x(3))*sin(x(2))*cos(x(1)) )+x(4)-X3;
    cos(x(2))*sin(x(3))*x3+( cos(x(1))*cos(x(3))+sin(x(1))*sin(x(2))*sin(x(3)) )*y3+z3*( -sin(x(1))*cos(x(3))+sin(x(3))*sin(x(2))*cos(x(1)) )+x(5)-Y3;
    -sin(x(2))*x3+(cos(x(2))*sin(x(1)))*y3+z3*( cos(x(2))*cos(x(1)) )+x(6)-Z3];
