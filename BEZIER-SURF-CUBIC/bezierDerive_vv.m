function S = bezierDerive_vv(B,u,v)

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
        U  = [1 u(i) u(i)^2 u(i)^3];
        DVT = [0 0 2 6*v(j)]'; 
        for k = 1:3 % evaluation en (u,v) pour les 3 dimensions
            S(i,j,k) = U * M * B(:,:,k) * MT * DVT;
        end         
    end    
end
