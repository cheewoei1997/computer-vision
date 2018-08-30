img = imread('shapes.png');
subplot(1, 2, 1), imshow(img,[]), title('Original image');

se = strel('square',20); 
img1 = imerode(img, se);    % Destroy the image to remove unncessary connections.
se1 = strel('square',40);
img2 = imdilate(img1, se1); % Recontruct the image to fix it.

subplot(1, 2, 2), imshow(img2, []), title('Erode and dilate')