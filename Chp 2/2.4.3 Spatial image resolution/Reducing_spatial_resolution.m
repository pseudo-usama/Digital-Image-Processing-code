%% Reading img
img = imread('Clock.tif');


%% Reducing resolution
reduced_resolution_img = imresize(img, [213 162]);


%% Plotting
subplot(1, 2, 1); imshow(img)
subplot(1, 2, 2); imshow(reduced_resolution_img)
