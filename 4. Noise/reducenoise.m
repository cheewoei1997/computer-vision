img = imread('olaf.jpg');
img = rgb2gray(img);
figure, imshow(img, []), title('Original image')
[M, N] = size(img);

% Uniform noise
a = 0.5;
b = 1;
uniform_noise = a+ (b-a) * rand(M, N);
figure, subplot(1,2,1), imshow(uniform_noise), title('uniform noise')

img_uniform_noise = addnoise(img, uniform_noise);
subplot(1,2,2), imshow(img_uniform_noise), title('Image with uniform noise')

% Gaussian noise
gaussian_noise = a + b * rand(M, N);
figure, subplot(1,2,1), imshow(gaussian_noise), title('Gaussian Noise')
img_gaussian_noise = addnoise(img, gaussian_noise);
subplot(1,2,2), imshow(img_gaussian_noise), title('Image with Gaussian Noise')

% Salt and Pepper noise
a = 0.05;
b = 0.05;
sp_noise(1:M, 1:N) = 0.05;
X = rand(M, N);
c = find(X<=a);
R(c) = 1;
u = a + b;
c = find(X>a & X<=u);
sp_noise(c) = 1;
figure, subplot(1,2,1), imshow(sp_noise), title('Salt and pepper noise')
img_sp_noise = addnoise(img, sp_noise);
subplot(1,2,2), imshow(img_sp_noise), title('Image with salt&pepper nosie')

% Remove Gaussian noise with average filter
mask = fspecial('average', 3);
improved_img_gaussian_noise = filter2(mask, img_gaussian_noise)/255;
figure, subplot(1,2,1), imshow(img_gaussian_noise), title('Noisy image (Gaussian)')
subplot(1,2,2), imshow(improved_img_gaussian_noise), title('Improved image')

% Remove salt & pepper noise with average filter
improved_img_sp_noise = medfilt2(img_sp_noise, [3 3]);
figure, subplot(1,2,1), imshow(img_sp_noise), title('Noisy image (salt & pepper)')
subplot(1,2,2), imshow(improved_img_sp_noise), title('Improved image')

% Remove uniform noise with Wiener filter
improved_img_uniform_noise = wiener2(img_uniform_noise, [5 5]);
figure, subplot(1,2,1), imshow(img_uniform_noise), title('Noisy image (uniform)')
subplot(1,2,2), imshow(improved_img_uniform_noise), title('Improved image')