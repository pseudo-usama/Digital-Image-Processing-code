% As explained in Figure 2.10(c) of book

%% Read img
img = imread('pollens.tif');


%% Constants
no_of_intensity_levels = 256;
img_size = size(img);
img_m_n = img_size(1) * img_size(2);


%% Calculating min, max intensity levels of img
min_intensity = min(img(:));
max_intensity = max(img(:));


%% r1, s1 & r2, s2
r1 = min_intensity;
s1 = 0;
r2 = max_intensity;
s2 = no_of_intensity_levels - 1;


%% Applying contrast stretching
slope = double(s2 - s1) / double(r2 - r1);
x_intercept = min_intensity;

stretched_img = slope * double(img-x_intercept);
stretched_img = uint8(stretched_img);


%% Ploting
subplot(1, 2, 1); imshow(img);
subplot(1, 2, 2); imshow(stretched_img);
