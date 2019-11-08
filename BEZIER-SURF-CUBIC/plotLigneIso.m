function plotLigneIso(B,S,u,v)

[~, ~, ~, np]=size(B);

% % Ligne Isophote
figure, hold on
if(length(B(:,:,:)))==0
    error("Il n'y a pas assez de points")
end
%N= bezierPatchNormal(B,u,v);

for k=1:np
    surface(S(:,:,1,k),S(:,:,2,k),S(:,:,3,k), 'FaceColor','y', 'LineStyle', 'none')
    %quiver3(S(:,:,1,k),S(:,:,2,k),S(:,:,3,k),N(:,:,1),N(:,:,2),N(:,:,3))
    surface(B(:,:,1,k),B(:,:,2,k),B(:,:,3,k),'FaceColor','r')
    

end
shading faceted
title('\bf Ligne Isophote');
view(3); box;  view(21,19)
% %-----------------------------------------------% 
