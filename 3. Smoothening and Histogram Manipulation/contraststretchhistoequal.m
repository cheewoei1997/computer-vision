img = imread('pout.jpg');
figure, subplot(1, 2, 1);
imshow(img, []), title('Original image')

subplot (1, 2, 2)   % shows the histogram of the image
imhist(img), title('Histogram of original image')

img1 = imadjust(img);       % code for contrast stretching
figure, subplot(2, 2, 1)
imshow(img1, []), title('Contrast Stretching')

subplot (2, 2, 2)
imhist(img1), title('Histogram of contrast stretching')

img2 = histeq(img);         % code for histogram equalization
subplot (2, 2, 3)
imshow(img2, []), title('Histogram equalization')

subplot (2, 2, 4)
imhist(img2), title('Equalized Histogram')