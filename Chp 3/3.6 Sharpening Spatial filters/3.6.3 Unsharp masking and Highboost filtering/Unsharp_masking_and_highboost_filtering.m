% Example 3.16 in book

img = imread('img.tif');


k = 4.5;


gaussian_filter = fspecial('gaussian', [5 5], 3);
blurred_img = imfilter(img, gaussian_filter);


unsharp_mask = img - blurred_img;

unsharped_masked_img = img + unsharp_mask;
highboost_filtered_img = img + k*unsharp_mask;


subplot(2, 3, 1); imshow(img);                      title('Original img');
subplot(2, 3, 2); imshow(blurred_img);              title('Blurred img');
subplot(2, 3, 4); imshow(unsharp_mask);             title('Unsharp mask');
subplot(2, 3, 5); imshow(unsharped_masked_img);     title('Unsharped filtered img');
subplot(2, 3, 6); imshow(highboost_filtered_img);   title('Highboost filtered img');
