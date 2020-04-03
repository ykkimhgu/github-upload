function M = Transform_matrix_xyz(a, b, c, dx, dy, dz)

%   with Euler angle(roll-pitch-yaw) in rad
%   Rot_X=[1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];
%   Rot_Y=[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)];
%   Rot_Z = [cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];
%
%   Rot123=Rot_X*Rot_Y*Rot_Z
%

  R = [1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)]*[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)]*[cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];
  T = [dx ; dy; dz];
  M = [R T ; 0 0 0 1];
 