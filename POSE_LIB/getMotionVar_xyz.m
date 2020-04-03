function  [a b c dx dy dz]=getMotionVar_xyz(M)
% get parameter roll,pitch,yaw, dx, dy, dz from homogeneous matrix M
% Angle notation- Euler angle(roll-pitch-yaw) in rad
%
% Rot123=Rot_X*Rot_Y*Rot_Z

% Rot_X=[1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];
% Rot_Y=[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)];
% Rot_Z = [cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];

%   R = [1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)]*[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)]*[cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];
%   T = [dx ; dy; dz];
%   M = [R T ; 0 0 0 1];
  
a=-atan(M(2,3)/M(3,3));
b=asin(M(1,3));
c=-atan(M(1,2)/M(1,1));
dx=M(1,4);
dy=M(2,4);
dz=M(3,4);