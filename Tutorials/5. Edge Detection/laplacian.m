I = imread('blurry_moon.png');
figure, imshow(I, [])
w = fspecial('laplacian', 0);
I1 = imfilter(I, w, 'replicate');
figure, imshow(I1, [])

I2 = im2double(I);
I3 = imfilter(I2, w, 'replicate');
figure, imshow(I3, [])

J = I2 - I3
figure, imshow(J, [])