I = imread('tanker.jpg');       % reads the image tanker.jpg
I = rgb2gray(I);                % convert read image to grayscale
figure, imshow(I, []);
[m, n] = size(I);               % set m to width and n to height

I2 = zeros(floor(m/2), floor(m/2));         % Create array of all zeros
for row = 1 : floor(m/2)                    % Resize the image to half
    for col = 1 : floor(n/2)                % of its original size
        I2(row, col) = I(row*2, col*2);
    end
end

figure, imshow(I2, [])
