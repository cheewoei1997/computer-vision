img = imread('poem.jpg');
img = rgb2gray(img);
img = im2double(img);
figure, imshow(img, []), title('Original image')

[m, n] = size(img);
thresh_img = zeros(m, n);
for i=1:15:m-14
    for j=1:15:n-14
        block = img(i:i+14, j:j+14);
        T = graythresh(block)
        BW = im2bw(block, T)
        thresh_img(i:i+14, j:j+14) = BW;
    end
end
figure, imshow(thresh_img, []), title('Adaptive thresholding')

ws = 15;
fun = @(block_struct)im2bw(block_struct.data, graythresh(block_struct.data));
BW_adapt = blockproc(img, [ws ws], fun);
figure, imshow(BW_adapt), title('Adaptive thresholding with blockproc')

C = 0.0003;
fun = @(block_struct)im2bw(block_struct.data, graythresh(block_struct.data)-C);
BW_adapt = blockproc(img, [ws ws], fun);
figure, imshow(BW_adapt), title('T - C')
