img = imread('president_square.jpg');
img = rgb2gray(img);
figure, imshow(img)

img_sobel = edge(img, 'sobel');
figure, subplot(2, 2, 1)
imshow(img_sobel), title('Sobel')

img_prewitt = edge(img, 'prewitt');
subplot(2, 2, 2)
imshow(img_prewitt), title('Prewitt')

img_roberts = edge(img, 'roberts');
subplot(2, 2, 3)
imshow(img_roberts), title('Roberts')

img_canny = edge(img, 'canny');
subplot(2, 2, 4)
imshow(img_canny), title('Canny')
