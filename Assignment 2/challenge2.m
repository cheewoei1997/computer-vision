video = VideoReader('videoCompressed.avi');
nFrames = video.NumberOfFrames;     % Acquire the number of frames

for k=200: nFrames-1
    img1 = read(video, k-1);        % Read inital image
    img2 = read(video, k);          % Read current image
    
    % Acquire the difference between to said images
    diff = abs(rgb2gray(img2) - (rgb2gray(img1)));

    % Apply average filter to remove noise
    mask = fspecial('average', 5);
    removenoise = filter2(mask, diff)/255;

    % Apply median filter to blur the image
    diff = medfilt2(removenoise, [3 3]);

    % Apply simple thresholding of value 1/18
    binary = diff > 1/18;
    
    % Remove shapes smaller than size 35
    diff = bwareaopen(binary, 35);
    
    % Erode the image with disk of size 3
    se = strel('disk',3); 
    diff = imerode(diff, se);       % Remove unncessary connections.

    % Dilate the image with disk of size 20
    se1 = strel('disk', 20);
    diff = imdilate(diff, se1);     % Reconstruct the image to fix it.
    
    % Remove shapes that don't stack
    diff = bwareaopen(diff, 5000);

    %% Labeling objects in image
    [L, NUM] = bwlabel(diff, 8);
    number_tree = NUM;

    % Draw bounding box around the labels
    boxx = regionprops(diff, 'BoundingBox');

    imshow(img2), title('Image with bounding box')
    text(0, 0, sprintf('Human: %f', number_tree), ...
      'VerticalAlignment', 'bottom', ...
      'HorizontalAlignment', 'center');

    hold on
    for k = 1: length(boxx)
        CurrBB = boxx(k).BoundingBox;
        if CurrBB(3) < CurrBB(4) 
            rectangle('Position', [CurrBB(1), CurrBB(2), CurrBB(3),  ...
                CurrBB(4)],'EdgeColor', 'r', 'LineWidth', 2)
        end
    end
    hold off
end
