%this file is fot a teste of the estimation of the optical flow on 2 images

% -im1,im2 : two subsequent frames or images.
% -alpha : a parameter that reflects the influence of the smoothness term.
% -ite : number of iterations.
% -uInitial, vInitial : initial values for the flow. If available, the
% flow would converge faster and hence would need less iterations ; default is zero. 
% -displayFlow : 1 for display, 0 for no display ; default is 1.
% -displayImg : specify the image on which the flow would appear ( use an
% empty matrix "[]" for no image. )

im1 = double(imread('Road/0000.pgm'));
im2 = double(imread('Road/0001.pgm'));

imshow('Road/0000.pgm');
figure;
alpha = 1
ite=1
uInitial= 0
vInitial=0
displayFlow =1
displayImg = im2;
[u, v] = Opticflow(im1, im2, alpha, ite, uInitial, vInitial, displayImg)
