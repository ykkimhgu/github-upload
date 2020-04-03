function R = Rotation_matrix_xyz(a, b, c, dx, dy, dz)
% function R = Rotation_matrix(a, b, c, dx, dy, dz)
%   with Euler angle(roll-pitch-yaw) in rad
%   Rot_X=[1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];
%   Rot_Y=[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)];
%   Rot_Z = [cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];
%
%   Rot123=Rot_X*Rot_Y*Rot_Z
%

R = [1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)]*[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)]*[cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];

% R=[ cos(b)*cos(c), cos(c)*sin(a)*sin(b) - cos(a)*sin(c), sin(a)*sin(c) + cos(a)*cos(c)*sin(b), dx;...
% cos(b)*sin(c), cos(a)*cos(c) + sin(a)*sin(b)*sin(c), cos(a)*sin(b)*sin(c) - cos(c)*sin(a), dy;...
%        -sin(b),                        cos(b)*sin(a),                        cos(a)*cos(b), dz;...
%        0,0,0,1];
   
