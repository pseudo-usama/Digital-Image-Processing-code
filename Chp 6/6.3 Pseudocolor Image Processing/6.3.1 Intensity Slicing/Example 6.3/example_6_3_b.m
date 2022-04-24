% Example 6.3 in book (Weld Cracks)

%% Reading img
img = imread('weld cracks.tif');

r = uint8(zeros(size(img)));
g = uint8(zeros(size(img)));
b = uint8(zeros(size(img)));


%% False coloring
threshold = 250;

r(img <= threshold) = 45;
g(img <= threshold) = 51;
b(img <= threshold) = 147;

r(img > threshold) = 255;
g(img > threshold) = 223;
b(img > threshold) = 27;


colored_img = r;
colored_img(:, :, 2) = g;
colored_img(:, :, 3) = b;


%% Plotting
subplot(1, 2, 1); imshow(img);          title('Original img');
subplot(1, 2, 2); imshow(colored_img);  title('Colored img');
