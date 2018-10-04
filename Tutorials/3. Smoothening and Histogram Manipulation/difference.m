mask = imread('mask.jpg')
live = imread('live.jpg')

diff = mask - live;     % obtain the difference between the 2 images
figure, imshow(diff, []), title('Difference image')

img = imadjust(diff);   % perform contrast stretching cuz why not
figure, imshow(img, []), title('Contrast Stretching')

img2 = medfilt2(img);   % perform median filter to clear noise
figure, imshow(img2, []), title('Median filter')

% Subtracting the background the obtain only the interested area.