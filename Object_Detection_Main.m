close all; 
clear all;
clc;
% Read the image
image = imread('aa2.jpg');
% Make the image binary
bw2 = (im2bw(image, 0.1));
figure;
imshow(bw2);
% Clean the binary image by removing extra pixels
% any object with an area smaller than 300 pixels will be removed.
cleanedImage = bwareaopen(bw2, 300); 
% Calculate the area and perimeter of objects in the image
stats = regionprops(cleanedImage, 'Area', 'Perimeter', 'Centroid', 'BoundingBox');
% Count the number of objects
numObjects = numel(stats);

% Generate a text file with descriptive information
textFile = fopen('Desc.txt', 'w');

fprintf(textFile, 'The image contains %d object(s).\n', numObjects);
for i = 1:numObjects
    fprintf(textFile, 'Object %d:\n', i);
    fprintf(textFile, '  Area = %d pixels\n', stats(i).Area);
    fprintf(textFile, '  Perimeter = %0.2f pixels\n', stats(i).Perimeter);
    
    % Label objects based on area and perimeter
    if (stats(i).Area >= 14000 && stats(i).Area <= 15500) && (stats(i).Perimeter >= 400.00 && stats(i).Perimeter <= 500.00)
        fprintf(textFile, '  Label: Apple\n');
    elseif (stats(i).Area >= 15000 && stats(i).Area <= 21000) && (stats(i).Perimeter >= 450.00 && stats(i).Perimeter <= 550.00)
        fprintf(textFile, '  Label: Orange\n');
    elseif (stats(i).Area >= 4000 && stats(i).Area <= 5000) && (stats(i).Perimeter >= 455.00 && stats(i).Perimeter <= 900.00)
        fprintf(textFile, '  Label: Pen\n');
    elseif (stats(i).Area >= 4000 && stats(i).Area <= 6500) && (stats(i).Perimeter >= 200.00 && stats(i).Perimeter <= 450.00)
        fprintf(textFile, '  Label: eraser\n');
    else
        fprintf(textFile, '  Label: Unknown\n');
    end
end


fclose(textFile);

% Read the text file
fileContent = fileread('Desc.txt');

% Display the file content
disp(fileContent);

% Display the labeled objects on the image
figure;
imshow(cleanedImage);
hold on;
for i = 1:numObjects
    text(stats(i).Centroid(1), stats(i).Centroid(2), ['Object ' num2str(i)], 'Color', 'r', 'HorizontalAlignment', 'center');
end
hold off;
