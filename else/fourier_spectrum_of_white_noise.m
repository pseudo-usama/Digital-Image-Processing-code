white_noise = uint8(randi([0 255], 500, 500));


white_noise_fourier = fftshift(fft2(white_noise));


subplot(1, 2, 1); imshow(white_noise);
subplot(1, 2, 2); imshow(abs(white_noise_fourier));
