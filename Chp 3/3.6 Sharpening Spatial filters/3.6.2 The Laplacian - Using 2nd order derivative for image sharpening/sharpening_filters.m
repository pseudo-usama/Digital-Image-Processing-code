% Example: 3.15 in book

img = im2double(imread('blurry_moon.tif'));


c = -1;
laplacian_filter = -c*[
    0  1  0
    1 -4  1
    0  1  0
];
% laplacian_filter = -c*[
%     1  1  1
%     1 -8  1
%     1  1  1
% ];


laplacian = imfilter(img, laplacian_filter, 'replicate');
sharpened_img = img + c*laplacian;


subplot(2, 2, 1); imshow(img, []);              title('Original img');
subplot(2, 2, 2); imshow(laplacian);            title('Laplacian (without rescaling)');
subplot(2, 2, 3); imshow(laplacian, []);        title('Laplacian (with rescaling)');
subplot(2, 2, 4); imshow(sharpened_img, []);    title('Adding laplacian to original img');
