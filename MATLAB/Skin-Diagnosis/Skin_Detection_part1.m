clc; clear all; close all;

% Read the color image
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'});
RGB = strcat(pathname, filename);
img = imread(RGB);

if (ndims(img) ~= 3)
    error('the input image is not RGB image!!!!')
end

% Split the image into RGB channels
R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);

% Find skin pixels using the given measures
skin_pixels = (R > 95) & (G > 95) & (B > 95) &(max(max(R, G), B) ...
    - min(min(R, G), B) > 15) & (abs(R - G) > 15) & (R > G) &(R > B);

% Display the original image and the skin mask
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(skin_pixels);
title('Skin Mask for RGB ');
