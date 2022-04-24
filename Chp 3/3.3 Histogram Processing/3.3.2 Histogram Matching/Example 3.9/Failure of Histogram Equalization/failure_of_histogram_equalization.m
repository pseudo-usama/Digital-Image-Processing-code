%% Reading img
img = imread('phobos.tif');


%% Ploting img, its histogram, equalized img & its histogram
subplot(2, 2, 1); imshow(img);
subplot(2, 2, 2); imhist(img);
subplot(2, 2, 3); imshow(do_histogram_equalization(img));
subplot(2, 2, 4); imhist(do_histogram_equalization(img));




%% Below are the functions to perform Histogram Equalization
function final_img = do_histogram_equalization(img)
    no_of_intensity_levels = 256;

    n_k = calc_n_of_k(img, no_of_intensity_levels);
    img_pdf = calc_pdf(n_k, size(img, 1)*size(img, 2));
    img_cdf = calc_cdf(img_pdf);

    updated_intensities = img_cdf*(no_of_intensity_levels-1);
    final_img = update_intensities_in_img(img, updated_intensities, no_of_intensity_levels);
end

function n_k = calc_n_of_k(img, no_of_intensity_levels)
    n_k = zeros(1, no_of_intensity_levels);

    for i=0:no_of_intensity_levels-1
        n_k(i+1) = sum(img == i, 'all');
    end
end

function img_pdf = calc_pdf(n_k, size_of_img)
    img_pdf = n_k ./ size_of_img;
end

function img_cdf = calc_cdf(img_pdf)
    img_cdf = zeros(size(img_pdf));

    img_cdf(1) = img_pdf(1);
    for i=2:size(img_cdf, 2)
        img_cdf(i) = img_cdf(i-1) + img_pdf(i);
    end
end

function final_img = update_intensities_in_img(img, updated_intensities, no_of_intensity_levels)
    updated_img = img;

    for i=0:no_of_intensity_levels-1
        updated_img(img == i) = updated_intensities(i+1);
    end
    
    final_img = uint8(updated_img);
end
