I = imread('skull.png');
I = rgb2gray(I);
figure, subplot(2, 2, 1)
imshow(I, []), title('Original image')
mask1 = ones(2, 2);
mask2 = ones(4, 4);

I2 = conv2(I, mask1);   % removes only some noise and smoothen image
subplot(2, 2, 2)
imshow(I2, []), title('Convolution using 2x2 mask')

I3 = conv2(I, mask2);   % smoothening is too much, it's blurred
subplot(2, 2, 3)
imshow(I3, []), title('Convolution using 4x4 mask')

I4 = medfilt2(I);       % median filter seems to be better off
subplot(2, 2, 4)
imshow(I4, []), title('Median filter')