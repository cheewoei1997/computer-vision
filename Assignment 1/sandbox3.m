I = imread('images/plantation.jpg');
I = rgb2gray(I)
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

% % Threshold the Image
% % Need to perform adaptive thresholding?
% level = graythresh(I3);
% bw = im2bw(I3,level);
% figure, imshow(bw)

C = 0.0003; ws = 30;
fun = @(block_struct)im2bw(block_struct.data, graythresh(block_struct.data)-C);
BW_adapt = blockproc(I3, [ws ws], fun);
figure, imshow(BW_adapt), title('T - C')

% se1 = strel('disk', 2, 0);
% img1 = imopen(bw, se1);    % Remove the noise by opening
% img2 = imclose(img1, se1);
% figure, imshow(img2)
% 
% diff = bw - img2
% figure, imshow(img2)

% % Label objects in the image
% [labeled, numObjects] = bwlabel(bw,4);
% numObjects
