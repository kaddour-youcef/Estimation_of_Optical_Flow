function plotFlow(u, v, imgOriginal, rSize, scale)
% u and v are the horizontal and vertical optical flow vectors,
% respectively. imgOriginal, if supplied, is the first frame on which the
% flow vectors would be plotted. use an empty matrix '[]' for no image.
% rSize is the size of the region in which one vector is visible. scale
% over-rules the auto scaling.
%FR :
% le flot optique est tracer sur une quiver
% u et v sont les vecteurs de flux optique horizontal et vertical,
% respectivement. imgOriginal, s'il est fourni, est le premier cadre sur lequel le Les vecteurs de flux
% seraient tracés. utilisez une matrice vide '[]' pour aucune image.
% rSize est la taille de la région dans laquelle un vecteur est visible. échelle
% dépasse la mise à l'échelle automatique.

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
