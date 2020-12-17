function plotFlow(u, v, imgOriginal, rSize, scale)
% le flot optique est tracer sur une quiver
% u et v sont les vecteurs de flux optique horizontal et vertical,
% respectivement. imgOriginal, s'il est fourni, est le premier cadre sur lequel le Les vecteurs de flux
% seraient trac�s. utilisez une matrice vide '[]' pour aucune image.
% rSize est la taille de la r�gion dans laquelle un vecteur est visible. �chelle
% d�passe la mise � l'�chelle automatique.

if nargin>2
    if sum(sum(imgOriginal))~=0
        imshow(imgOriginal,[0 255]);
        hold on;
    end
end
if nargin<4
    rSize=5;
end
if nargin<5
    scale=3;
end
% Enhance the quiver plot visually by showing one vector per region
for i=1:size(u,1)
    for j=1:size(u,2)
        if floor(i/rSize)~=i/rSize || floor(j/rSize)~=j/rSize
            u(i,j)=0;
            v(i,j)=0;
        end
    end
end
quiver(u, v, scale, 'color', 'b', 'linewidth', 2);
set(gca,'YDir','reverse');