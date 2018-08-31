temp = imread('images/template.jpg');
ref = imread('images/reference.jpg');
temp = rgb2gray(temp);
ref = rgb2gray(ref);

diff1 = temp - ref;     % obtain the difference between the 2 images
diff2 = ref - temp
diff = diff1 + diff2
figure, imshow(diff, []), title('Difference image')

img = imadjust(diff);   % perform contrast stretching cuz why not
figure, imshow(img, []), title('Contrast Stretching')
