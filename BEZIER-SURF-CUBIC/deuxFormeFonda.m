function H = deuxFormFonda(B,t,s)
    Dx=calculDerivee(B,1);
    Dy=calculDerivee(B,2);
    Dxx=calculDerivee(Dx,1);
    Dxy=calculDerivee(Dx,2);
    Dyx=calculDerivee(Dy,1);
    Dyy=calculDerivee(Dy,2);
    N=bezierPatchNormal(B,u,v);
    Hrep=[];
    for i=1:n
        for j=1:p
            Xuu=evaldeCasteljau2D(Dxx,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
            Xuv=evaldeCasteljau2D(Dxy,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
            Xvu=evaldeCasteljau2D(Dyx,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
            Xvv=evaldeCasteljau2D(Dyy,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
            Hrep(i,j,1,1)=dot(Xuu,N);
            Hrep(i,j,1,2)=dot(Xuv,N);
            Hrep(i,j,2,1)=dot(Xvu,N);
            Hrep(i,j,2,2)=dot(Xvv,N);
        end
    end
    H=Hrep;
