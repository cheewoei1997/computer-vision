% I = im2double(imread('images/ultrasound.jpg'));
% I = rgb2gray(I);
% figure, imshow(I)
% PSF = fspecial('motion', 10, 30);
% V = .5;
% WT = zeros(size(I));
% WT(5:end-4,5:end-4) = 1;
% J1 = deconvlucy(I,PSF);
% figure,imshow(J1);
% title('deconvlucy(A,PSF)');
% figure, imshow(WT), title('Weight')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

img = imread('images/ultrasound.jpg');
img = rgb2gray(img);
img = im2double(img)
figure, subplot(2, 2, 1)
imshow(img, []), title('Blurred image')

imgclear = imread('images/ultrasoundclear.jpg');
subplot(2, 2, 2)
imshow(imgclear, []), title('Desired image')

LEN = 10; THETA = 30;
motion_noise = fspecial('motion', LEN, THETA);

wnr = deconvwnr(img, motion_noise, 0.01);
luri = deconvlucy(img, motion_noise);
subplot(2, 2, 3), imshow(wnr), title('Deblur using Wiener');
subplot(2, 2, 4), imshow(luri), title('Deblur using Lucy-Richardson');

% WEIGHT = edge(wnr,'sobel',.08);
% 
% se = strel('disk',2);
% WEIGHT = 1-double(imdilate(WEIGHT,se));
% 
% WEIGHT([1:3 end-(0:2)],:) = 0;
% WEIGHT(:,[1:3 end-(0:2)]) = 0;
% figure; imshow(WEIGHT); title('Weight array');
% 
% PSF = fspecial('gaussian',7,10);
% UNDERPSF = ones(size(PSF)-4);
% OVERPSF = padarray(UNDERPSF,[4 4],'replicate','both');
% INITPSF = padarray(UNDERPSF,[2 2],'replicate','both');
% 
% V = .5;
% WT = zeros(size(img));
% WT(5:end-4,5:end-4) = 1;
% 
% [J, P] = deconvblind(img,PSF,30,[],WT);
% figure;imshow(J);title('Deblurred Image');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% noise_var = 0.001;
% estimated_nsr = noise_var / var(img(:));
% wnr3 = deconvwnr(img, motion_noise, estimated_nsr);
% figure, imshow(wnr3)
% title('Restoration of Blurred, Noisy Image Using Estimated NSR');

% % Simulate a motion blur image
% LEN = 10; THETA = 30;
% motion_noise = fspecial('motion', LEN, THETA);
% blurred = imfilter(img, motion_noise, 'conv', 'circular');
% figure, imshow(blurred), title('Blurred image')

% % Deblurring the image with Wiener filter
% uniform_quantization_var = (1/256)^2/12;
% signal_var = var(im2double(img(:)));
% wnr = deconvwnr(img, motion_noise, uniform_quantization_var/signal_var);
% figure, imshow(wnr), title('Restoration of Blurred Image')