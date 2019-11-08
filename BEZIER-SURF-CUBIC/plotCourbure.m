function plotCourbure(B,S,u,v)
    K=courbure(B,u,v);
    C=couleurCourbure(K);
    
    [~, ~, ~, np]=size(B);

    for k=1:np
        surface(S(:,:,1,k),S(:,:,2,k),S(:,:,3,k),K(:,:,k),  'LineStyle', 'none')

    end
    colorbar
    view(3)

