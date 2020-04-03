function z=gauss_newton(z, oP,sP)
i=1;   
alpha=0.002;
n=length(z);
np=4;
W=eye(3*np,3*np);

maxItr=1000;
    for k=1:maxItr
        % Curve-fit model
        % Residual function
        osMhat = Transform_matrix(z(1), z(2), z(3),z(4), z(5),z(6));
        F=getErrorFunc(oP-osMhat*sP);

        % Jacobian
        J=getJacobian(z,sP);
        h_gn=-inv(J'*J)*J'*F;
        z=z+alpha*h_gn;
        if (norm(h_gn)<0.1)
            break;
        end        
    end