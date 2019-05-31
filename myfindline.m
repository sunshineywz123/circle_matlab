clc,clear,close all
RGB = imread('gantrycrane.png');
I_gray= rgb2gray(RGB);
% imshow(I) 
% hold on
%%
I=edge(I_gray,'sobel');

% imshow(I)
%%
[H,T,R]=hough(I,'RhoResolution',0.5,'ThetaResolution',0.5);
% imshow(imadjust(mat2gray(H)));
% % colormap(hot)
% axis on, axis normal, hold on;
%%
P=houghpeaks(H,3);
% % plot(T(P(:,2)),R(P(:,1)),'s','color','red');
% rho=P(2,1);
% theta=P(2,2);
% x=1:2000;
% y=(rho-x*cos(theta))/(sin(theta));
% plot(x,y,'color','blue')
%%
lines = houghlines(I,T,R,P);
figure, imshow(I_gray), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   x=xy(:,1);
   y=xy(:,2);
   plot(x,y,'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

