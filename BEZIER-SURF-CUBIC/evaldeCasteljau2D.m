function X = evaldeCasteljau2D(B,t,s)

    if length(B(:,1,1))==1
        X=B(1,1,:);
        error("bizarre");
    else
        S=[];
        for i=1:length(B(1,:,1))
            Sinter=evaldeCasteljau1D(B(:,i,:),t);
            S(i,1)=Sinter(1);
            S(i,2)=Sinter(2);
            S(i,3)=Sinter(3);
        end
        X=evaldeCasteljau1D(S,s);
    end



    































