function N = bezierPatchNormal2(B,u,v)

N=[];
n=length(u);
p=length(v);

Dx = bezierDerive_u(B,u,v);
Dy = bezierDerive_v(B,u,v);

for i=1:n
    for j=1:p
        eval1=evaldeCasteljau2D(Dx,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
        eval2=evaldeCasteljau2D(Dy,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
        %prodsca = cross(Dx(i,j,:),Dy(i,j,:));
        
        prodsca = [Dx(i,j,2)*Dy(i,j,3)-Dx(i,j,3)*Dy(i,j,2),Dx(i,j,1)*Dy(i,j,3)-Dx(i,j,3)*Dy(i,j,1),Dx(i,j,1)*Dy(i,j,2)-Dx(i,j,2)*Dy(i,j,1)];
        normprodsca = (prodsca(1)*prodsca(1)+prodsca(2)*prodsca(2)+prodsca(3)*prodsca(3)).^(1/2);
        if normprodsca ~=0
            N(i,j,1)=prodsca(1)/normprodsca;
            N(i,j,2)=prodsca(2)/normprodsca;
            N(i,j,3)=prodsca(3)/normprodsca;
        else
            N(i,j,1)=0;
            N(i,j,2)=0;
            N(i,j,3)=0;
        end
    end
end

