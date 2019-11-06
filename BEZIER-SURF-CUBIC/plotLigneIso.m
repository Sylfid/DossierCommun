function plotLigneIso(B)

[~, ~, ~, np]=size(B);

% % Ligne Isophote
figure, hold 
axis equal;
for k=1:np
    surface(B(:,1),B(:,2),B(:,3))
end
shading faceted
title('\bf Ligne Isophote');
view(3); box;  view(21,19)
% %-----------------------------------------------% 