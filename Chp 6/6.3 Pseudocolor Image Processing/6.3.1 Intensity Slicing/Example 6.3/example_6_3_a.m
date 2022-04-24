% Example 6.3 in book (Picker thyroid phantom)

%% Reading img
img = imread('picker thyroid phantom.tif');

r = uint8(zeros(size(img)));
g = uint8(zeros(size(img)));
b = uint8(zeros(size(img)));


%% False coloring
r(img > 51) = 29;
g(img > 51) = 107;
b(img > 51) = 125;

r(img > 102) = 110;
g(img > 102) = 153;
b(img > 102) = 125;

r(img > 153) = 177;
g(img > 153) = 55;
b(img > 153) = 40;

r(img > 204) = 177;
g(img > 204) = 55;
b(img > 204) = 40;


colored_img = r;
colored_img(:, :, 2) = g;
colored_img(:, :, 3) = b;


%% Plotting
subplot(1, 2, 1); imshow(img);          title('Original img');
subplot(1, 2, 2); imshow(colored_img);  title('Colored img');