temp = imread('images/template.jpg');
ref = imread('images/reference.jpg');
temp = rgb2gray(temp);
ref = rgb2gray(ref);

diff1 = temp - ref;     % obtain the difference between the 2 images
diff2 = ref - temp
diff = diff1 + diff2
figure, imshow(diff, []), title('Difference image')

img = imadjust(diff);   % perform contrast stretching cuz why not
figure, imshow(img, []), title('Contrast Stretching')

% % Code below is totally unnecessary
% se1 = strel('square', 2);
% img1 = imopen(img, se1);    % Remove the noise by opening
% img2 = imclose(img1, se1);  % Connect back the image by closing
% figure, imshow(img1, []), title('Open')
% figure, imshow(img2, []), title('Close')
