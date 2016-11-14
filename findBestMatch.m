% Find best match
function best_x = find_best_match(patch, strip)
    % TODO: Find patch in strip and return column index (x value) of topleft corner
    % one method is to use normalized correlation to find the patch that matches
    %
    % c = normxcorr2(patch, strip);
    % [yRaw xRaw]= find(c == max(c(:)));
    %
    % yIndex = yRaw - size(patch, 1) + 1;
    % xIndex = xRaw - size(patch, 2) + 1;
    %
    % best_x = xIndex;

    best_diff = Inf;
    best_x = 0; % initializing to zero

    % We need to loop through the size of the strip minus the size of the patch
    for x = 1:(size(strip)(2) - size(patch)(2))
    	patch_tmp = strip(:, x:(x+size(patch)(2)-1));  % this is the patch which we are sliding across the strip
    	diff = sumsq((patch - patch_tmp)(:));	% sum of squared differences between the patches
    	if diff < best_diff
    		min_diff = diff;
    		best_x = x;
    	endif
    endfor
endfunction

pkg load image;

% Test code:

%% Load images
left = imread('flowers-left.png');
right = imread('flowers-right.png');
figure, imshow(left);
figure, imshow(right);

%% Convert to grayscale, double, [0, 1] range for easier computation
left_gray = double(rgb2gray(left)) / 255.0;
right_gray = double(rgb2gray(right)) / 255.0;

%% Define image patch location (topleft [row col]) and size
patch_loc = [120 170];
patch_size = [100 100];

%% Extract patch (from left image)
patch_left = left_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), patch_loc(2):(patch_loc(2) + patch_size(2) - 1));
figure, imshow(patch_left);

%% Extract strip (from right image)
strip_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), :);
figure, imshow(strip_right);

%% Now look for the patch in the strip and report the best position (column index of topleft corner)
best_x = find_best_match(patch_left, strip_right);
disp(best_x);
patch_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), best_x:(best_x + patch_size(2) - 1));
figure, imshow(patch_right);
