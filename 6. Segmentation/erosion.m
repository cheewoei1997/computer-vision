img = imread('wirebond.png');
subplot(2,3,1), imshow(img,[]), title('Original image');

se = strel('disk', 5);      % erode with shape of a disk at radius of 5
img1 = imerode(img, se);
subplot(2,3,2), imshow(img1, []), title('Erosion with radius 5')

se = strel('disk', 10);     % figure the rest out yourself lads
img1 = imerode(img, se);
subplot(2,3,3), imshow(img1, []), title('Erosion with radius 10')

se = strel('disk', 15);     % it's pretty self-explanatory if I say so myself
img1 = imerode(img, se);
subplot(2,3,4), imshow(img1, []), title('Erosion with radius 15')

se = strel('disk', 20);
img1 = imerode(img, se);
subplot(2,3,5), imshow(img1, []), title('Erosion with radius 20')

se = strel('disk', 25);
img1 = imerode(img, se);
subplot(2,3,6), imshow(img1, []), title('Erosion with radius 25')