%% Reading img
% img = imread('img.tif');
img = imread('tungsten.tif');


%% Some constants
local_histogram_size = [3 3];


%% Doing global & local Histogram Equalizations
local_histogramed_img = nlfilter(img, local_histogram_size, @do_local_histogram_equalization);
global_histogramed_img = do_histogram_equalization(img);



%% Ploting img, 
subplot(1, 3, 1); imshow(img);                      title('Original img');
subplot(1, 3, 2); imshow(global_histogramed_img);   title('Global histogramed img');
subplot(1, 3, 3); imshow(local_histogramed_img);    title('Local histogramed img');



%% Function to perform Local Histogram Equalization
function val = do_local_histogram_equalization(x)
   transformed_img = do_histogram_equalization(x);
   val = transformed_img(2, 2);
end



%% Functions to do Histogram Equalization
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
