function X = ligneIso(B,L,u,v,k)
    Xpre=[];
    epsilon=0.1;
    I=valeurIso(B,L,u,v);
    compteur = 0;
    compteur2 = 1;
    n = length(u)
    p = length(v)
    for i=1:n
        if compteur~=0
            compteur2=compteur2+1;
            compteur=0;
        end
        for j=1:p
            if abs(I(i,j)-k)<epsilon
                evalu=evaldeCasteljau2D(B,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)))
                compteur = compteur +1;
                
                Xpre(compteur2,compteur,1)=evalu(1);
                Xpre(compteur2,compteur,2)=evalu(2);
                Xpre(compteur2,compteur,3)=evalu(3);
            end
        end
    end
    if compteur+compteur2 == 0
        error("Pas de points isophote")
    end
    n=length(Xpre(:,1));
    p=length(Xpre(1,:));
    for i=1:n
        for j=1:p
            if Xpre(i,j,:)==0 && j<p
                if Xpre(i,j+1,:)==0
                    if j==1
                        error("Le programme est mal code")
                    end
                    Xpre(i,j,:)=Xpre(i,j-1,:);
                end
            else if Xpre(i,j,:)==0 && j==p
                Xpre(i,j,:)=Xpre(i,j-1,:);
            end
        end
    end

    X=Xpre
    
