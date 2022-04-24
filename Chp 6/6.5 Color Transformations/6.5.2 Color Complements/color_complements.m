%% Figure 6.31 in book
% Intensity transformation
% HSV complement result is not correct

%% Reading img
rgb_img = imread('strawberries_coffee.tif');
hsv_img = rgb2hsv(rgb_img);


%% Calculating Color complement
no_of_intensity_levels = 256;

% Conversion in RGB
complement_in_rgb = (no_of_intensity_levels-1) - rgb_img;

% Conversion in HSV
complement_in_hsv = cat( ...
    3, ...
    rem(hsv_img(:,:,1)+0.5, 1), ...
    hsv_img(:,:,2), ...
    1 - hsv_img(:,:,3) ...
);
complement_in_hsv = hsv2rgb(complement_in_hsv);



%% Plotting
subplot(1, 3, 1); imshow(rgb_img);              title('Original img');
subplot(1, 3, 2); imshow(complement_in_rgb);    title('Complement in RGB');
subplot(1, 3, 3); imshow(complement_in_hsv);    title('Complement in HSV');
