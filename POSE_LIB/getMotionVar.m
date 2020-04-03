function  [a b c dx dy dz]=getMotionVar(M)
% get parameter roll,pitch,yaw, dx, dy, dz from homogeneous matrix M
% Angle notation- Euler angle(roll-pitch-yaw) in rad
%
% Rot321=Rot_Z*Rot_Y*Rot_X
%
%  Mod. 2020-03-31
%
% Rot_X=[1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];
% Rot_Y=[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)];
% Rot_Z = [cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];
% R = [cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1]*[cos(b) 0 sin(b); 0 1 0;-sin(b) 0 cos(b)]*[1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];
%


b=-asin(M(3,1));
b2=pi-b;

if (cos(b))
    a=atan2(M(3,2)/cos(b),M(3,3)/cos(b));
    %a=atan2(M(3,2)/M(3,3));
    c=atan2(M(2,1)/cos(b),M(1,1)/cos(b));
else  % (cos(b)==0)
    c=0;
    if(M(3,1)==-1)
        b=pi/2;
        a=atan2(M(1,2),M(1,3));
    else
        b=-pi/2;
        a=atan2(-M(1,2),-M(1,3));
    end
end


% Type2: 
% Rot123=Rot_X*Rot_Y*Rot_Z
%
% a=-atan(M(2,3)/M(3,3));
% b=asin(M(1,3));
% c=-atan(M(1,2)/M(1,1));

dx=M(1,4);
dy=M(2,4);
dz=M(3,4);