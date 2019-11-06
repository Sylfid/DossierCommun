function G = premiereFormeFonda(B,u,v)
    Dx = calculDerivee(B,1);
    Dy = calculDerivee(B,2);
    n=length(u);
    p=length(v);
    Grep=[];
    for i=1:n
        for j=1:p
            Xu=evaldeCasteljau2D(Dx,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
            Xv=evaldeCasteljau2D(Dy,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
            Grep(i,j,1,1)=dot(Xu,Xu);
            Grep(i,j,1,2)=dot(Xu,Xv);
            Grep(i,j,2,1)=dot(Xv,Xu);
            Grep(i,j,2,2)=dot(Xv,Xv);
        end
    end
    G=Grep;
