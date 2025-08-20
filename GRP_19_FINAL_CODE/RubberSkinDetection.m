function skinMask = RubberSkinDetection(glove)

% Read in an input image
%glove = imread('glove_tear_palm_2.jpg');

% Convert the image to the YCbCr color space
ycbcrImg = rgb2ycbcr(glove);

% Define the range of skin colors in YCbCr space
minY = 16;
maxY = 235;
minCb = 77;
maxCb = 127;
minCr = 133;
maxCr = 173;

% Create a binary mask for skin pixels
skinMask = (ycbcrImg(:,:,1) >= minY) & (ycbcrImg(:,:,1) <= maxY) & ...
           (ycbcrImg(:,:,2) >= minCb) & (ycbcrImg(:,:,2) <= maxCb) & ...
           (ycbcrImg(:,:,3) >= minCr) & (ycbcrImg(:,:,3) <= maxCr);

% Apply morphological operations to the skin mask to remove noise
skinMask = imopen(skinMask, strel('disk', 5));
skinMask = imclose(skinMask, strel('disk', 5));

% Display the binary skin mask and the original image
figure;
subplot(1,2,1);
imshow(skinMask);
title('Binary Skin Mask');
subplot(1,2,2);
imshow(glove);
title('Original Image');
