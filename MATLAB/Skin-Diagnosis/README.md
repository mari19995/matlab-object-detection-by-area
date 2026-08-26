# Skin Recognition Project with Matlab
## Project Description
In this exercise, we are going to extract the skin pixels in the images. In this exercise, we used three techniques
`HSV, YCbCr, RGB` to detect the skin pixels. We have a number of images that are available as Ground Truth images and we use them to compare the results.
The code for the skin pixel extraction function using the `RGB` method is available in `Skin_Detection_part1`.
The output of this part is as follows:
<img width="558" height="499" alt="ex-rgb" src="https://github.com/user-attachments/assets/0c4f28bb-46ca-455a-8e48-fafc935160d0" />

The code for the skin pixel extraction function using the `YCbCr` method is available in `Skin_Detection_part2`.
In this part, the image is converted from the RGB color space to YCbCr using the MATLAB `rgb2ycbcr` function. Then, the Y, Cb and Cr channels are separated and stored in separate arrays. Next, by applying the skin detection rules based on the YCbCr method that are defined in related articles, the skin pixels are detected and output. The output of this part will be as follows:
<img width="556" height="498" alt="ex-ycbcr" src="https://github.com/user-attachments/assets/5b44a6f5-a635-4404-98b0-b34f44517bfc" />

The code for the function to extract skin pixels using the `HSV` method is available in `Skin_Detection_part3`.
All changes have been applied in accordance with the skin detection rules based on the methods defined in the related articles.
The output of this part will be as follows:
<img width="555" height="498" alt="ex-hsv" src="https://github.com/user-attachments/assets/261395db-2519-45f6-bec4-e24217251e68" />
