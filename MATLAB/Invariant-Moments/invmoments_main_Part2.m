clc; clear all; close all;

fi = imread("fig20.bmp");
% Convert the image to grayscale
f = rgb2gray(fi); 

% Pad the image with zeros around the edges
fp = padarray(f, [100 100], "both");
ftrans = padarray(f, [80 80], 'pre'); % Pad the image with zeros at the beginning

fhs = f(1:2:end, 1:2:end);
fhsp = padarray(fhs, [184 184], 'both');% Pad the downsampled image

fm = flip(f, 2); % Flip the image horizontally
fmp = padarray(fm, [84 84], 'both'); % Pad the flipped image

angle = 45; % Set the rotation angle
method = 'bilinear';
g = imrotate(fp, angle, method, 'crop');

fr90 = imrotate(f, 90, "bilinear"); % Rotate the original image by 90 degrees
fr90p = padarray(fr90, [84 84], "both");

%***************************listdlg************************************************************
% Define the list of colors
options = {'I am happy', 'I am sad', 'I was surprised', 'Amazing', 'Good job'};

% Correctly structure the properties for the list dialog using parameter-value pairs
[indx, ok] = listdlg ('ListString', {options{:}},...
              'SelectionMode', 'single',...
              'ListSize', [300 150],...
              'Name', 'Program Feedback',...
              'PromptString', 'How do you feel about this program?',...
              'OKString', 'OK',...
              'CancelString', 'Cancel');

% Check if the user clicked OK and display the selected color
if ok
    selectedIndex = options{indx};
    disp(['user selected: ', selectedIndex]);
else
    disp('Operation cancelled by the user.');
end
disp('----------------------------------------------------------');
%**********************************end listdlg*********************************************************
figure
subplot(2, 3, 1);
imshow(fp);
title('Original Image');
imwrite(fp, 'Padded_Original_Image.bmp');

subplot(2, 3, 2);
imshow(ftrans);
title('Translated Image');
imwrite(ftrans, 'Translated_Image.bmp');

subplot(2, 3, 3);
imshow(fhsp);
title('Downsampled Image');
imwrite(fhsp, 'Downsampled_Image.bmp');

subplot(2, 3, 4);
imshow(fmp);
title('Flipped Image');
imwrite(fmp, 'Flipped_Image.bmp');

subplot(2, 3, 5);
imshow(g);
title('Rotated 45 degrees');
imwrite(g, 'Rotated_45_degrees.bmp');

subplot(2, 3, 6);
imshow(fr90p);
title('Rotated 90 degrees');
imwrite(fr90p, 'Rotated_90_degrees.bmp');

phi1 = invmoments(f);
phi1norm = -sign(phi1) .* (log10(abs(phi1)));

phi2 = invmoments(f);
phi2norm = -sign(phi2) .* (log10(abs(phi2)));

phi3 = invmoments(f);
phi3norm = -sign(phi3) .* (log10(abs(phi3)));

phi4 = invmoments(f);
phi4norm = -sign(phi4) .* (log10(abs(phi4)));

phi5 = invmoments(f);
phi5norm = -sign(phi5) .* (log10(abs(phi5)));

phi6 = invmoments(f);
phi6norm = -sign(phi6) .* (log10(abs(phi6)));

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

writetable(Table, 'InvMoment.xlsx');

