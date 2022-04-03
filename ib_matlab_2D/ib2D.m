% ib2D.m
% This script is the main program.
clear all, close all, clc
global dt Nb N h rho mu ip im a;
global kp km dtheta K;
% finite element global variables
global lag_dim lag_type basis_type T  elemNodes elems Kbar Mbar;
global X w fibers;
initialize
init_a

for clock=1:clockmax
  XX=X+(dt/2)*interp(u,X);
  ff=spread(Force(XX),XX);
  [u,uu]=fluid(u,ff);
  X=X+dt*interp(uu,XX);
  
  %animation:
  vorticity=(u(ip,:,2)-u(im,:,2)-u(:,ip,1)+u(:,im,1))/(2*h);
  contour(xgrid,ygrid,vorticity,values)
  hold on
  switch(lag_dim)
      case(1)
          plot(X(:,1),X(:,2),'ko')
      case(2)
          for i = 1:elems
              plot(X(T(:,i),1), X(T(:,i),2),'ko-')
          end
  end
  axis([0,L,0,L])
%   if clock > 10 
    vorticity=(u(ip,:,2)-u(im,:,2)-u(:,ip,1)+u(:,im,1))/(2*h);
    dvorticity=(max(max(vorticity))-min(min(vorticity)))/5;
    values= (-10*dvorticity):dvorticity:(10*dvorticity);
    valminmax=[min(values),max(values)];
    caxis(valminmax)
%   end
  axis equal
  axis manual
  title(strcat(lag_type,basis_type))
  drawnow
  hold off
end

