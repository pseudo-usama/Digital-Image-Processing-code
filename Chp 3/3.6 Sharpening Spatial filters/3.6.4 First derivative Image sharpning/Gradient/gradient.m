% Example 3.17 in book

img = imread('img.tif');


hor_filter = [
    -1 -2 -1
     0  0  0
     1  2  1
];

ver_filter = [
    -1 0 1
    -2 0 2
    -1 0 1
];


% Appling filters
hor_gradient = imfilter(img, hor_filter);
ver_gradient = imfilter(img, ver_filter);

img_gradient = abs(hor_gradient) + abs(ver_gradient);

imshow(img_gradient);
