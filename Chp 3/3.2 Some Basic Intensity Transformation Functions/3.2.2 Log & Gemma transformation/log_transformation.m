%% Read img
img = imread('intensity transformation.tif');
img = imread('backbone.tif');
img = imread('tifaerial_view.tif');


%% Constants
img_size = size(img);
no_of_shades = 256;
c = 1;


%% Transformations
log_transformed_img = c*log(double(img+1));
transformed_img = range_transformation(log_transformed_img, no_of_shades);


%% Ploting
subplot(1, 2, 1), imshow(img)
subplot(1, 2, 2), imshow(transformed_img)


%% Range transformation
function transformedMat = range_transformation(img, no_of_shades)
    minVal = min(min(img));

    temp = img - minVal;
    maxVal = max(max(temp));

    transformedMat = (no_of_shades-1)*((temp)./maxVal);
    transformedMat = uint8(transformedMat);
end
