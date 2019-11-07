function S = bezierDeriveeSeconde_uu(B,u,v)

S=[];

% Matrice de changement de base
M = [
    1   0   0  0;
   -3   3   0  0;
    3  -6   3  0;
   -1   3  -3  1
    ];

MT = M'; % transpose de M

for i = 1:length(u)
    for j = 1:length(v)
        DU  = [0 0 2 6*u(i)];
        VT = [1 v(j) v(j)^2 v(j)^3]'; 
        for k = 1:3 % evaluation en (u,v) pour les 3 dimensions
            S(i,j,k) = DU * M * B(:,:,k) * MT * VT;
        end         
    end    
end
