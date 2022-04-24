%% Reading img
rgb_img = im2double(imread('jupiter_moon.tif'));
hsv_img = rgb2hsv(rgb_img);


%% Segmentation
hue_mask_threshold = max(max(hsv_img(:,:,2))) * 0.35;
mask = zeros(size(hsv_img(:,:,1)));
mask(hsv_img(:,:,2) > hue_mask_threshold) = 1;

hue_mask_product = hsv_img(:,:,1) .* mask;

final_threshold = 0.9;
final_threshold_img = zeros(size(hsv_img(:,:,1)));
final_threshold_img(hue_mask_product > final_threshold) = 1;


%% Plotting
subplot(2, 4, 1); imshow(rgb_img);                  title('Original img');
subplot(2, 4, 2); imshow(hsv_img(:,:,1));           title('Hue');
subplot(2, 4, 3); imshow(hsv_img(:,:,2));           title('Saturation');
subplot(2, 4, 4); imshow(hsv_img(:,:,3));           title('Intensity');
subplot(2, 4, 5); imshow(mask,[]);                  title('Mask by threshold Hue');
subplot(2, 4, 6); imshow(hue_mask_product,[]);      title('Hue & mask product');
subplot(2, 4, 7); imhist(hue_mask_product);         title('Histogram of Hue, mask product');
subplot(2, 4, 8); imshow(final_threshold_img, []);  title('Threshold Product of Hue, mask product');
