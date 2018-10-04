img = imread('broken_text.png');
se = [0 1 0; 1 1 1; 0 1 0]; % 3x3 and diamond shape
img2 = imdilate(img, se);

subplot(1,2,1), imshow(img, []), title('Original image');
subplot(1,2,2), imshow(img2, []), title('Dilated image');

% Output obtained much thicker than before.