function N = bezierPatchNormal(B,u,v)

N=[];
Dx=[];
Dy=[];

for i = 1:3
    for j=1:4
        Dx(i,j,1)=3*(B(i+1,j,1)-B(i,j,1));
        Dx(i,j,2)=3*(B(i+1,j,2)-B(i,j,2));
        Dx(i,j,3)=3*(B(i+1,j,3)-B(i,j,3));
        
        Dy(j,i,1)=3*(B(j,i+1,1)-B(j,i,1));
        Dy(j,i,2)=3*(B(j,i+1,2)-B(j,i,2));
        Dy(j,i,3)=3*(B(j,i+1,3)-B(j,i,3));
    end
end


n=length(u);
p=length(v);

for i=1:n
    for j=1:p
        eval1=evaldeCasteljau2D(Dx,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
        eval2=evaldeCasteljau2D(Dy,(i-1)*(1/(n-1)),(j-1)*(1/(p-1)));
        prodsca = cross(eval1,eval2);
        N(i,j,1)=prodsca(1)/norm(prodsca);
        N(i,j,2)=prodsca(2)/norm(prodsca);
        N(i,j,3)=prodsca(3)/norm(prodsca);
    end
end

