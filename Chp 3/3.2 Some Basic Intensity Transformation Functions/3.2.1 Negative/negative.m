%% Read img
img = imread('mammogram.tif');


%% Constants
img_size = size(img);
no_of_shades = 256;



%% Transformations

% for i=1:img_size(1)
%     for j=1:img_size(2)
%         negative_img(i, j) = no_of_shades - 1 - gray_img(i, j);
%     end
% end
negative_img = no_of_shades - 1 - img;


%% Ploting
subplot(1, 2, 1), imshow(img)
subplot(1, 2, 2), imshow(negative_img)
