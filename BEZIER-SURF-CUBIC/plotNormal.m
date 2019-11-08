function plotNormal(B,S,u,v)
    [~, ~, ~, np]=size(B);

% % Ligne Isophote
figure, hold on

N= bezierPatchNormal2(B,u,v);

for k=1:np
    surface(S(:,:,1,k),S(:,:,2,k),S(:,:,3,k), 'FaceColor','y', 'LineStyle', 'none')
    quiver3(S(:,:,1,k),S(:,:,2,k),S(:,:,3,k),N(:,:,1),N(:,:,2),N(:,:,3))

end
shading faceted
title('\bf Ligne Isophote');
view(3); box;  view(21,19)
% %-----------------------------------------------% 