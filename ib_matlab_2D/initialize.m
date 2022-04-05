%initialize.m

L=1.0
N=64
h=L/N
ip=[(2:N),1]
im=[N,(1:(N-1))]
Nb=ceil(pi*(L/2)/(h/2))
% Nb = 4
dtheta=2*pi/Nb
kp=[(2:Nb),1]
km=[Nb,(1:(Nb-1))]
K = 1
rho=1
mu=0.01
tmax=1
dt=0.01
clockmax=ceil(tmax/dt)


% Dimension of lagrangian structure
lag_dim = 2;
fibers = 3;


% Lagrangian discretization type
% FDCD: FD centered
% FDFD: FD forward
% FE: Finite Elements
lag_type  = 'FE'

% basis functions
elem_type = 'linear'
% elem_type = 'quadratic'

basis_type =  strcat(elem_type,num2str(lag_dim),'d')

% Set up Finite Element variables
finite_elements

switch(lag_dim)
    case(1)
        for k=0:(Nb-1)
          theta=k*dtheta;
          gamma = 0;
          X(k+1,1)=(L/2)+(L/4)*cos(theta);
          X(k+1,2)=(L/2)+(L/4 + gamma)*sin(theta);
        end
    case(2)
        R = 0.25;
        gamma = 0.01;
        dtheta=2*pi*R/Nb;
        w = 0.0625;
        dw = w/(fibers-1);
        for k=0:(Nb-1)
            for i = 0 : fibers-1     
              theta=k*dtheta;
              gamma = 0;
              X(k+1+i*Nb,1)=(L/2) + R*(1+i*dw)*cos(theta/R);
              X(k+1+i*Nb,2)=(L/2) + R*(1+i*dw)*sin(theta/R);
%               X(k+1+i*Nb,1)=(L/2)+L/4*(1+i*dw)*cos(theta);
%               X(k+1+i*Nb,2)=(L/2)+L/4*(1+ gamma+i*dw)*sin(theta);
            end
        end
%         dtheta = dtheta/R;
end

u=zeros(N,N,2);
for j1=0:(N-1)
  x=j1*h;
  u(j1+1,:,2)=sin(2*pi*x/L);
%   u(j1+1,:,2) =zeros(size(x));
end

vorticity=(u(ip,:,2)-u(im,:,2)-u(:,ip,1)+u(:,im,1))/(2*h);
dvorticity=(max(max(vorticity))-min(min(vorticity)))/5;
values= (-10*dvorticity):dvorticity:(10*dvorticity);
valminmax=[min(values),max(values)];
xgrid=zeros(N,N);
ygrid=zeros(N,N);
for j=0:(N-1)
  xgrid(j+1,:)=j*h;
  ygrid(:,j+1)=j*h;
end

set(gcf,'double','on')
contour(xgrid,ygrid,vorticity,values)
hold on
% 1d Plot
% plot(X(:,1),X(:,2),'ko')

% 2d Plot
% plot(X(1:Nb,1),X(1:Nb,2),'ko')
% plot(X(Nb+1:end,1),X(Nb+1:end,2),'ko')

  switch(lag_dim)
      case(1)
          plot(X(:,1),X(:,2),'ko')
      case(2)
          for i = 1:elems
              plot(X(T(:,i),1), X(T(:,i),2),'ko-'  )
          end
  end
axis([0,L,0,L])
% caxis(valminmax)
title(strcat(lag_type,basis_type))
axis equal
axis manual
drawnow
hold off


