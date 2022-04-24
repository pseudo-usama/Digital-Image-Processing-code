%% Reading imgs
img1 = imread('1.tif');
img2 = imread('2.tif');
img3 = imread('3.tif');
img4 = imread('4.tif');


%% Plotting imgs, their histograms, equalized imgs & their histograms
subplot(4, 4, 1); imshow(img1);
subplot(4, 4, 2); imhist(img1);
subplot(4, 4, 3); imshow(do_histogram_equalization(img1));
subplot(4, 4, 4); imhist(do_histogram_equalization(img1));

subplot(4, 4, 5); imshow(img2);
subplot(4, 4, 6); imhist(img2);
subplot(4, 4, 7); imshow(do_histogram_equalization(img2));
subplot(4, 4, 8); imhist(do_histogram_equalization(img2));

subplot(4, 4, 9);  imshow(img3);
subplot(4, 4, 10); imhist(img3);
subplot(4, 4, 11); imshow(do_histogram_equalization(img3));
subplot(4, 4, 12); imhist(do_histogram_equalization(img3));

subplot(4, 4, 13); imshow(img4);
subplot(4, 4, 14); imhist(img4);
subplot(4, 4, 15); imshow(do_histogram_equalization(img4));
subplot(4, 4, 16); imhist(do_histogram_equalization(img4));



%% Below are the function to perform Histogram Equalization
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
