% Testing environment 2

clear;
close all;

video = VideoReader('videoCompressed.avi');
nFrames = video.NumberOfFrames;
% [warning, Fs] = audioread('somethingwrong.wav');
flag = 1;

% k = 300;
for k=400: nFrames-1
    img1 = read(video, k-1);
    img2 = read(video, k);
    diff = abs(rgb2gray(img2) - (rgb2gray(img1)));
%     figure, imshow(diff,[]), title('first pic')
%     diff = graythresh(diff)
%     diff = im2bw(diff)
%     diff = imopen(diff,strel('line',15,90));
%     
%     figure, imshow(diff, []), title('Diff')
%     
    mask = fspecial('average', 5);
    removenoise = filter2(mask, diff)/255;
%     figure, imshow(removenoise, []), title('gaussian noise')
    
    % Remove salt & pepper noise with average filter
    diff = medfilt2(removenoise, [3 3]);
%     figure, imshow(diff, []), title(' aaveragenoise')

    
%     diff = imbinarize(diff)
%     figure, imshow(diff, []), title('thresh')

%     thresh = diff > 1;
%     figure, imshow(thresh,[]), title('thresh')
    
%     diff = imopen(diff,strel('line',5,90));
%     figure, imshow(diff,[]),title('open')
    
%     diff = imclose(diff,strel('disk',20));
%     figure, imshow(diff,[]),title('close')
    
% %     diff = bwareaopen(diff,2000)
% %     figure, imshow(diff), title('bwareaopen')
%     
% %     diff = imfill(diff, 'holes');
% %     figure, imshow(diff,[]),title('fill')
    
%     diff = imclose(diff,strel('sphere',3));
%     figure, imshow(diff,[]),title('sphere')

    binary = diff > 1/18;
%     figure, imshow(binary,[]), title('binarize')
    
    diff = bwareaopen(binary, 35);
%     figure, imshow(diff, []),title('bwareaopen')
    
    se = strel('disk',3); 
    diff = imerode(diff, se);    % Destroy the image to remove unncessary connections.
%     figure, imshow(diff,[]),title('erode')
    
    
    
    se1 = strel('disk',20);
    diff = imdilate(diff, se1); % Recontruct the image to fix it.
    
    diff = bwareaopen(diff, 5000);
%     imshow(diff, []),title('bwareaopen')
    
%     figure, imshow(diff,[]),title('dilate')
    
%     diff = bwareaopen(diff, 40)
%     figure, imshow(diff, []), title('bwareaopen')
%     
%     binary = diff > 10;
%     figure, imshow(binary,[]), title('binarize')

%%%%%%%%%%%% Labeling objects in image %%%%%%%%%%%%%%%%
[L, NUM] = bwlabel(diff, 8);
number_tree = NUM;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Draw bounding box around the labels %%%%%%%%%%
boxx = regionprops(diff, 'BoundingBox');

imshow(img2), title('Image with bounding box')
text(200, 325, sprintf('Number of trees: %f', number_tree), ...
  'VerticalAlignment', 'bottom', ...
  'HorizontalAlignment', 'center');

hold on
for k = 1: length(boxx)
    CurrBB = boxx(k).BoundingBox;
    if CurrBB(3) < CurrBB(4) 
        rectangle('Position', [CurrBB(1), CurrBB(2), CurrBB(3), CurrBB(4)],'EdgeColor', 'r', 'LineWidth', 2)
    end
end
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% % %     labeledImage = bwlabel(binary, 8);     % same as connected components
% % %     blobMeasurements = regionprops(labeledImage,'all'); % measure all properties of
% % %                                                     % the image
% % %     pepe = size(blobMeasurements, 10)    % count the number of trees
% % %     pepe
% % %     
% % %     % draw bounding circles
% % %     XY = [blobMeasurements.Centroid];
% % %     XY

%     %Find out the coordinates of labeled objects
%     coordinate(:, 1) = XY(1:2:end);
%     coordinate(:, 2) = XY(2:2:end);
% 
%     %Find out the radius of labeled objects
%     radius(1:length(coordinate), :) = 15;
% 
%     %Create the circle
%     imshow(img2), title('Final Result');
%     h = viscircles(coordinate, radius);


    
%     se = strel('sphere',3);
%     BW1 = imerode(diff2,se);
%     
%     figure, imshow(BW1, []), title('erode')
% 
%     se3 = strel('sphere', 5);
%     BW1 = imdilate(BW1, se3);
%     
%     figure, imshow(diff, []), title('dilate')
%     
%     se = strel('sphere',5)
%     BW1 = imerode(BW1,se);
% %     imshow(rgb2gray(img2), []), title('img2')
% %     imshow(rgb2gray(img1), []), title('img1')
% %     imshow(diff, []), title('Something')
%     
%     figure, imshow(BW1, []), title('erode 2')

%     if sum(sum(diff)) < 46000
%         imshow(img2, [], 'img2 after thresh')
%         drawnow
%     else
%         if flag
% %             sound(warning, Fs)
%             flag = 0;
%         end
%         imshow(img2,[]),title('Image after flag')
%         text(100,100,'Intruder!!!','FontSize',24)
%         drawnow
%     end
end
