% Choose from course.jpg, smooth.jpg, uniform.jpg
img_coarse = imread('uniform.jpg')          % rename it here
img_coarse_cropped = imcrop(img_coarse)     % choose the area to crop
figure, imshow(img_coarse_cropped)          % then double-click it

% Prints out the GLCM descriptors for the cropped area
glcm_coarse = graycomatrix(img_coarse_cropped, 'offset', [10 10])
stats_coarse = graycoprops(glcm_coarse)