load trajectoryRest.mat
figure
tmax = 1;
coord = 1;
t = dt:dt:tmax
% 
plot(t,trajectoryFD(1:tmax*100,coord),'ro-')
hold on
plot(t,trajectoryl1d(1:tmax*100,coord),'b-')
plot(t,trajectoryq1d(1:tmax*100,coord),'k-')
xlabel('Time(t)', 'Fontsize',20)
ylabel('Y-Coordinate', 'Fontsize',20)
% plot(t,trajectoryFD(1:tmax*100,2),'ro-')
% plot(t,trajectoryl1d(1:tmax*100,2),'b-')
% plot(t,trajectoryq1d(1:tmax*100,2),'k-')

% plot(trajectoryFD(1:tmax*100,coord),trajectoryFD(1:tmax*100,2),'ro-')
% hold on
% plot(trajectoryl1d(1:tmax*100,coord),trajectoryl1d(1:tmax*100,2),'b-')
% plot(trajectoryq1d(1:tmax*100,coord),trajectoryl1d(1:tmax*100,2),'k-')
% xlim([0,1])
% ylim([0,1])
% axis equal
legend('Finite Difference','FE-Linear','FE-Quadratic','Fontsize',24)
% title('Trajectories of material point \theta = 0','Fontsize',20)


% plot(trajectoryl1d(:,1),'b-')
% plot(trajectoryq1d(:,1),'g-')
% legend('Finite Difference','FE-Linear','FE-Quadratic')
% title('Trajectories of material point \theta = 0')
% xlabel('clock')
% xlabel('X','Fontsize',18)
% ylabel('Y','Fontsize',18)
