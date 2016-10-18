% Find template 2D
% NOTE: Function definition must be the very first piece of code here!
function [yIndex xIndex] = find_template_2D(template, img)
    % TODO: Find template in img and return [y x] location
    c = normxcorr2(template, img);

    % max(c)  would just give the first column
    % therefore we need to do max(c(:)) to get the absolute max
    % then we need to find the boolean position of where this value is by
    % c == max(c(:))
    % finally we have to find where this position is with
    % find(c == max(c(:))); will give us the raw value of where the y and x value is
    [yRaw xRaw]= find(c == max(c(:)));

    yIndex = yRaw - size(template, 1) + 1;
    xIndex = xRaw - size(template, 2) + 1;

    % NOTE: Turn off all output from inside the function before submitting!
endfunction

pkg load image; % AFTER function definition

% Test code:
tablet = imread('tablet.png');
imshow(tablet);
glyph = tablet(75:165, 150:185);
imshow(glyph);

[y x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet
