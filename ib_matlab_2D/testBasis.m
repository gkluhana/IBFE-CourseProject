% test Basis
global basis_type
basis_type = 'quadratic1d'
% close all
% x=-1:0.1:1;
% 
% phi1 = basisFunction(1,x);
% phi2 = basisFunction(2,x);
% phi3 = basisFunction(3,x);
% plot(x,phi1)
% hold on 
% plot(x,phi2)
% plot(x,phi3)
% 
% x=-1:0.1:1;
% phi1_grad = basisGradient(1,x);
% phi2_grad = basisGradient(2,x);
% phi3_grad = basisGradient(3,x);
% plot(x,phi1_grad)
% plot(x,phi2_grad)
% plot(x,phi3_grad)
% legend('phi_1','phi_2','phi_3','grad_1','grad_2','grad_3')

basis_type = 'linear2d'
lag_dim =2 
x = -1:0.1:1
y = -1:0.1:1
[X,Y] = meshgrid(x,y)
Z=zeros(size(X))
for i = 1:size(X,1)
    for j = 1:size(X,2)
        Z(i,j) = basisFunction(1,[X(i,j),Y(i,j)])
        grad =basisGradient(1,[X(i,j),Y(i,j)])
        Z2(i,j) = grad(1);
        Z3(i,j) = grad(2);
    end
end

% figure
surf(X,Y,Z)
hold on
surf(X,Y,Z2)

