% Example: 4.20 in book

%% Reading img
f = im2double(imread('moon.tif'));


%% Filtering
% To frequency domain
F = fftshift(fft2((f)));

% Creating to converting filter to spatial domain
filter = real(ifft2(fftshift(get_laplacian_filter(size(f)) .* F)));
filter = filter ./ max(filter(:));

% Adding laplacian to original img
f_filtered = f - filter;


%% Plotting
subplot(1, 2, 1); imshow(f);            title('Original img');
subplot(1, 2, 2); imshow(f_filtered);   title('Enhanced img');


%% Get laplacian filter
function filter = get_laplacian_filter(filter_size)
    p = filter_size(1);
    q = filter_size(2);
    filter = zeros(filter_size);
    
    for u=1:filter_size(1)
        for v=1:filter_size(2)
            filter(u, v) = -4*pi^2 * ((u-p/2)^2 + (v-q/2)^2);
        end
    end
end
