function trajectory = record_trajectory(X,s,clock,trajectory)
% s: lagrangian coordinate indices of points to be tracked

trajectory(clock,:) = X(s,:);

return
