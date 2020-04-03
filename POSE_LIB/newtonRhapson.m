function z=newtonRhapson(z, oPnoise,sP)
%i=1;   
alpha=1;%0.002;
n=length(z);
np=4;
W=eye(3*np,3*np);

maxItr=1000;
    for k=1:maxItr
        % Curve-fit model
        % Residual function
        osMhat = Transform_matrix(z(1), z(2), z(3),z(4), z(5),z(6));
        F=getErrorFuncNR(oPnoise-osMhat*sP);

        % Jacobian
        J=getJacobian_nr(z);
        h_nr=-J\F;
        z=z+alpha*h_nr;
        if (norm(h_nr)<0.1)
            break;
        end        
    end