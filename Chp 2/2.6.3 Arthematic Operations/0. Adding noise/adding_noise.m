img = imread('img.tif');

noise_constant = 300;


subplot(1, 2, 1); imshow(img)
subplot(1, 2, 2); imshow(add_noise(img, noise_constant))



function transformed_img = add_noise(img, c)
    noise = rand(size(img));

    noisy_img = int64(img) + int64(c*noise);
    transformed_img = rescaling(noisy_img);
end

function rescaled = rescaling(img)
    no_of_intensity_levels = 256;

    temp = img - min(min(img));
    rescaled = (no_of_intensity_levels-1) * temp / max(max(temp));

    rescaled = uint8(rescaled);
end
