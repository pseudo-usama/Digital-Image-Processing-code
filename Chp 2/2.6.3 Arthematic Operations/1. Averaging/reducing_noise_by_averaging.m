img = imread('galaxy.tif');


subplot(2, 3, 1); imshow(img);                                              title('Original');
subplot(2, 3, 2); imshow(calc_average_of_imgs(get_noisy_imgs(img, 5)));     title('Avg of 5');
subplot(2, 3, 3); imshow(calc_average_of_imgs(get_noisy_imgs(img, 10)));    title('Avg of 10');
subplot(2, 3, 4); imshow(calc_average_of_imgs(get_noisy_imgs(img, 20)));    title('Avg of 20');
subplot(2, 3, 5); imshow(calc_average_of_imgs(get_noisy_imgs(img, 50)));    title('Avg of 50');
subplot(2, 3, 6); imshow(calc_average_of_imgs(get_noisy_imgs(img, 100)));   title('Avg of 100');



function final_img = calc_average_of_imgs(imgs)
    no_of_imgs = size(imgs, 1);

    sum_of_imgs = sum(imgs, 1);
    avg = sum_of_imgs / no_of_imgs;
    final_img = reshape(avg, size(avg, 2), size(avg, 3));

    final_img = uint8(final_img);
end


function imgs = get_noisy_imgs(img, n)
    imgs = zeros(n, size(img, 1), size(img, 2));

    for i=1:n
        imgs(i, :, :) = imnoise(img, 'gaussian');
    end
end
