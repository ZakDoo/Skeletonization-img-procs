% read image
I = imread('germs.png');

% convert to grayscale
I = rgb2gray(I);

% Binarize the image
BW = imbinarize(I);


% perform skeletonization
skeleton = bwmorph(BW, 'skel', Inf);   % 'Inf' means iterate until convergence

% remove small undesired branches
skeleton_clean = bwmorph(skeleton, 'spur', 5);

% Display original and skeletonized images
figure;
subplot(1, 3, 1);
imshow(BW);
title('Original Binary Image');

subplot(1, 3, 2);
imshow(skeleton);
title('Raw Skeletonized Image');

subplot(1, 3, 3);
imshow(skeleton_clean);
title('Pruned Skeleton');
