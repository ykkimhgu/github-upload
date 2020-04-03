function zmat=fsolveMatlab(z0, oP,sP)    

    %osMhat = Transform_matrix(z(1), z(2), z(3),z(4), z(5),z(6));
    %F=getErrorFunc(oP-osMhat*sP);
    options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt');
    %options = optimoptions('fsolve','Display','final-detailed');
    %options = optimoptions('fsolve','Display','iter-detailed');
    
    options.Algorithm = 'levenberg-marquardt';
    options.FunctionTolerance=1e-3;
    options.OptimalityTolerance=1e-3;
    
    fun= @(z)getErrorFunc(oP-Transform_matrix(z(1), z(2), z(3),z(4), z(5),z(6))*sP);
    zmat=fsolve(fun,z0, options);
    %zmat=fsolve(fun,z0);

end
