function G = premiereFormeFonda(B,u,v)
    Dx = bezierDerive_u(B,u,v);
    Dy = bezierDerive_v(B,u,v);
    n=length(u);
    p=length(v);
    Grep=[];
    for i=1:n
        for j=1:p
            Grep(i,j,1,1)=dot(Dx(i,j,:),Dx(i,j,:));
            Grep(i,j,1,2)=dot(Dx(i,j,:),Dy(i,j,:));
            Grep(i,j,2,1)=dot(Dy(i,j,:),Dx(i,j,:));
            Grep(i,j,2,2)=dot(Dy(i,j,:),Dy(i,j,:));
        end
    end

    Ginter = Grep(1,1,:,:);
    %zeg = Ginter(2,1);
    G=Grep;
