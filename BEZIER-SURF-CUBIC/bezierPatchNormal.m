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
    
for i=1:lentgh(u)
    for j=1:length(v)
        
    end
end