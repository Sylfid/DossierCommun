function H = deuxFormFonda(B,u,v)
    Dxx=bezierDeriveeSeconde_uu(B,u,v);
    Dxy=bezierDeriveeSeconde_uv(B,u,v);
    Dyy=bezierDerive_vv(B,u,v);
    N=bezierPatchNormal(B,u,v);
    Hrep=[];
    n=length(u);
    p=length(v);
    for i=1:n
        for j=1:p
            Hrep(i,j,1,1)=dot(Dxx(i,j,:),N(i,j,:));
            Hrep(i,j,1,2)=dot(Dxy(i,j,:),N(i,j,:));
            Hrep(i,j,2,1)=dot(Dxy(i,j,:),N(i,j,:));
            Hrep(i,j,2,2)=dot(Dyy(i,j,:),N(i,j,:));
        end
    end
    H=Hrep;
