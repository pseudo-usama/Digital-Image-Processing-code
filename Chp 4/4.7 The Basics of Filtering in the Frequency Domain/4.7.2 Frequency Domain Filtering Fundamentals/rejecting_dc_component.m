%% Reading img
f = imread('circuit board.tif');


%% Converting to frequency domain
F = fftshift(fft2(f));


%% Setting DC component to zero
m = size(F, 1);
n = size(F, 2);
F(m/2, n/2) = 0;
F(m/2+1, n/2+1) = 0;
F(m/2+1, n/2) = 0;
F(m/2, n/2+1) = 0;


%% Converting back to spatial domain
filtered_img = uint8(real(ifft2(ifftshift(F))));


%% Plotting
subplot(1, 2, 1); imshow(f);
subplot(1, 2, 2); imshow(filtered_img)
