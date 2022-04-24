%% Reading img
img = imread('tungsten.tif');


%% Constants
img_size = size(img);
img_mn = img_size(1) * img_size(2);
E = 4.0;
[k0, k1, k2] = deal(0.4, 0.02, 0.4);


%% Calculations
global_mean = sum(img(:)) / img_mn;
global_std = sum(sum(img - global_mean)) / img_mn;


function local_mean(x, img_size)
    
end
