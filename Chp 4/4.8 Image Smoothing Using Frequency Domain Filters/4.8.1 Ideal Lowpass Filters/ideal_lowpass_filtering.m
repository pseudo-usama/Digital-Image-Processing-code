%% Reading img
f = imread('test img.tif');


%% Processing
% Converting to frequency domain
F = fftshift(fft2(f));

% Applying filters
F1_filtered = F .* get_ideal_lowpass_filter(size(F), 10);
F2_filtered = F .* get_ideal_lowpass_filter(size(F), 30);
F3_filtered = F .* get_ideal_lowpass_filter(size(F), 60);
F4_filtered = F .* get_ideal_lowpass_filter(size(F), 160);
F5_filtered = F .* get_ideal_lowpass_filter(size(F), 460);

% Converting back to spatial domain
f1_filtered = real(ifft2(fftshift(F1_filtered)));
f2_filtered = real(ifft2(fftshift(F2_filtered)));
f3_filtered = real(ifft2(fftshift(F3_filtered)));
f4_filtered = real(ifft2(fftshift(F4_filtered)));
f5_filtered = real(ifft2(fftshift(F5_filtered)));


%% Plotting
subplot(3, 4, 1); imshow(f);                                title('Original img');
subplot(3, 4, 2); imshow(real(log(F)), []);                 title('Frequency domain');

subplot(3, 4, 3); imshow(real(log(F1_filtered)), []);       title('Radius: 10');
subplot(3, 4, 4); imshow(f1_filtered, []);

subplot(3, 4, 5); imshow(real(log(F2_filtered)), []);       title('Radius: 30');
subplot(3, 4, 6); imshow(f2_filtered, []);

subplot(3, 4, 7); imshow(real(log(F3_filtered)), []);       title('Radius: 60');
subplot(3, 4, 8); imshow(f3_filtered, []);

subplot(3, 4, 9); imshow(real(log(F4_filtered)), []);       title('Radius: 160');
subplot(3, 4, 10); imshow(f4_filtered, []);

subplot(3, 4, 11); imshow(real(log(F5_filtered)), []);      title('Radius: 460');
subplot(3, 4, 12); imshow(f5_filtered, []);



%% Get Ideal lowpass filter
function filter = get_ideal_lowpass_filter(filter_size, radius)
    p = filter_size(1);
    q = filter_size(2);

    filter = zeros(filter_size);

    for u=1:filter_size(1)
        for v=1:filter_size(2)
            if ((u-p/2)^2 + (v-q/2)^2 <= radius^2)
                filter(u, v) = 1;
            end
        end
    end
end
