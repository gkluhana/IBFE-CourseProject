function F = Fh(X)
global Nb fibers
global dtheta

for f = 0:fibers-1

    kc = [1:Nb] + f*Nb
    kp = [2:Nb,1]+ f*Nb
    km = [Nb,1:(Nb-1)]+ f*Nb
    Xc = X(kc,:);
    Xp = X(kp,:);
    Xm = X(km,:);
    F(kc,:)= 0.5*Xc - 0.5*Xp - 0.5 *Xm;

end
% F  = F
