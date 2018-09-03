img = imread('images/plantation.jpg');
cform = makecform('srgb2lab');
J = applycform(img,cform);
figure;imshow(J),title('Convert to LAB color space');

% Equalise brightness to get skin area
K = J(:,:,2);     % 2nd page of 3-d vector j
figure;imshow(K),title('2nd axis of 3D vector');

L=graythresh(J(:,:,2));     % find appropriate gray thresh value
BW1=im2bw(J(:,:,2),L);      % convert to binary image based on threshold
figure;imshow(BW1),title('Binary Image');

% Test 2 (better)
se = strel('sphere',3);
BW1 = imerode(BW1,se);
figure;imshow(BW1),title('Image: Erosion 1');

se3 = strel('sphere',13);
BW1 = imdilate(BW1,se3);
figure;imshow(BW1),title('Image: Dilate');

se = strel('sphere',5)
BW1 = imerode(BW1,se);
figure;imshow(BW1),title('Image: Erosion 2');
% End test

bw3 = bwareaopen(BW1,1890);     % opens area greater than 1890
cc=bwconncomp(bw3)              % connected comp for finding the density 
                                % of trees in image
density=cc.NumObjects / (size(bw3,1) * size(bw3,2))
figure;imshow(bw3),title('Removes all connected components')
bw3 = imcomplement(bw3);
figure;imshow(bw3),title('Complement')
bw4=imfill(bw3,'holes');        % fill patches with holes

labeledImage = bwlabel(bw4, 8);     % same as connected components
blobMeasurements = regionprops(labeledImage,'all'); % measure all properties of
                                                    % the image
numberOfTree = size(blobMeasurements, 1)    % count the number of trees

imagesc(img),title('Image with scaled colors');
hold on;

% draw bounding circles
XY = [blobMeasurements.Centroid];

%Find out the coordinates of labeled objects
coordinate(:,1) = XY(1:2:end);
coordinate(:,2) = XY(2:2:end);

%Find out the radius of labeled objects
radius(1:length(coordinate),:) = 15;

%Create the circle
figure, imshow(img), title('Final Result');
h = viscircles(coordinate,radius);

