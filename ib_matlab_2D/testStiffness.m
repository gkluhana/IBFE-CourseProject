% test Stiffness
% Nb = 4;
% T = [1:Nb; 2:Nb,1];
K1=stiffness(Nb)
K2=full(stiffness2(Nb))
