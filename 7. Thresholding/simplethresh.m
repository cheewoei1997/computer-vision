I = imread('donation.jpg');
figure, subplot(1, 2, 1)
imshow(I, []), title('Original Image')

T = graythresh(I);
I2 = im2bw(I, T);
subplot(1, 2, 2)
imshow(I2, []), title('Gray threshold')