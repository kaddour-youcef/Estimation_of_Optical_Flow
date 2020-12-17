function smoothedImg=smoothImg(img,segma)
% Convolution de l'image avec le filtre gaussien 

if nargin<2
    segma=1;
end
G=gaussFilter(segma);
smoothedImg=conv2(img,G,'same');
smoothedImg=conv2(smoothedImg,G','same');