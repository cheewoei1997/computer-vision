img = imread('olaf.jpg');
img = rgb2gray(img);
figure, imshow(img, []), title('Original image')

% Simulate a motion blur image
LEN = 21; THETA = 11;
motion_noise = fspecial('motion', LEN, THETA);
blurred = imfilter(img, motion_noise, 'conv', 'circular');
figure, subplot(1,2,1), imshow(blurred), title('Blurred image')

% Deblurring the image with Wiener filter
uniform_quantization_var = (1/256)^2/12;
signal_var = var(im2double(img(:)));
wnr = deconvwnr(blurred, motion_noise, uniform_quantization_var/signal_var);
subplot(1,2,2), imshow(wnr), title('Restoration of Blurred Image')