img = imread('images/ultrasound.jpg');
img = rgb2gray(img);
figure, imshow(img, []), title('Original image')

% % Simulate a motion blur image
% LEN = 21; THETA = 11;
% motion_noise = fspecial('motion', LEN, THETA);
% blurred = imfilter(img, motion_noise, 'conv', 'circular');
% figure, imshow(blurred), title('Blurred image')

% % Deblurring the image with Wiener filter
% uniform_quantization_var = (1/256)^2/12;
% signal_var = var(im2double(img(:)));
% wnr = deconvwnr(img, motion_noise, uniform_quantization_var/signal_var);
% figure, imshow(wnr), title('Restoration of Blurred Image')