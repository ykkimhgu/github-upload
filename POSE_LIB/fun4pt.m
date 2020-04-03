function F= fun4pt(z) 
    osMhat = Transform_matrix(z(1), z(2), z(3),z(4), z(5),z(6));
    F=getErrorFunc(oP-osMhat*sP);
end