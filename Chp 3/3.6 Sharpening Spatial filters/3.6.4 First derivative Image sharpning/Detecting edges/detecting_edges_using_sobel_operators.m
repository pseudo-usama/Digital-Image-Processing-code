img = zeros(500, 500);

% Horizontal lines
img(20, 50:200) = 1;
img(50:52, 50:200) = 1;
img(80:83, 50:200) = 1;
img(110:114, 50:200) = 1;
img(140:144, 50:200) = 1;


% Vertical lines
img(20:144, 300) = 1;
img(20:144, 330:331) = 1;
img(20:144, 360:363) = 1;
img(20:144, 390:394) = 1;
img(20:144, 420:425) = 1;


% Diagnal 1 lines
x = 20;
y = 180;
img = insertShape(img, 'line', [1*x y 1*x+150 y+150], 'linewidth', 1, 'Color', {'White'});
img = insertShape(img, 'line', [2*x y 2*x+150 y+150], 'linewidth', 2, 'Color', {'White'});
img = insertShape(img, 'line', [3*x y 3*x+150 y+150], 'linewidth', 3, 'Color', {'White'});
img = insertShape(img, 'line', [4*x y 4*x+150 y+150], 'linewidth', 4, 'Color', {'White'});
img = insertShape(img, 'line', [5*x y 5*x+150 y+150], 'linewidth', 5, 'Color', {'White'});


% Diagnal 2 lines
x = 380;
y = 250;
img = insertShape(img, 'line', [x+0*20 y x-150+0*20 y+150], 'linewidth', 1, 'Color', {'White'});
img = insertShape(img, 'line', [x+1*20 y x-150+1*20 y+150], 'linewidth', 2, 'Color', {'White'});
img = insertShape(img, 'line', [x+2*20 y x-150+2*20 y+150], 'linewidth', 3, 'Color', {'White'});
img = insertShape(img, 'line', [x+3*20 y x-150+3*20 y+150], 'linewidth', 4, 'Color', {'White'});
img = insertShape(img, 'line', [x+4*20 y x-150+4*20 y+150], 'linewidth', 5, 'Color', {'White'});


% Filters
hor_filter = [
    -1 -2 -1
     0  0  0
     1  2  1
];
ver_filter = [
    -1 0 1
    -2 0 2
    -1 0 1
];
diagnal1_filter = [
    -2 -1 0
    -1  0 1
     0  1 2
];
diagnal2_filter = [
    0 -1 -2
    1  0 -1
    2  1  0
];



% Appling filters
hor_edges = uint8(rescale(imfilter(img, hor_filter), 0, 255));
ver_edges = uint8(rescale(imfilter(img, ver_filter), 0, 255));
diagnal1_edges = uint8(rescale(imfilter(img, diagnal1_filter), 0, 255));
diagnal2_edges = uint8(rescale(imfilter(img, diagnal2_filter), 0, 255));


% Plotting
subplot(2, 3, 1); imshow(img);              title('Original');
subplot(2, 3, 2); imshow(hor_edges);        title('Horizontal filter');
subplot(2, 3, 3); imshow(ver_edges);        title('Vertical edges');
subplot(2, 3, 4); imshow(diagnal1_edges);   title('Diagnoal 1 edges');
subplot(2, 3, 5); imshow(diagnal2_edges);   title('Diagnoal 2 edges');
