function G=gaussFilter(segma,kSize)
% Crée un filtre gaussien 1-D d'un écart type 'sigma' et d'une taille
% «kSize».
if nargin<1
    segma=1;
end
if nargin<2
    kSize=2*(segma*3);
end
x=-(kSize/2):(1+1/kSize):(kSize/2);
G=(1/(sqrt(2*pi)*segma)) * exp (-(x.^2)/(2*segma^2));