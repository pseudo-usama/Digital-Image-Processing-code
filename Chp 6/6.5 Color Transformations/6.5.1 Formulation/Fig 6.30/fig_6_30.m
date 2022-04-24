%% Figure 6.30 in book


%% Reading img
rgb_img = imread('strawberries_coffee.tif');


%% Conversion
hsv_img = rgb2hsv(rgb_img);
%


%% Plotting 
subplot(4, 4, 1); imshow(rgb_img); title('Original img');

% subplot(4, 4, 5); imshow(rgb_img); title('Original img');
% subplot(4, 4, 6); imshow(rgb_img); title('Original img');
% subplot(4, 4, 7); imshow(rgb_img); title('Original img');
% subplot(4, 4, 8); imshow(rgb_img); title('Original img');

subplot(4, 4, 9); imshow(rgb_img(:,:,1)); title('R channel');
subplot(4, 4, 10); imshow(rgb_img(:,:,2)); title('G channel');
subplot(4, 4, 11); imshow(rgb_img(:,:,3)); title('B channel');

subplot(4, 4, 13); imshow(hsv_img(:,:,1)); title('H channel');
subplot(4, 4, 14); imshow(hsv_img(:,:,2)); title('S channel');
subplot(4, 4, 15); imshow(hsv_img(:,:,3)); title('I channel');
