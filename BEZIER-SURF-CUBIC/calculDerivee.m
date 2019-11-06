function D = calculDerivee(B,dir)
    if dir>2|dir<1
        error("La direction est invalide")
    Drep=[];
    for i=1:length(B(:,1,1))+dir-2
        for j=1:length(B(1,:,1))+1-dir
            for p=1:length(B(1,1,:))
                if dir==1
                    Drep(i,j,p)=(length(B(:,1,1))-1)*(B(i+1,j,p)-B(i,j,p));
                else
                    Drep(i,j,p)=(length(B(1,:,1))-1)*(B(i,j+1,p)-B(i,j,p));
                end
            end
        end
    end
    D=Drep;

