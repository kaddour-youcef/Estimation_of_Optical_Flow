function smoothedImg=smoothImg(img,segma)
%convolution with the gaussian kernel for the smoothing of the image
% Convolution de l'image avec le filtre gaussien 

if nargin<2
    segma=1;
end
G=gaussFilter(segma);
smoothedImg=conv2(img,G,'same');
smoothedImg=conv2(smoothedImg,G','same');
