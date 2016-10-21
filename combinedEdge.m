% For Your Eyes Only
pkg load image;

frizzy = imread('frizzy.png');
froomer = imread('froomer.png');
imshow(frizzy);
imshow(froomer);

% TODO: Find edges in frizzy and froomer images
frizzy_edge = edge(rgb2gray(frizzy), 'canny');
froomer_edge = edge(rgb2gray(froomer), 'canny');

% TODO: Display common edge pixel
combine_edge = frizzy_edge == 1 & froomer_edge == 1;
imshow(combine_edge)
