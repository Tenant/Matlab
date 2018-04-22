% Image Process Toolbox
%% activecontour
% bw = activecontour(A,mask)
% Segment image into foreground and background using active contours (snakes)
% The mask argument is a binary image that specifies the initial state of the active contour

% Read a grayscale image and display it
I = imread('coins.png');
imshow(I)
title('Original Image')

% Specify the initial contour and display it
mask = zeros(size(I));
mask(25:end-25,25:end-25) = 1;
figure
imshow(mask)
title('Initial Contour Location')

% Segment the image using the default method and 300 iterations.
bw = activecontour(I,mask,300);

% Display the result.
figure
imshow(bw)
title('Segmented Image')

