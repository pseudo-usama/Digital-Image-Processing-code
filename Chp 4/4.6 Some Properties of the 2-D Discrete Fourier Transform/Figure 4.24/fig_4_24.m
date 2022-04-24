% Example 4.24 in book


f = imread('rect.tif');

F = fft2(f);
Fs = fftshift(F);


subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(abs(F), []);
subplot(2, 2, 3); imshow(abs(Fs), []);
subplot(2, 2, 4); imshow(log(abs(Fs)), []);
