%% Example 6.6 in book


%% Reading image
img_red = imread('WashingtonDC_red.tif');
img_green = imread('WashingtonDC_green.tif');
img_blue = imread('WashingtonDC_blue.tif');
img_infrared = imread('WashingtonDC_infrared.tif');


%%
img_RGB = cat(3, img_red, img_green, img_blue);
img_IGB = cat(3, img_infrared, img_green, img_blue);

%% Ploting
subplot(2, 3, 1); imshow(img_red);      title('Red channel');
subplot(2, 3, 2); imshow(img_green);    title('Green channel');
subplot(2, 3, 3); imshow(img_blue);     title('Blue channel');
subplot(2, 3, 4); imshow(img_infrared); title('Infrared');
subplot(2, 3, 5); imshow(img_RGB);      title('RGB');
subplot(2, 3, 6); imshow(img_IGB);      title('Infrared green blue');
