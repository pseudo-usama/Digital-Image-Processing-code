% Example 4.13 in book


img1 = imread('rect.tif');
img2 = imread('translated_rect.tif');
img3 = imrotate(img1, -45);


img1_fourier = fftshift(fft2(img1));
img2_fourier = fftshift(fft2(img2));
img3_fourier = fftshift(fft2(img3));
img1_phase_angle = atan2(imag(img1_fourier), real(img1_fourier));
img2_phase_angle = atan2(imag(img2_fourier), real(img2_fourier));
img3_phase_angle = atan2(imag(img3_fourier), real(img3_fourier));


subplot(3, 3, 1); imshow(img1);
subplot(3, 3, 2); plot_fourier(img1_fourier);
subplot(3, 3, 3); plot_fourier(img1_phase_angle);
subplot(3, 3, 4); imshow(img2);
subplot(3, 3, 5); plot_fourier(img2_fourier);
subplot(3, 3, 6); plot_fourier(img2_phase_angle);
subplot(3, 3, 7); imshow(img3);
subplot(3, 3, 8); plot_fourier(img3_fourier);
subplot(3, 3, 9); plot_fourier(img3_phase_angle);


function plot_fourier(img_fourier)
    imshow(log(abs(img_fourier)), []);
end
