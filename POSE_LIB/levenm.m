function z=levenm(z, oP,sP)
i=1;   
alpha=0.02;
n=length(z);
np=4;
mu = 0.3;
W=eye(3*np,3*np);

maxItr=1000;
    for k=1:maxItr
        % Curve-fit model
        % Residual function
        osMhat = Transform_matrix(z(1), z(2), z(3),z(4), z(5),z(6));
                
        F=getErrorFunc(oP-osMhat*sP);

        % Jacobian
        J=getJacobian(z,sP);
        
        %h_gn=-inv(J'*J+mu*eye(6,6))*J'*F(:,i);
        h_gn=-inv(J'*J+mu*diag(J'*J))*J'*F(:,i);
        z=z+alpha*h_gn;
        if (norm(h_gn)<0.1)
            break;
        end        
    end
    
