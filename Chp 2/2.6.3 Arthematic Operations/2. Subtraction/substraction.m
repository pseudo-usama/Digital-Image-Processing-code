img = imread('img.tif');
mask = imread('mask.tif');


subplot(1, 3, 1); imshow(img);                      title('Original img')
subplot(1, 3, 2); imshow(mask);                     title('Mask')
subplot(1, 3, 3); imshow(enhance_img(img, mask));	title('Diffrance of Original img & Mask')


function final_img = enhance_img(img, mask)
    enhanced = double(img) - double(mask);
    final_img = rescale(enhanced);
end


% Rescaling
function final_img = rescale(img)
    no_of_intensity_levels = 256;
    
    img = double(img);

    % Scaling
    temp = img - min(min(img));
    transformed_img = (no_of_intensity_levels - 1) * (temp/max(max(temp)));

    final_img = uint8(transformed_img);
end

