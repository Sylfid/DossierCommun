function C = couleurCourbure(K)
    maxCourb = K(1,1);
    for i=1:length(K(:,1))
        for j=1:length(K(1,:))
            if maxCourb < abs(K(i,j));
                maxCourb = abs(K(i,j));
            end
        end
    end
    Krep = K(:,:)/maxCourb
    for i=1:length(K(:,1))
        for j=1:length(K(:,1))
            if Krep(i,j)==0
                C(i,j,1)=0;
                C(i,j,2)=1;
                C(i,j,3)=0;
            elseif Krep(i,j)<0
                C(i,j,1)=Krep(i,j);
                C(i,j,2)=1-Krep(i,j);
                C(i,j,3)=0;
            else
                C(i,j,1)=0;
                C(i,j,2)=1-Krep(i,j);
                C(i,j,3)=Krep(i,j);
            end
        end
    end
