function J=getJacobian(z,sP)

if (nargin==1)
    % sP
    sP1=[-50, 50, 10]'; sP2=[50, 50, 10]'; sP3=[-50, -50, 10]';
    sP4=[50, -50, 10]'; 
    %sP5=[50, 50, -100]'; %sP6=[50, -50, -100]';
    sP1=[-0.2, 0.4, 0]'; sP2=[0.2, 0.4, 0]'; 
    sP3=[0.2, -0.4, 0]'; sP4=[-0.2, -0.4, 0]'; 

    sP=[sP1 sP2 sP3 sP4];
    np=4;
    sP=[sP;ones(1,np)];
end


% Example code
% syms x y z
% jacobian([x*y*z, y^2, x + z], [x, y, z])

% syms a b c dx dy dz Px Py Pz
% M=[ cos(b)*cos(c), cos(c)*sin(a)*sin(b) - cos(a)*sin(c), sin(a)*sin(c) + cos(a)*cos(c)*sin(b), dx;...
% cos(b)*sin(c), cos(a)*cos(c) + sin(a)*sin(b)*sin(c), cos(a)*sin(b)*sin(c) - cos(c)*sin(a), dy;...
%        -sin(b),                        cos(b)*sin(a),                        cos(a)*cos(b), dz;...
%        0,0,0,1];
% P=[Px Py Pz 1]';
% H1=M*P;
% H1 =[ dx - conj(Py)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)) + conj(Pz)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) + conj(Px)*cos(b)*cos(c);
%     dy + conj(Py)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)) - conj(Pz)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) + conj(Px)*cos(b)*sin(c);
%                                                           dz - conj(Px)*sin(b) + conj(Pz)*cos(a)*cos(b) + conj(Py)*cos(b)*sin(a)];
                
% jacobian(H1,[a b c dx dy dz])
 

a=z(1);
b=z(2);
c=z(3);
dx=z(4);
dy=z(5);
dz=z(6);

% sP1
P=sP(1:3,1);
Px=P(1);
Py=P(2);
Pz=P(3);
J1=[   conj(Py)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) + conj(Pz)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)), conj(Pz)*cos(a)*cos(b)*cos(c) - conj(Px)*cos(c)*sin(b) + conj(Py)*cos(b)*cos(c)*sin(a), conj(Pz)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Py)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)) - conj(Px)*cos(b)*sin(c), 1, 0, 0];
J2=[ - conj(Py)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Pz)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)), conj(Pz)*cos(a)*cos(b)*sin(c) - conj(Px)*sin(b)*sin(c) + conj(Py)*cos(b)*sin(a)*sin(c), conj(Pz)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) - conj(Py)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)) + conj(Px)*cos(b)*cos(c), 0, 1, 0];
J3=[                                                     conj(Py)*cos(a)*cos(b) - conj(Pz)*cos(b)*sin(a),                    - conj(Px)*cos(b) - conj(Pz)*cos(a)*sin(b) - conj(Py)*sin(a)*sin(b),                                                                                                                          0, 0, 0, 1];

% sP2
P=sP(1:3,2);
Px=P(1);
Py=P(2);
Pz=P(3);
J4=[   conj(Py)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) + conj(Pz)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)), conj(Pz)*cos(a)*cos(b)*cos(c) - conj(Px)*cos(c)*sin(b) + conj(Py)*cos(b)*cos(c)*sin(a), conj(Pz)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Py)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)) - conj(Px)*cos(b)*sin(c), 1, 0, 0];
J5=[ - conj(Py)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Pz)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)), conj(Pz)*cos(a)*cos(b)*sin(c) - conj(Px)*sin(b)*sin(c) + conj(Py)*cos(b)*sin(a)*sin(c), conj(Pz)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) - conj(Py)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)) + conj(Px)*cos(b)*cos(c), 0, 1, 0];
J6=[                                                     conj(Py)*cos(a)*cos(b) - conj(Pz)*cos(b)*sin(a),                    - conj(Px)*cos(b) - conj(Pz)*cos(a)*sin(b) - conj(Py)*sin(a)*sin(b),                                                                                                                          0, 0, 0, 1];

% sP3
P=sP(1:3,3);
Px=P(1);
Py=P(2);
Pz=P(3);
J7=[   conj(Py)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) + conj(Pz)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)), conj(Pz)*cos(a)*cos(b)*cos(c) - conj(Px)*cos(c)*sin(b) + conj(Py)*cos(b)*cos(c)*sin(a), conj(Pz)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Py)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)) - conj(Px)*cos(b)*sin(c), 1, 0, 0];
J8=[ - conj(Py)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Pz)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)), conj(Pz)*cos(a)*cos(b)*sin(c) - conj(Px)*sin(b)*sin(c) + conj(Py)*cos(b)*sin(a)*sin(c), conj(Pz)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) - conj(Py)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)) + conj(Px)*cos(b)*cos(c), 0, 1, 0];
J9=[                                                     conj(Py)*cos(a)*cos(b) - conj(Pz)*cos(b)*sin(a),                    - conj(Px)*cos(b) - conj(Pz)*cos(a)*sin(b) - conj(Py)*sin(a)*sin(b),                                                                                                                          0, 0, 0, 1];


% sP4
P=sP(1:3,4);
Px=P(1);
Py=P(2);
Pz=P(3);
J10=[   conj(Py)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) + conj(Pz)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)), conj(Pz)*cos(a)*cos(b)*cos(c) - conj(Px)*cos(c)*sin(b) + conj(Py)*cos(b)*cos(c)*sin(a), conj(Pz)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Py)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)) - conj(Px)*cos(b)*sin(c), 1, 0, 0];
J11=[ - conj(Py)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Pz)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)), conj(Pz)*cos(a)*cos(b)*sin(c) - conj(Px)*sin(b)*sin(c) + conj(Py)*cos(b)*sin(a)*sin(c), conj(Pz)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) - conj(Py)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)) + conj(Px)*cos(b)*cos(c), 0, 1, 0];
J12=[                                                     conj(Py)*cos(a)*cos(b) - conj(Pz)*cos(b)*sin(a),                    - conj(Px)*cos(b) - conj(Pz)*cos(a)*sin(b) - conj(Py)*sin(a)*sin(b),                                                                                                                          0, 0, 0, 1];

% % sP5
% P=sP(1:3,5);
% Px=P(1);
% Py=P(2);
% Pz=P(3);
% J13=[   conj(Py)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) + conj(Pz)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)), conj(Pz)*cos(a)*cos(b)*cos(c) - conj(Px)*cos(c)*sin(b) + conj(Py)*cos(b)*cos(c)*sin(a), conj(Pz)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Py)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)) - conj(Px)*cos(b)*sin(c), 1, 0, 0];
% J14=[ - conj(Py)*(cos(c)*sin(a) - cos(a)*sin(b)*sin(c)) - conj(Pz)*(cos(a)*cos(c) + sin(a)*sin(b)*sin(c)), conj(Pz)*cos(a)*cos(b)*sin(c) - conj(Px)*sin(b)*sin(c) + conj(Py)*cos(b)*sin(a)*sin(c), conj(Pz)*(sin(a)*sin(c) + cos(a)*cos(c)*sin(b)) - conj(Py)*(cos(a)*sin(c) - cos(c)*sin(a)*sin(b)) + conj(Px)*cos(b)*cos(c), 0, 1, 0];
% J15=[                                                     conj(Py)*cos(a)*cos(b) - conj(Pz)*cos(b)*sin(a),                    - conj(Px)*cos(b) - conj(Pz)*cos(a)*sin(b) - conj(Py)*sin(a)*sin(b),                                                                                                                          0, 0, 0, 1];

J=-1*[J1;J2;J3;J4;J5;J6;J7;J8;J9;J10;J11;J12];
