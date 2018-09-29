% Testing environment 2

video = VideoReader('video.avi');
nFrames = video.NumberOfFrames;
[warning, Fs] = audioread('somethingwrong.wav');
flag = 1;

for k =2: nFrames-1
    img1 = read(video,k-1);
    img2 = read(video,k);
    diff = abs(rgb2gray(img2) - (rgb2gray(img1)));
    
    if sum(sum(diff)) < 46000
        imshow(img2, [])
        drawnow
    else
        if flag
            sound(warning, Fs)
            flag = 0;
        end
        imshow(img2,[])
        text(100,100,'Intruder!!!','FontSize',24)
        drawnow
    end
end