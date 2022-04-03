function F=Force(X)
global kp km dtheta K Nb 
global lag_type Kbar Mbar lag_dim;
global w;
switch lag_type
    case('FDCD')
        F=K*(X(kp,:)+X(km,:)-2*X)/(dtheta*dtheta);
    case('FDFD')
        F=-K*(X(kp,:)-X(km,:))/(2*dtheta);
    case('FE')
        if lag_dim ==1
            Mbar = mass(Nb);
            Kbar = stiffness(Nb);
            b = -(K)*Kbar*X;
        else 
            Mbar = mass(Nb);
            Kbar = stiffness(Nb);
%             b = rhs(X);
            b = -(K/w)*Kbar*X;
        end 
        F = Mbar\b;
end