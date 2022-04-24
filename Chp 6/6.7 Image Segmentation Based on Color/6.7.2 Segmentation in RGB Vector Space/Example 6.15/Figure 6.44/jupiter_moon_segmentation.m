%% Reading img
img = im2double(imread('jupiter_moon.tif'));


%% Marking region of interest & calculating average color in interested_region
interested_region_coordinates = [50 220 51 100]; % x, y, w, h
marked_img = insertShape(img, 'rectangle', interested_region_coordinates);

interested_region = img( ...
    interested_region_coordinates(1):interested_region_coordinates(1)+interested_region_coordinates(3), ...
    interested_region_coordinates(2):interested_region_coordinates(2)+interested_region_coordinates(4), ...
    : ...
);

avg_clr = cat( ...
    3, ...
    mean(interested_region(:,:,1), 'all'), ...
    mean(interested_region(:,:,2), 'all'), ...
    mean(interested_region(:,:,3), 'all')  ...
);

std_vec = cat( ...
    3, ...
    std(interested_region(:,:,1), 0, 'all'), ...
    std(interested_region(:,:,2), 0, 'all'), ...
    std(interested_region(:,:,3), 0, 'all')  ...
);


%% Segmentation
img_size = size(img(:,:,1));
segmented_img = zeros(img_size);

a = 0.6;
lower_bound = avg_clr - a .* std_vec;
upper_bound = avg_clr + a .* std_vec;

for m=1:img_size(1)
    for n=1:img_size(2)
        if (lower_bound <= img(m,n,:)) & (img(m,n,:) <= upper_bound)
            segmented_img(m,n) = 1;
        end
    end
end


%% Plotting
subplot(2,1,1); imshow(marked_img); title('Original img with sampling region marked');
subplot(2,1,2); imshow(segmented_img, []); title('Segmented img');
