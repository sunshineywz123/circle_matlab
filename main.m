clc,clear,close all

%%
I_crop=imread('I_crop.bmp');
I_crop=bwmorph(I_crop,'thin',inf);
imshow(I_crop)
%‘≤≤È’“
rmin=60;
rmax=63;
[centers, radii] = imfindcircles(I,[rmin,rmax],'Sensitivity',0.9);
% Display the circle
viscircles(centers,radii);

