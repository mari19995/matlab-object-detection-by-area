clear all;
close all;
clc;

% fi = imread("fig1.tif");
%  f = im2gray(fi);
% 
% fp = padarray(f, [84 84], "both"); % Padded for display.
% ftrans = padarray(f, [70 70], "pre");
% 
% fhs = f(1:2:end, 1:2:end);
% fhsp = padarray(fhs, [184 184], 'both');
% % A mirrored image was obtained using function flip:
% fm = flip(f, 2);
% fmp = padarray(fm, [84 84], 'both'); % Padded for display.
% 
% % To rotate the image we use function imrotate:
%  angle = 45; % Specify the angle of rotation.
%  method = 'bilinear'; % Specify the method of rotation.
%  g = imrotate(f, angle, method, 'crop');
% 
% % fr45 = imrotate(f, 45, "bilinear");
% fr90 = imrotate(f, 90, "bilinear");
% fr90p = padarray(fr90, [84 84], "both");

fp = imread('fig1.tif');
ftrans = imread('fig2.tif');
fhsp = imread('fig3.tif');
fmp = imread('fig4.tif');
g = imread('fig5.tif');
fr90p = imread('fig6.tif');


phi1 = invmoments(fp);
phi1norm = (-sign(phi1)) .* (log10(abs(phi1)));

phi2 = invmoments(ftrans);
phi2norm = (-sign(phi2)) .* (log10(abs(phi2)));

phi3 = invmoments(fhsp);
phi3norm = (-sign(phi3)) .* (log10(abs(phi3)));

phi4 = invmoments(fmp);
phi4norm = (-sign(phi4)) .* (log10(abs(phi4)));

phi5 = invmoments(g);
phi5norm = (-sign(phi5)) .* (log10(abs(phi5)));

phi6 = invmoments(fr90p);
phi6norm = (-sign(phi6)) .* (log10(abs(phi6)));


figure;
subplot(2, 3, 1);
imshow(fp);
title('Padded Original Image');

subplot(2, 3, 2);
imshow(ftrans);
title('Translated Image');

subplot(2, 3, 3);
imshow(fhsp);
title('Downsampled Image');

subplot(2, 3, 4);
imshow(fmp);
title('Flipped Image');

% figure;
subplot(2, 3, 5);
imshow(g);
title('Rotated 45 degrees');

subplot(2, 3, 6);
imshow(fr90p);
title(' Rotated 90 degrees');

moment_invariant = ['phi1'; 'phi2'; 'phi3'; 'phi4'; 'phi5'; 'phi6';
'phi7'];
orginalimage = phi1norm(:);
translated =   phi2norm(:);
halfsize =     phi3norm(:);
mirrored =     phi3norm(:);
rot45 =        phi5norm(:);
rot90 =        phi6norm(:);
Table = table(moment_invariant, orginalimage, translated,halfsize, mirrored, rot45, rot90);
disp('Table:');
disp(Table);

