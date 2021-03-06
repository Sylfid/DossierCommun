function X = evaldeCasteljau1D(B,t)
    if length(B(:,1))==1
        X=B(1,:);
    
    else
        S=[];
        for i=1:(length(B(:,1))-1)
            for j=1:length(B(1,:))
                S(i,j)=(1-t)*B(i,j)+t*(B(i+1,j));
            end
        end
        X=evaldeCasteljau1D(S,t);
    end
end
