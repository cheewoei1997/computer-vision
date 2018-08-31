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

wnr = deconvwnr(img, motion_noise, 0.01);   % deblur using wiener filter
luri = deconvlucy(img, motion_noise);       % deblur using lucy-richardson
subplot(2, 2, 3), imshow(wnr), title('Deblur using Wiener');
subplot(2, 2, 4), imshow(luri), title('Deblur using Lucy-Richardson');

