I = imread('rice.png');
figure, imshow(I)

% Use Morphological Opening to Estimate the Background
background = imopen(I,strel('disk',15));
figure, imshow(background)

% Subtract the Background Image from the Original Image
I2 = I - background;
figure, imshow(I2)

% Increase the Image Contrast
I3 = imadjust(I2);
figure, imshow(I3);

% Threshold the Image
level = graythresh(I3);
bw = im2bw(I3,level);
figure, imshow(bw)

% Label objects in the image
[labeled, numObjects] = bwlabel(bw,4);
numObjects
