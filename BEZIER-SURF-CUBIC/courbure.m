function K = courbure(B,u,v)
    G = premiereFormeFonda(B,u,v);
    H = deuxFormeFonda(B,u,v);
    mat1=[];
    for i=1:length(u)
        for j=1:length(v)
            
            Gbis(1,1) = G(i,j,1,1);
            Gbis(1,2) = G(i,j,1,2);
            Gbis(2,1) = G(i,j,2,1);
            Gbis(2,2) = G(i,j,2,2);
            invG = inv(Gbis);
            
            Hbis(1,1)=H(i,j,1,1);
            Hbis(1,2)=H(i,j,1,2);
            Hbis(2,1)=H(i,j,2,1);
            Hbis(2,2)=H(i,j,2,2);
            
            mat1(1,1)= Hbis(1,1)*invG(1,1)+Hbis(1,2)*invG(2,1);
            mat1(1,2)= Hbis(1,1)*invG(1,2)+Hbis(1,2)*invG(2,2);
            mat1(2,1)= Hbis(2,1)*invG(1,1)+Hbis(2,2)*invG(2,1);
            mat1(2,2)= Hbis(2,1)*invG(1,2)+Hbis(2,2)*invG(2,2);
            mat=eigs(mat1);
            if length(mat)~=2
                error("probleme nb valeur propre")
            end
            Krep(i,j)=mat(1)*mat(2);
        end
    end
    K=Krep;

