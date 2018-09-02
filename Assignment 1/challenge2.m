temp = imread('images/template.jpg');
ref = imread('images/reference.jpg');
temp = rgb2gray(temp);
ref = rgb2gray(ref);


diff1 = temp - ref;     % obtain the difference between the 2 images
diff2 = ref - temp;
diff = diff1 + diff2;

img_complement = imcomplement(diff);
figure, imshow(diff1, []), title('Difference: Template - Reference')
figure, imshow(diff2, []), title('Difference: Reference - Template')
figure, imshow(diff, []), title('Combination')
figure, imshow(img_complement, []), title('Complement')

img_stretch = imadjust(img_complement);   % perform contrast stretching cuz why not
figure, imshow(img_stretch, []), title('Contrast Stretching')

img_snp = medfilt2(img_stretch, [3 3]);
figure, imshow(img_snp), title('Improved image')
