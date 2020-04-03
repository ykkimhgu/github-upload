function F=getErrorFunc(M)

% M=oPnoise(:,:,i)-osMhat*sP
% F=[M(1:3,1);M(1:3,2);M(1:3,3);M(1:3,4);M(1:3,5)];

F=[M(1:3,1);M(1:3,2);M(1:3,3);M(1:3,4);];
