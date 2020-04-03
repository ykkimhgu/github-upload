function M = Transformation_matrix(a, b, c, dx, dy, dz)
% function M = Transformation matrix(a, b, c, dx, dy, dz)
% with Euler angle(roll-pitch-yaw) in rad
% Rot321=Rot_Z*Rot_Y*Rot_X
% Rot_X=[1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];
% Rot_Y=[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)];
% Rot_Z = [cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];
% R = [cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1]*[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)]*[1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];

M=[ cos(b)*cos(c), cos(c)*sin(a)*sin(b) - cos(a)*sin(c), sin(a)*sin(c) + cos(a)*cos(c)*sin(b), dx;...
cos(b)*sin(c), cos(a)*cos(c) + sin(a)*sin(b)*sin(c), cos(a)*sin(b)*sin(c) - cos(c)*sin(a), dy;...
       -sin(b),                        cos(b)*sin(a),                        cos(a)*cos(b), dz;...
       0,0,0,1];
   
