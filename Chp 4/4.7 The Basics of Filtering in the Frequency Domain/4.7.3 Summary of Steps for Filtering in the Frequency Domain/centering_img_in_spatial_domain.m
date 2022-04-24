% Not working properly

%% Reading img
f = imread('circuit board.tif');


%% Things
F = convert_to_frequence_domain(f);

% Applying filter
filter = get_ideal_lowpass_filter(size(F), 100);
F_filtered = F .* filter;

% Converting back to spatial domain
f_filtered = convert_back_to_spatial_domain(F_filtered);


%% Plotting
subplot(3, 3, 1); imshow(f);
subplot(3, 3, 2); imshow(f_padded);
subplot(3, 3, 3); imshow(f_centered);
subplot(3, 3, 4); imshow(real(log(F)), []);
subplot(3, 3, 5); imshow(filter);
subplot(3, 3, 5); imshow(f_filtered);


%% Convertion to frequency domain
function frequency_domain_img = convert_to_frequence_domain(img)
    % Add padding to img
    size_of_original_img = size(img);
    padded_img = uint8(zeros(2*size_of_original_img));
    padded_img(1:size_of_original_img(1), 1:size_of_original_img(2)) = img;

    % Centering the padded img
    size_of_padded_img = size(padded_img);
    centered_img = uint8(zeros(size_of_padded_img));

    for x=1:size_of_padded_img(1)
        for y=1:size_of_padded_img(2)
            centered_img(x, y) = padded_img(x, y) * (-1)^(x+y);
        end
    end

    % Converting to frequency domain
    frequency_domain_img = fft2(centered_img);
end


%% Convertion back to spatial domain
function unpadded_img = convert_back_to_spatial_domain(img)
    % Converting to spatial domain
    spatial_domain_img = real(ifft2(img));

    % Uncentering the img
    size_of_spatial_domain_img = size(spatial_domain_img);
    uncentered_img = (zeros(size_of_spatial_domain_img));

    for x=1:size_of_spatial_domain_img(1)
        for y=1:size_of_spatial_domain_img(2)
            uncentered_img(x, y) = spatial_domain_img(x, y) * (-1)^(x+y);
        end
    end

    % Removing padding
    size_of_unpadded_img = round(size(uncentered_img)/2);
    unpadded_img = uncentered_img(1:size_of_unpadded_img(1), 1:size_of_unpadded_img(2));
end


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
