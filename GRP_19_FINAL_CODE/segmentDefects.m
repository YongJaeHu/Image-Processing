function I_SegmentStains = segmentDefects(I);

% %%%%%%%%%%%%%%%%%%%%
I = imread('latex5.png');
I = segmentGlove(I);

%%%%%%%%%%%%%%%%
I_gray = rgb2gray(I);

%%turning black to white to prevent problems in segmenting stains
blackPixels = I_gray <= 25;
I_gray(blackPixels) = 0;
% imshow(I_gray);

% Apply median filtering to enhance defects
I_medfilt = medfilt2(I_gray, [3 3]);
I_medfilt = imadjust(I_medfilt);
% imshow(I_medfilt);
% Apply global thresholding
thresh = graythresh(I_medfilt);
I_thresh = imbinarize(I_medfilt, 0.63); %%%55 (latex3); 475(latex1,2); 50-latex4; 63-latex5
% imshow(I_thresh);

% Remove small objects
I_thresh = bwareaopen(I_thresh, 10);
I_threshInverted = imcomplement(I_thresh);
% subplot(3,3,1);imshow(I_threshInverted);
% Fill holes in objects
I_filled = imcomplement(imfill(I_threshInverted, 'holes'));

I_filled = imcomplement(I_filled);
% subplot(3,3,3);imshow(I_filled);

I_stains = I;
I_stains(repmat(~I_filled, [1 1 3])) = 0;
% imshow(I_stains);
% Show the result
% subplot(3,3,4);imshow(I);
% subplot(3,3,5);imshow(I_stains);
imshow(I_stains);
se = strel('disk', 12);
I_erode = imerode(I_stains, se);
I_close = imdilate(I_erode,se);
I_close = imclose(I_close,se);

% subplot(3,3,6);imshow(I_erode);
% subplot(3,3,7);imshow(I_close);
% imshow(I_close);
I_SegmentStains = I_close;