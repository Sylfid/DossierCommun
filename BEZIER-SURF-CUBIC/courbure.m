function K = courbure(B,u,v)
    G = premiereFormeFonda(B,u,v);
    H = deuxFormFonda(B,u,v);
    for i=1:length(u)
        for j=1:length(v)
            mat = eig(H(i,j,:,:)*inv(G(i,j,:,:)));
            if length(mat)~=2
                error("probleme nb valeur propre")
            end
            Krep(i,j)=mat(1)*mat(2);
        end
    end
    K=Krep;

