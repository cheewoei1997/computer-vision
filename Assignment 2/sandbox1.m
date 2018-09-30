% Testing environment 1

clear;
close all;

run('vlfeat-0.9.20\toolbox\vl_setup')


%% Read Image and split the digit
Inputimage=imread('equation/equation_4.jpg');
Inputimage = imcomplement(Inputimage)

bw = im2bw(Inputimage);

buffersize = 100
se = strel('line',buffersize,90);
bwopen = imopen(bw,se); %add a small vertical buffer.

D = watershed(bwopen); %segmentation of your image

for i = 1:max(unique(D));
    letter = uint8(bw);
    letter(D~=i)=2;
    boundcol = find(max(letter==0,[],1));
    boundrow = find(max(letter==0,[],2));
    isol{i} = bw(boundrow(1):boundrow(end),boundcol(1):boundcol(end));
    figure,imshow(isol{i});
end


%% Compare the database digit

peakThresh = 5; edgeThresh=2;

imgGray2 = 255 * uint8(isol{2});
[height2, width2, channels2] = size(imgGray2);
addHeight2 = round(((100-height2)/2),0);
addWidth2 = round(((100-width2)/2),0);
imgGray2 = padarray(imgGray2, [addHeight2 addWidth2], 255, 'both');
imgGray2 = imresize(imgGray2,[100 100]);
[f2, d2] = vl_sift(single(imgGray2), 'PeakThresh', peakThresh, 'EdgeThresh', edgeThresh);

img1 = imread('database/multiply.jpg'); % Load and resize image
img1 = imcomplement(img1);
imgGray1 = rgb2gray(img1); %Extrast SIFT features
[height1, width1, channels1] = size(imgGray1);
[f1, d1] = vl_sift(single(imgGray1), 'PeakThresh', peakThresh, 'EdgeThresh', edgeThresh);

figure,imshow(imgGray1);
figure,imshow(imgGray2);
%resultm = sift_match(imgGray1, imgGray2, Features1, Features2);
%[MATCHES,SCORES] = vl_ubcmatch(Features1, Features2);
[matches, scores] = vl_ubcmatch(d1,d2);
ratiotest = size(matches,2)