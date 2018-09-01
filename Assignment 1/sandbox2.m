temp = imread('images/template.jpg');
ref = imread('images/reference.jpg');
temp = rgb2gray(temp);
ref = rgb2gray(ref);

diff1 = temp - ref;     % obtain the difference between the 2 images
diff2 = ref - temp
diff = diff1 + diff2
img = imcomplement(diff)
figure, imshow(img, []), title('Difference image')

img = imadjust(img);   % perform contrast stretching cuz why not
figure, imshow(img, []), title('Contrast Stretching')

ws = 5;
fun = @(block_struct)im2bw(block_struct.data, graythresh(block_struct.data));
BW_adapt = blockproc(img, [ws ws], fun);
figure, imshow(BW_adapt), title('Adaptive thresholding with blockproc')

img = medfilt2(img, [3 3]);
figure, imshow(img), title('Improved image')
img = im2double(img)



% img = imadjust(img);   % perform contrast stretching cuz why not
% figure, imshow(img, []), title('Contrast Stretching')

% img = medfilt2(img, [3 3]);
% figure, imshow(img), title('Improved image')

% % Code below is totally unnecessary
% se1 = strel('square', 2);
% img1 = imopen(img, se1);    % Remove the noise by opening
% img2 = imclose(img1, se1);  % Connect back the image by closing
% figure, imshow(img1, []), title('Open')
% figure, imshow(img2, []), title('Close')
