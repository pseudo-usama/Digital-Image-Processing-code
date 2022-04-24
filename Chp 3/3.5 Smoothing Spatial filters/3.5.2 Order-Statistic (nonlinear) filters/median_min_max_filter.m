%% Reading img
img = imread('circuit board.tif');


%% Constants
filter_size = [3 3];


%% Defining filters
box_filter = ones(filter_size)/(filter_size(1)*filter_size(2));
min_filter = @(x) min(x(:));
max_filter = @(x) max(x(:));


%% Appling filters to img
avg_img = imfilter(img, box_filter);
midian_filtered_img = medfilt2(img, filter_size);
min_filtered_img = nlfilter(img, filter_size, min_filter);
max_filtered_img = nlfilter(img, filter_size, max_filter);


%% Plotting
subplot(2, 3, 1); imshow(img);                  title('Original Image');
subplot(2, 3, 2); imshow(avg_img);              title('Box filter of size 3x3');
subplot(2, 3, 3); imshow(midian_filtered_img);  title('Median filter of size 3x3');
subplot(2, 3, 4); imshow(min_filtered_img);     title('Min filter of size 3x3');
subplot(2, 3, 5); imshow(max_filtered_img);     title('Max filter of size 3x3');
