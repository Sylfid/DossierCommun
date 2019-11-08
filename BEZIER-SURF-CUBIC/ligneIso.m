function X = ligneIso(B,L,u,v,k)
    Xpre=[];
    epsilon=0.1;

    [~,~,~,np] = size(B);
    
    n = length(u);
    p = length(v);
    for k2=1:np
        compteur = 0;
        compteur2 = 1;
        I=valeurIso(B(:,:,:,k2),L,u,v);
    for i=1:n
        if compteur~=0
            compteur2=compteur2+1;
            compteur=0;
        end
        for j=1:p
            if abs(I(i,j)-k)<epsilon
                evalu=evaldeCasteljau2D(B(:,:,:,k2),(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
                compteur = compteur +1;

                Xpre(compteur2,compteur,1,k2)=evalu(1);
                Xpre(compteur2,compteur,2,k2)=evalu(2);
                Xpre(compteur2,compteur,3,k2)=evalu(3);
            end
        end
    end
    if compteur+compteur2 == 1
        error("Pas de points isophote")
    end
    n=length(Xpre(:,1,1,k2));
    p=length(Xpre(1,:,1,k2));
    for i=1:n
        for j=1:p
            if and(Xpre(i,j,:,k2)==0,j<p)
                if Xpre(i,j+1,1,k2)==0 && Xpre(i,j+1,2,k2)==0 && Xpre(i,j+1,3,k2)==0
                    if j==1
                        %error("Le programme est mal code")
                    else
                        Xpre(i,j,:,k2)=Xpre(i,j-1,:,k2);
                    end
                    
                end
            elseif and(Xpre(i,j,:,k2)==0,j==p)
                Xpre(i,j,:,k2)=Xpre(i,j-1,:,k2);
            end
        end
    end
    end
    X=Xpre
    
