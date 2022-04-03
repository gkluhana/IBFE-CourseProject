function [quadPoints,quadWeights] = quadrature()
global basis_type
    switch(basis_type)
        case('linear1d')
            quadPoints = [-sqrt(3)/3, sqrt(3)/3];
            quadWeights = [1 1];
        case('quadratic1d')
            quadPoints = [-sqrt(3/5), 0, sqrt(3/5)];
            quadWeights = [5/9 8/9 5/9];
        case('linear2d')
            quadPoints = [-sqrt(3)/3, sqrt(3)/3];
            quadWeights = [1 1];
    end
return

