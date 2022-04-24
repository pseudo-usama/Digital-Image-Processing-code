%% Figure 6.31 in book
% Intensity transformation

%% Reading img
rgb_img = imread('strawberries.tif');


%% Intensity transformation
k = 0.7;
rgb_transformed = rgb_img * k;

hsv_img = rgb2hsv(rgb_img);
hsv_transformed = cat(3, hsv_img(:,:,1:2), hsv_img(:,:,3)*k);
hsv_transformed = hsv2rgb(hsv_transformed);


%% Plotting
subplot(1, 3, 1); imshow(rgb_img);          title('Original img');
subplot(1, 3, 2); imshow(rgb_transformed);  title('RGB transformed img');
subplot(1, 3, 3); imshow(hsv_transformed);  title('HSV transformed img');
