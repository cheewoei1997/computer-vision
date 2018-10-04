I = imread('tanker.jpg');
I = rgb2gray(I);

filter = ones(2, 2);                        % Create an array of ones.
I1 = filter2(filter, I);                    % The bigger the size of the
subplot(2, 2, 1)                            % filter, the more the image
imshow(I1, []), title('2 by 2 filter')      % image is blurred.

filter = ones(4, 4);
I2 = filter2(filter, I);
subplot(2, 2, 2)
imshow(I2, []), title('4 by 4 filter')

filter = ones(8, 8);
I3 = filter2(filter, I);
subplot(2, 2, 3)
imshow(I3, []), title('8 by 8 filter')

filter = ones(16, 16);
I4 = filter2(filter, I);
subplot(2, 2, 4)
imshow(I4, []), title('16 by 16 filter')
