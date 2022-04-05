function Mbar = mass(Nb)
global dtheta T elemNodes elems basis_type lag_dim fibers
global X dw
% e = ones(Nb,1);
% Mbar = spdiags([e 4*e e], -1:1, Nb,Nb);
% 
% % periodic BC
% Mbar(1,end) = 1;
% Mbar(end,1) = 1;
% Mbar = dtheta/6 * Mbar;

% Assemble with loops and quadrature
[quadPoints,quadWeights] = quadrature();
Mlocal = zeros(elemNodes);
switch(lag_dim)
    case(1)
        Mbar = zeros(Nb);
        detJ = dtheta/2;
        for q1 = 1:length(quadPoints)
            for i = 1:elemNodes
                for j = 1:elemNodes
                    Mlocal(i,j) = Mlocal(i,j) +basisFunction(i,quadPoints(q1)) ...
                        *basisFunction(j,quadPoints(q1))*quadWeights(q1)*detJ;
                end
            end
        end
        for e = 1:length(T)
           Mbar(T(:,e),T(:,e)) = Mbar(T(:,e),T(:,e))+Mlocal;    
        end
    case(2)
        Mbar = zeros(fibers*Nb);
        detJ = (dtheta/2)*(dw/2);
        for e = 1:length(T)
            Mlocal(:)=0;
            for q1 = 1:length(quadPoints)
                for q2 = 1:length(quadPoints)
                    for i = 1:elemNodes
                        for j = 1:elemNodes
                            Mlocal(i,j) = Mlocal(i,j) +basisFunction(i,[quadPoints(q1),quadPoints(q2)]) ...
                                *basisFunction(j,[quadPoints(q1),quadPoints(q2)])*quadWeights(q1)*quadWeights(q2)*detJ;
                        end
                    end
                end
            end
            Mbar(T(:,e),T(:,e)) = Mbar(T(:,e),T(:,e))+Mlocal;    
        end
end

return

