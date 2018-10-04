% Images in Matlab
avengers = imread('avengers.jpg');
thanos = imread('thanos.jpg');
size(avengers)                      % [i, j, k] i shows width, j shows
                                    % height, k shows number of colours

figure;                             
subplot(1,2,1); imshow(avengers);   % Display images
subplot(1,2,2); imshow(thanos);     % Same window, multiple images

thanos_gray = rgb2gray(thanos);     % Convert to grayscale
figure; imshow(thanos_gray);        % You should know what this is

thanos_large = imresize(thanos,1.5);    % Resizing an image
figure; imshow(thanos_large);

imwrite(thanos_gray,' thanos_gray.png');    % Saving the image