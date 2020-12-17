function [u, v] = Opticflow(im1, im2, alpha, ite, uInitial, vInitial, displayImg)
% im1=rgb2gray(im1);
% im2=rgb2gray(im2);
% 
% im1=double(im1);
% im2=double(im2);
im1=smoothImg(im1,1);
im2=smoothImg(im2,1);
tic;
%%
% valeur intiale des flot optique
u = uInitial;
v = vInitial;
% Estimation les dérivées spatio-temporelles
[fx, fy, ft] = CalculeGradiant(im1, im2);
% Averaging kernel
kernel_1=[1/12 1/6 1/12;1/6 0 1/6;1/12 1/6 1/12];
% Iterations
for i=1:ite
    % Calculer les moyennes locales des vecteurs de flot
    uAvg=conv2(u,kernel_1,'same');
    vAvg=conv2(v,kernel_1,'same');
    % Calcule des vecteurs de flot contraints par sa moyenne locale et les contraintes de flotoptique
    u= uAvg - ( fx .* ( ( fx .* uAvg ) + ( fy .* vAvg ) + ft ) ) ./ ( alpha^2 + fx.^2 + fy.^2); 
    v= vAvg - ( fy .* ( ( fx .* uAvg ) + ( fy .* vAvg ) + ft ) ) ./ ( alpha^2 + fx.^2 + fy.^2);
end
u(isnan(u))=0;
v(isnan(v))=0;
%% tracé

plotFlow(u, v, displayImg, 5, 5); 
end