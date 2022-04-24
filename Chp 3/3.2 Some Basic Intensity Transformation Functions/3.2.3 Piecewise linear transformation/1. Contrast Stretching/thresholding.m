% As explained in Figure 2.10(d) of book

%% Read img
img = imread('pollens.tif');


%% Constants
no_of_intensity_levels = 256;
img_size = size(img);
img_m_n = img_size(1) * img_size(2);


%% Calculating mean intensity level of img
mean_intensity_level = uint8(sum(img(:)) / img_m_n);


%% Applying thresholding
binary_img = img >= mean_intensity_level;


%% Ploting
subplot(1, 2, 1); imshow(img);
subplot(1, 2, 2); imshow(binary_img);
