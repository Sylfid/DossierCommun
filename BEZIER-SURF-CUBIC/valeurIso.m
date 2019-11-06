function x = valeurIso(B,L,u,v)
    xpre = [];
    N = bezierPatchNormal(B,u,v);
    for i=1:length(u)
        for j=1:length(v)
            if length(N(i,j,:))~=3
                error("wawaq");
            end
            if length(L)~=length(N(i,j,:))
                error("wawaq");
            end
            xpre(i,j)=N(i,j,1)*L(1)+N(i,j,2)*L(2)+N(i,j,3)*L(3);
        end
    end
    x=xpre;
    


