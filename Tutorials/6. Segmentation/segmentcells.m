I = imread('cell.jpg');
I = rgb2gray(I);
figure, imshow(I), title('Original image')

% Detect Entire Cell
[~, threshold] = edge(I, 'sobel');
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('Binary gradient mask')

% Dilate the image
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);
figure, imshow(BWsdil), title('Dilated gradient mask')

% Fill Interior Gaps
BWdfill = imfill(BWsdil, 'holes');
figure, imshow(BWdfill);
title('Binary image with filled holes')

% Remove Connected Objects on Border
BWnobord = imclearborder(BWdfill, 4);
figure, imshow(BWnobord), title('Cleared border image')

% Smoothen the Object
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
figure, imshow(BWfinal), title('Segmented image')

% Outline the image
BWoutline = bwperim(BWfinal);
Segout = I; 
Segout(BWoutline) = 255; 
figure, imshow(Segout), title('Outlined original image')