% Testing environment 2

clear;
close all;

video = VideoReader('videoCompressed.avi');
nFrames = video.NumberOfFrames;
% [warning, Fs] = audioread('somethingwrong.wav');
flag = 1;

k=300
% for k=100: nFrames-1
    img1 = read(video, k-1);
    img2 = read(video, k);
    diff = abs(rgb2gray(img2) - (rgb2gray(img1)));
%     diff = graythresh(diff)
%     diff = im2bw(diff)
%     diff = imopen(diff,strel('line',15,90));
%     
%     figure, imshow(diff, []), title('Diff')
%     
%     mask = fspecial('average', 5);
%     removenoise = filter2(mask, diff)/255;
%     figure, imshow(removenoise, []), title('noise')
%     
%     thresh = imbinarize(removenoise)
%     figure, imshow(thresh, []), title('thresh')

    J1 = diff > 15;
    figure, imshow(J1,[]), title('thresh')
    
    diff = imopen(J1,strel('line',5,90));
    figure, imshow(diff,[]),title('open')
    
    diff = imclose(diff,strel('disk',20));
    figure, imshow(diff,[]),title('close')
    
%     diff = imopen(J1,strel('sphere',3));
%     figure, imshow(diff,[]),title('sphere')

    
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
% end
