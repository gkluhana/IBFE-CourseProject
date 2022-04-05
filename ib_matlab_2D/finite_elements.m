% finite elements
switch(basis_type)
    case('linear1d')
        T = [1:Nb; 2:Nb,1];
        elems= Nb;
        elemNodes = 2;
        Mbar = mass(Nb);
        Kbar = stiffness(Nb);
    case('quadratic1d')
        T = [1:Nb; 2:Nb,1; 3:Nb,1,2];
        elems= Nb-1;
        elemNodes = 3;
        Mbar = mass(Nb);
        Kbar = stiffness(Nb);
    case('linear2d')
        T = [1:Nb; 2:Nb,1; Nb+2:2*Nb,Nb+1; Nb+1:2*Nb];
        T2 = [Nb+1:2*Nb; Nb+2:2*Nb,Nb+1; 2*Nb+2:3*Nb,2*Nb+1 ; 2*Nb+1:3*Nb];
        T = [T T2];
        elems = Nb*(fibers-1);
        elemNodes = 4;
end


