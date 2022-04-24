%% Reading imgs
img1 = imread('1.tif');
img2 = imread('2.tif');
img3 = imread('3.tif');
img4 = imread('4.tif');


%% Ploting imgs & their histograms
subplot(4, 2, 1); imshow(img1);
subplot(4, 2, 2); imhist(img1);

subplot(4, 2, 3); imshow(img2);
subplot(4, 2, 4); imhist(img2);

subplot(4, 2, 5); imshow(img3);
subplot(4, 2, 6); imhist(img3);

subplot(4, 2, 7); imshow(img4);
subplot(4, 2, 8); imhist(img4);
