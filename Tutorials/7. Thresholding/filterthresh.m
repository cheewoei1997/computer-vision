% This code is incomplete.

img = imread('poem.jpg');
img = rgb2gray(img);
img = im2double(img);
figure
imshow(img, []), title('Original image')

% T = graythresh(img);
% BW = im2bw(img, T);
% img = medfilt2(img, [3 3]);
% figure, imshow(BW, []), title('Image')
% subplot(1, 2, 2)
% imshow(BW, []), title('Graythresh')

% img_canny = edge(img, 'canny');
% figure, imshow(img_canny, []), title('Canny')
% img = img - img_canny

% % Detect Entire Cell
% [~, threshold] = edge(img, 'sobel');
% fudgeFactor = .5;
% img = edge(img,'sobel', threshold * fudgeFactor);
% figure, imshow(img), title('Binary gradient mask')

background = imopen(img,strel('disk',15));
figure, imshow(background)
img = img - background;
figure, imshow(img, []), title('no bg')



w = fspecial('laplacian', 0);
I1 = imfilter(img, w, 'replicate');
figure, imshow(I1, []), title('cast w')

I2 = im2double(I1)
I3 = imfilter(I2, w, 'replicate');
img = I2 - I3


figure, imshow(img, []), title('Laplacian')

[~, threshold] = edge(img, 'sobel');
fudgeFactor = .5;
img = edge(img,'sobel', threshold * fudgeFactor);
figure, imshow(img), title('Binary gradient mask')

se90 = strel('line', 1, 90);
se0 = strel('line', 1, 0);
img = imdilate(img, [se90 se0]);
figure, imshow(img), title('Dialte')

% img = imclearborder(img, 4);



% w = fspecial('laplacian', 0);
% I1 = imfilter(I, w, 'replicate');
% figure, imshow(I1, [])
% 
% I2 = im2double(I);
% I3 = imfilter(I2, w, 'replicate');
% figure, imshow(I3, [])
% 
% J = I2 - I3

figure, imshow(img, []), title('Lmao')

background = imopen(img,strel('square',15));
figure, imshow(background)

ws = 5;
fun = @(block_struct)im2bw(block_struct.data, graythresh(block_struct.data));
BW_adapt = blockproc(img, [ws ws], fun);
figure, imshow(BW_adapt), title('Adaptive thresholding with blockproc')

C = 0.003;
fun = @(block_struct)im2bw(block_struct.data, graythresh(block_struct.data)-C);
BW_adapt = blockproc(img, [ws ws], fun);
figure, imshow(BW_adapt), title('T-C')

% mask = fspecial('average', 3);
% imgnew = filter2(mask, BW_adapt)/255;
% h = 1/3*ones(3,1);
% H = h*h';
% imgnew = filter2(H, BW_adapt);
% figure, imshow(BW_adapt), title('Noisy image (Gaussian)')
% figure, imshow(imgnew), title('Improved image')