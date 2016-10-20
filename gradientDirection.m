% Gradient Direction
pkg load image;

% the result will be the truth table of having all of the conditions below
function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_high)
    % TODO Find and return pixels that fall within the desired mag, angle range
   result = gmag >= mag_min & gdir >= angle_low & gdir <= angle_high;

endfunction

% log and convert image to double and scale down to range 0 to 1 range

img = double(imread('octagon.png')) / 255.;
imshow(img);

% compute x and y gradients
[gx gy] = imgradientxy(img, 'sobel');

% note that sobel operator looks like the following:
% -1 0 1
% -2 0 2
% -1 0 1
%
% if we have a picture with the boundaries
% [0 0 0 1 1 1]
% this would result in 4
%
% [1 1 1 0 0 0]
% this would result in -4
%
% gradient values is now in range [-4, 4]
% so if we add 4 to both sides the range is [0, 8]
% finally if we divide by 8 then we have range [0,1]
% therefore we add 4 and divide by 8 as shown below

imshow((gx+4)/8);


% Find gradient mag and Direction
[gmag gdir] = imgradient(gx,gy);

% gmag = sqrt(gx^2 + gy^2) therefore range is [0, 4*sqrt(2)]
imshow(gmag/(4*sqrt(2)));
imshow((gdir + 180.0)/360.0); % range was -180 to 180

%% Find pixels with desired gradient direction

my_grad = select_gdir(gmag, gdir, 1, 30, 60); % 45 +/- 15
imshow(my_grad);
