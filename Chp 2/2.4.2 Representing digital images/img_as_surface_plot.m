img = imread('t.tif');

img_size = size(img);
% img = rgb2gray(img);

[x, y] = meshgrid(1:img_size(2), 1:img_size(1));

subplot(2, 2, 1), imshow(img)
subplot(2, 2, 4), h = surf(x, y, img);
set(h, 'edgecolor', 'none')
