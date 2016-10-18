% apply a median filter
pkg load image;

% Read image
img = imread('moon.png');
imshow(img);

noisy_img = imnoise(img, 'salt & pepper', 0.02);
imshow(noisy_img);

median_filtered = medfilt2(noisy_img);
imshow(median_filtered);
