%% Reading img
% original_img = imread('Skull.tif');
% original_img = imread('Clock.tif');
original_img = imread('currency_note.tif');



%% Plotting
subplot(2, 4, 1); imshow(reduce_bits(original_img, 0));
subplot(2, 4, 2); imshow(reduce_bits(original_img, 1));
subplot(2, 4, 3); imshow(reduce_bits(original_img, 2));
subplot(2, 4, 4); imshow(reduce_bits(original_img, 3));
subplot(2, 4, 5); imshow(reduce_bits(original_img, 4));
subplot(2, 4, 6); imshow(reduce_bits(original_img, 5));
subplot(2, 4, 7); imshow(reduce_bits(original_img, 6));
subplot(2, 4, 8); imshow(reduce_bits(original_img, 7));


%% Functions to remove bit planes
function output_img = remove_right_most_bits(img, bits_to_reduce)
%     output_img = floor(img / (2^bits_to_reduce)) * (2^bits_to_reduce);
    output_img = bitshift(bitshift(img, -bits_to_reduce), bits_to_reduce);
end

function output_img = remove_left_most_bits(img, bits_to_reduce)
    total_bits = 8;

    output_img = bitand(2^(total_bits - bits_to_reduce)-1, img);
end


%% Helps in reducing planes
function final_img = reduce_bits(img, bits_to_reduce)
%     new_img = remove_right_most_bits(img, bits_to_reduce);
    new_img = remove_left_most_bits(img, bits_to_reduce);
    
    final_img = range_transformation(new_img);
end


%% Rescaling
function final_img = range_transformation(img)
    no_of_intensity_levels = 256;
    
    img = double(img);

    % Scaling
    temp = img - min(min(img));
    transformed_img = (no_of_intensity_levels - 1) * (temp/max(max(temp)));

    final_img = uint8(transformed_img);
end
