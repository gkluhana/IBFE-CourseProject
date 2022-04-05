function Kbar = stiffness(Nb)
global  T dtheta
global dtheta T elemNodes elems basis_type lag_dim fibers
global X dw

% e = ones(Nb,1);
% Kbar = spdiags([-e 2*e -e], -1:1, Nb,Nb);
% 
% % periodic BC
% Kbar(1,end) = -1;
% Kbar(end,1) = -1;
% Kbar = 1/dtheta * Kbar;

% % Assemble with loops and quadrature
[quadPoints,quadWeights] = quadrature();
Klocal = zeros(elemNodes);

switch(lag_dim)
    case(1)
        Kbar = zeros(Nb);
        fac = 2/dtheta; %detJ * d(xi)/dx * d(xi)/dx 
        for q1 = 1:2
            for i = 1:elemNodes
                for j = 1:elemNodes
                    Klocal(i,j) = Klocal(i,j) +basisGradient(i,quadPoints(q1)) ...
                        *basisGradient(j,quadPoints(q1))*quadWeights(q1)*fac;
                end
            end
        end
        
        for e = 1:length(T)
            Kbar(T(:,e),T(:,e)) = Kbar(T(:,e),T(:,e))+Klocal;
        end
    case(2)
        Kbar = zeros(fibers*Nb);
        fac = dw/dtheta;
        
        Klocal(:)=0;
        for q1 = 1:length(quadPoints)
            for q2 = 1:length(quadPoints)
                for i = 1:elemNodes
                    for j = 1:elemNodes
                        gradi = basisGradient(i,[quadPoints(q1),quadPoints(q2)]); 
                        gradj = basisGradient(j,[quadPoints(q1),quadPoints(q2)]);
                        Klocal(i,j) = Klocal(i,j) +gradi(1)*gradj(1)...
                            *quadWeights(q1)*quadWeights(q2)*fac;
                    end
                end
            end
        end
        for e = 1:length(T)
            Kbar(T(:,e),T(:,e)) = Kbar(T(:,e),T(:,e))+Klocal;    
        end
      
end

return

