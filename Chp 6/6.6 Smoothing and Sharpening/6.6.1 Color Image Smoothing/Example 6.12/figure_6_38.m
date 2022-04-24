%% Figure 3.38 in book


%% Reading img
img = imread('lenna_RGB.tif');


%% Plotting
subplot(2,2,1); imshow(img);        title('Original img');
subplot(2,2,2); imshow(img(:,:,1)); title('Red channel');
subplot(2,2,3); imshow(img(:,:,2)); title('Green channel');
subplot(2,2,4); imshow(img(:,:,3)); title('Blue channel');
