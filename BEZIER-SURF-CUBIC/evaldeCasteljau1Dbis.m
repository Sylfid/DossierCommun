function X = evaldeCasteljau1D(B,t)
    if size(B,1)==1
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

function X = evaldeCasteljau2D(B,t,s)
    if length(B(:,1,1))==1
        X=B(1,1,:);
    else
        S=[];
        for i=1:length(B(1,:,1))
            S(i)=evaldeCasteljau1D(B(:,i,:),t);
        end
        X=evaldeCasteljau1D(S,s);
    end
end
