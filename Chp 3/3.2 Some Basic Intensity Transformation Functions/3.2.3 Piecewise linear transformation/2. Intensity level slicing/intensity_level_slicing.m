% Example 3.3 in book

%% Reading img
img = imread('kidney.tif');


%% Constants
[a, b] = deal(150, 255);
final_value_for_specified_range = 250;


%% Applying Intensity level slicing

% Highlighting certain range of intensities img
% Applying Graph 3.11(a)
final_img1 = img;
check = (a < img & img < b);
final_img1(check == 1) = final_value_for_specified_range;
final_img1(check == 0) = 0;

% Highlighting certain range of intensities while preserving others
% Applying Graph 3.11(b)
final_img2 = img;
final_img2((a < img & img < b) == 1) = final_value_for_specified_range;


%% Plotting
subplot(1, 3, 1); imshow(img);
subplot(1, 3, 2); imshow(final_img1);
subplot(1, 3, 3); imshow(final_img2);
