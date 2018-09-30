% Testing environment 2

video = VideoReader('videoCompressed.avi');
nFrames = video.NumberOfFrames;
% [warning, Fs] = audioread('somethingwrong.wav');
flag = 1;

for k=200: nFrames-1
    img1 = read(video, k-1);
    img2 = read(video, k);
    diff = abs(rgb2gray(img2) - (rgb2gray(img1)));
%     imshow(rgb2gray(img2), []), title('img2')
%     imshow(rgb2gray(img1), []), title('img1')
%     imshow(diff, []), title('Something')
    
    imshow(diff, []), title('Something')

    if sum(sum(diff)) < 46000
        imshow(img2, [])
        drawnow limitrate
    else
        if flag
%             sound(warning, Fs)
            flag = 0;
        end
%         imshow(img2,[])
        text(100,100,'Intruder!!!','FontSize',24)
        drawnow
    end
end
