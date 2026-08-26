clc; clear all;

% Read the image
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'});
RGB = strcat(pathname, filename);
img = imread(RGB);

if (ndims(img) ~= 3)
    error('the input image is not RGB image!!!!')
end

% Convert the image to HSV color space
hsv_img = rgb2hsv(img);

% Extract the different channels of the HSV image
h = hsv_img(:,:,1); % Hue channel
s = hsv_img(:,:,2); % Saturation channel
v = hsv_img(:,:,3); % Value channel
% h Values are in [0, 1] range and we need to map it into [0, 360] range.
h= h.*360;
% Define thresholds for skin color in HSV space
h_low = 0;
h_high = 50;
s_low = 0.1;
s_high = 0.68;
v_low = 0.35;
v_high = 1;

% Create a binary mask for skin pixels
skin_mask = (h >= h_low & h <= h_high) & (s >= s_low & s <= s_high) & (v >= v_low & v <= v_high);

% Display the original image and the skin mask
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(skin_mask);
title('Skin Mask for HSV');
