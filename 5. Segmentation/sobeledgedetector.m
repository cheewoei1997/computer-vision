img = imread('president_square.jpg');
img = rgb2gray(img);

% Detect vertical edges
[img_v, t] = edge(img, 'sobel', 'vertical');
figure, subplot(2, 2, 1)
imshow(img_v), title('Vertical')

% Detect horizontal edges
[img_h, t] = edge(img, 'sobel', 'horizontal');
subplot(2, 2, 2)
imshow(img_h), title('Horizontal')

% Detect 45 degree edges
w45 = [-2 -1 0, -1 0 1, 0 1 2];
img_45 = imfilter(double(img), w45, 'replicate');
t = 0.3 * max(abs(img_45(:)));
img_45 = img_45 >= t;
subplot(2, 2, 3)
imshow(img_45, []), title('+45 degree')

% Detect -45 degree edges
wm45 = [0 1 2, 1 0 -1, -2 -1 0];
img_m45 = imfilter(double(img), wm45, 'replicate');
t = 0.3 * max(abs(img_m45(:)));
img_m45 = img_m45 >= t;
subplot(2, 2, 4)
imshow(img_m45, []), title('-45 degree')
