# matlab-object-detection-by-area
Object detection based on area using MATLAB (Image Processing) 
## Project Description
In this project, using image processing in matlab, different objects (apple, orange, eraser and pen) are recognized based on their area. The output is displayed as a binary image.
## Procedure
Reading the image
Converting the image to binary format using the `im2bw` function
Thresholding
Removing noise and filling holes using the `bwareaopen` function
Calculating the area of ​​objects with the `regionprops` function
Separating objects based on the area range
Displaying the binary output
## How to run
Open the `main.m` file in MATLAB.
Set the path to the images.
Run the script.
## Requirements
- MATLAB R2023a
- Image Processing Toolbox
## Output
![Output](<img width="1271" height="620" alt="apple1" src="https://github.com/user-attachments/assets/3ac60e6d-cb16-478b-8c4a-f187b02c83c5" />)
