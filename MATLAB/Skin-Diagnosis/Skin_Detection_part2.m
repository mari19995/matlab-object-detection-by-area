clc; clear all; close all;

% Read the input image
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'});
RGB = strcat(pathname, filename);
img = imread(RGB);

if (ndims(img) ~= 3)
    error('the input image is not RGB image!!!!')
end

% Convert the image to the YCbCr color space
img_ycbcr = rgb2ycbcr(img);

% Extract the Y, Cb, and Cr components9
Y = img_ycbcr(:, :, 1);
Cb = img_ycbcr(:, :, 2);
Cr = img_ycbcr(:, :, 3);

% Define the skin color thresholds for YCbCr
Y_min = 80;
Cb_min = 77;
Cb_max = 127;
Cr_min = 133;
Cr_max = 173;
% Create a binary mask for skin detection
skin_mask = (Y >= Y_min ) & (Cb >= Cb_min & Cb <= Cb_max) & (Cr >= Cr_min & Cr <= Cr_max);

% Display the original image and the skin mask
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(skin_mask);
title('Skin Mask for YCbCr');
