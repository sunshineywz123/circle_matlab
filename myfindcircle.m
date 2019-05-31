clc,clear,close all
I=imread('I_crop.bmp');
% I=rgb2gray(I);
% imshow(I)
%%
% BW=edge(I,'sobel');
BW=I;
imshow(BW)
hold on
%%
step_r=1;
step_angle=1;
r_min=60;
r_max=63;
p=1;
[hough_space,hough_circle,para] = hough_circle(BW,step_r,step_angle,r_min,r_max,p);
% imshow(hough_circle)
message = sprintf('最大值为阈值 %2.2f ',p);
text(15,15,message,'Color','y','FontWeight','bold');
%%
centers=[para(2,:)',para(1,:)'];
radii=para(3,:);
viscircles(centers,radii);