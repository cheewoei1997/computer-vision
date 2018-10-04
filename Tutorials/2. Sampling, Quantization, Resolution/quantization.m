I = imread('tanker.jpg');
I = rgb2gray(I);

I1 = bitand(I, 128);
I2 = bitand(I, 128+64);
I3 = bitand(I, 128+64+32);
I4 = bitand(I, 128+64+32+16);
I5 = bitand(I, 128+64+32+16+8);

subplot(2, 3, 1)
imshow(I, []), title('Original Image')

subplot(2, 3, 2)
imshow(I1, []), title('1 bit image')

subplot(2, 3, 3)
imshow(I2, []), title('2 bit Image')

subplot(2, 3, 4)
imshow(I3, []), title('3 bit Image')

subplot(2, 3, 5)
imshow(I4, []), title('4 bit Image')

subplot(2, 3, 6)
imshow(I5, []), title('5 bit Image')
