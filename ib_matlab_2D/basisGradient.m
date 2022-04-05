function grad=basisGradient(node, xi)
% inputs
%   node: local node for which basis function is defined
%   xi: vector of coordinates where basis gradietnt is evaluated
% output
%   phi: basis gradient vector at x
global basis_type lag_dim

switch(basis_type)
    case('linear1d')
        if node==1
            grad = (-1/2)*ones(size(xi));
        elseif node==2
            grad =  (1/2)*ones(size(xi));
        end
    case('quadratic1d')
        if node==1
            grad = (xi)-1/2;
        elseif node==2
            grad =  -2*xi ;
        elseif node==3
            grad = xi + 1/2;
        end
    case('linear2d')
        grad = zeros(1,lag_dim);
        xi_1 = xi(1);
        xi_2 = xi(2);
        if node==1
            grad(1) = 1/4 * (1-xi_2) * (-1);
            grad(2) = 1/4 * (1-xi_1) * (-1);
        elseif node==2
            grad(1) = 1/4 * (1-xi_2) * (1);
            grad(2) = 1/4 * (1+xi_1) * (-1);
        elseif node==3
            grad(1) = 1/4 * (1+xi_2) * (1);
            grad(2) = 1/4 * (1+xi_1) * (1);
        elseif node==4
            grad(1) = 1/4 * (1+xi_2) * (-1);
            grad(2) = 1/4 * (1-xi_1) * (1);
        end
end
end

