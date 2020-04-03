function z=steepestGrad(z, oPnoise,sP)
i=1;   
alpha=0.0005;
n=length(z);
np=4;
W=eye(3*np,3*np);

maxItr=1000;
    for k=1:maxItr
        % Curve-fit model
        % Residual function
        osMhat = Transform_matrix(z(1), z(2), z(3),z(4), z(5),z(6));
        F(:,i)=getErrorFunc(oPnoise-osMhat*sP);

        % Jacobian
        J=getJacobian(z);
        h_sg=-J'*W*F(:,i);
        z=z+alpha*h_sg;
        z(1:3)=mod(z(1:3),2*pi);  % modulus of 2pi for angles
        if (norm(h_sg)<0.1)
            break;
        end
        
    end