% Explore edge options
pkg load image;

% Read image
% just part of example from video
img = imread('fall-leaves.png');
imshow(img);

% Create gaussian filter
filter_size = 21;
filter_sigma = 3;
filter = fspecial('gaussian', filter_size, filter_sigma);

% apply filter

% clipped filter (black)
smoothed = imfilter(img, filter, 0);

% wrap around
%smoothed = imfilter(img, filter, 'circular');

% copy edge
%smoothed = imfilter(img, filter, 'replicate');

% reflect
%smoothed = imfilter(img, filter, 'symmetric');

imshow(smoothed);
