img = imread('fingerprint.png');
subplot(1, 2, 1), imshow(img,[]), title('Original image');
% Start off with a noisy af image

se1 = strel('square',3);
img1 = imopen(img, se1);    % Remove the noise by opening
img2 = imclose(img1, se1);  % Connect back the image by closing

subplot(1, 2, 2), imshow(img2, []), title('Opened and closed')