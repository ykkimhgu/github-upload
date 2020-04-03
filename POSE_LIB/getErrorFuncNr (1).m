function F=getErrorFuncNR(M)

% M=oPnoise(:,:,i)-osMhat*sP
% F=[M(1:3,1);M(1:3,2);M(1:3,3);M(1:3,4);M(1:3,5)];

%F=[M(1:3,1);M(1:3,2);M(1:3,3);M(1:3,4);];
% X1 Y1 Z1 X2 Z2 Y3 
F=[M(1:3,1);M(1,2);M(3,2);M(2,3)]
