function x = valeurIso(N,L)
    for i =length(N(:,1))
        for j=length(N(1,:))
            x(i,j)=dot(N(i,j),L);
        end
    end

