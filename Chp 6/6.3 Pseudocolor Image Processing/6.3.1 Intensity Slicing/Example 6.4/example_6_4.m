% Example 6.3 in book (Picker thyroid phantom)

%% Reading img
img = imread('rainfall_map.tif');


%% False coloring
hsv_img = zeros(size(img, 1), size(img, 2), 3);
hsv_img(:, :, 1) = ((1 - img ./ max(img(:))) * 197);
hsv_img(:, :, 2) = 75;
hsv_img(:, :, 3) = 100;


colored_img = uint8(hsv2rgb(hsv_img));


%% Plotting
subplot(2, 1, 1); imshow(img); title('Original img');
subplot(2, 1, 2); imshow(colored_img); title('Colored img');
