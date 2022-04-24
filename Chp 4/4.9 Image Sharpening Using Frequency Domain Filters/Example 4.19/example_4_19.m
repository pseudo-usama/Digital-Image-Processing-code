%% Reading img
f = imread('thumb.tif');


%% Processing
% To frequency domain
F = fftshift(fft2(f));

% Filtering
F_filtered = F .* get_butterworth_highpass_filter(size(f), 50, 4);

% To spatial domain
f_filtered = real(ifft2(fftshift(F_filtered)));

% Thresholding
f_filtered_threshold = f_filtered;
f_filtered_threshold(f_filtered < 0) = 0;
f_filtered_threshold(f_filtered > 0) = 1;


%% Plotting
subplot(1, 3, 1); imshow(f);                        title('Original img');
subplot(1, 3, 2); imshow(uint8(f_filtered));        title('Butterworth highpass filtered');
subplot(1, 3, 3); imshow(f_filtered_threshold, []); title('Thresholding');


%% Get butterworth highpass filter
function filter = get_butterworth_highpass_filter(filter_size, radius, n)
    p = filter_size(1);
    q = filter_size(2);

    filter = zeros(filter_size);

    for u=1:filter_size(1)
        for v=1:filter_size(2)
            filter(u, v) = 1 / (1 + (radius/sqrt((u-p/2)^2 + (v-q/2)^2))^(2*n));
        end
    end
end