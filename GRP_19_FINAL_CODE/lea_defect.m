function defect = lea_defect(glove)

% Load the glove image
%  glove = imread('leather_glove_tearing_fingertips1.jpg');

% Convert the image to grayscale
gray_glove = rgb2gray(glove);
gray_glove = imsharpen(gray_glove);
glove_medfilt = medfilt2(gray_glove, [3 3]);
glove_medfilt = imadjust(glove_medfilt);

% Threshold the image to create a binary image
binary_glove = glove_medfilt < 130;

% Remove small objects from the binary image
binary_glove = bwareaopen(binary_glove, 20);

% Erode the binary image to remove noise from the background
se = strel('disk', 3);
eroded_glove = imerode(binary_glove, se);
glove_close = imdilate(eroded_glove,se);
glove_close = imclose(glove_close,se);

mask = double(glove_close);
% Set the pixel values outside the mask to NaN
mask(mask==0) = NaN;
% Multiply the original image with the mask to get the segmented image
I_segmented = glove .* repmat(uint8(mask), [1 1 3]);
% Show the original image and the segmented image side by side
% subplot(2,2,1); imshow(I);

% Find the boundaries of the stain
stain_boundaries = bwboundaries(glove_close);

% Overlay the boundaries on the original image
% figure;
% subplot(1, 3, 1);
% imshow(glove);
% title('Original Image');
% 
% subplot(1, 3, 2);
% imshow(I_segmented);
% title('Thresholded Image');
% 
% subplot(1, 3, 3);
% imshow(glove);
hold on;
for k = 1:length(stain_boundaries)
    boundary = stain_boundaries{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2);
end
title('Area of Defect Detection Result');



