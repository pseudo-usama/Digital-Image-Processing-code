%% Figure 3.39 in book


%% Reading img
rgb_img = imread('lenna_RGB.tif');

hsv_img = rgb2hsv(rgb_img);


%% Plotting
subplot(2,2,1); imshow(rgb_img);        title('Original img');
subplot(2,2,2); imshow(hsv_img(:,:,1)); title('Hue channel');
subplot(2,2,3); imshow(hsv_img(:,:,2)); title('Saturation channel');
subplot(2,2,4); imshow(hsv_img(:,:,3)); title('Intensity channel');
