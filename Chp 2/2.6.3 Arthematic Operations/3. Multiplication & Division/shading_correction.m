img = imread('tungsten_filament.tif');
shading = imread('tungsten_sensor_shading.tif');


subplot(1, 2, 1); imshow(img)
subplot(1, 2, 2); imshow(enhance_img(img, shading))


function final_img = enhance_img(img, shading)
    enhanced = double(img) ./ double(shading);
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
