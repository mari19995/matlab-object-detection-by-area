# Invariant Moments

This project investigates and calculates **Hu's Invariant Moments**.
Hu's Invariant Moments are a set of seven numerical properties that remain approximately constant under the following geometric transformations:
- Translation
- Scale
- Rotation
- Reflection / Flipping
The main goal of the project is to demonstrate this important property in image processing.

---
## Project Description
In this project, an input image is subjected to various transformations and then Hu's Invariant Moments are calculated for each version.
The results are displayed in a table format so that the stability of the moment values ​​can be observed.

The transformations applied include:
- Original image (with padding)
- Translated image
- Downsampled image
- Flipped image
- Rotated image by 45 degrees
- Rotated image by 90 degrees

---
## Project files
| `invmoments_BookCode_Part1.m` | First version of the code – reads the pre-prepared images (`fig1.tif` to `fig6.tif`) and calculates the moments. |
| `invmoments_main_Part2.m` | Second version of the code – reads the original image, applies the transformations, saves the images. |

---
## Prerequisites
- MATLAB software (version R2023a or higher is recommended)
- Image Processing Toolbox
- Input images in the same folder as the codes:
- For `file1.m`: `fig1.tif` to `fig6.tif` files
- For `file2.m`: `fig20.bmp` file

---
## Project outputs
- Six converted images are displayed and saved in BMP format.
- Comparison table of the values ​​of the seven Huey-Naverda moments (`φ1` to `φ7`) for each transformation
- In the second version: The table of moments is displayed in the Command Window and is also saved in an Excel file.

### Normalization of moments
To better display very small moments, the following formula is used:
```matlab
phi_norm = -sign(phi) .* log10(abs(phi));
