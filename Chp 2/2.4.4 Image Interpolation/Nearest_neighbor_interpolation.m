% Code Source: https://www.imageeprocessing.com/2017/11/nearest-neighbor-interpolation.html


img = imread('onion.png');

gray_img = rgb2gray(img);
img_size = size(gray_img);



plot_imgs( ...
    gray_img, ...
    resize_img(gray_img, img_size*2), ...
    resize_img(gray_img, img_size.*[0.5 2]) ...
);



function new_img = resize_img(img, new_size)
    old_size = size(img);
    scale = new_size ./ old_size;

    %OBTAIN THE INTERPOLATED POSITIONS
    IR = ceil([1:new_size(1)] ./ scale(1));
    IC = ceil([1:new_size(2)] ./ scale(2));

    %ROW_WISE INTERPOLATION
    new_img = img(IR, :);
    %COLUMN-WISE INTERPOLATION
    new_img = new_img(:, IC);
end


function plot_imgs(varargin)
    plot_w = max(cellfun(@(img)size(img, 1), varargin));
    plot_h = max(cellfun(@(img)size(img, 2), varargin));
    
    figure
    for i = 1:size(varargin, 2)
        subplot(1, size(varargin, 2), i), imshow(varargin{i});
        axis([0, plot_h, 0, plot_w]);
        axis on;
    end
end
