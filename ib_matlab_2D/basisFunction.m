function phi=basisFunction(node, xi)
% inputs
%   node: local node for which basis function is defined
%   xi: vector of coordinates where basis function is evaluated
% output
%   phi: basis function value at x
global basis_type

switch(basis_type)
    case('linear1d')
        if node==1
            phi = (1/2) .* (1-xi);

        elseif node==2
            phi = (1/2) .* (1+xi) ;

        end
        
    case('quadratic1d')
        if node==1
            phi = -(1/2) .* (1-xi).*xi;

        elseif node==2
            phi = (1+xi).* (1-xi) ;

        elseif node==3
            phi = (1/2) .* (1+xi).*xi;
        end
        
    case('linear2d')
        xi_1 = xi(1);
        xi_2 = xi(2);
        if node==1
            phi = 1/4 .* (1-xi_1) .* (1-xi_2);
        elseif node==2
            phi = 1/4 .* (1+xi_1) .* (1-xi_2);
        elseif node==3
            phi = 1/4 .* (1+xi_1) .* (1+xi_2);
        elseif node==4
            phi = 1/4 .* (1-xi_1) .* (1+xi_2);
        end
end
end



