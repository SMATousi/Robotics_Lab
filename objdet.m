clc
clear


%% Reading the image and 
left_image = imread('rightimage_d1.ppm');


%% Convert to gray scale
left_image2 = rgb2gray(left_image);

%% 
level_l = graythresh(left_image2);
bi_left = imbinarize(left_image2, level_l);
figure(1), 
subplot(2,2,1), imshow(bi_left);
title('Binary image')

%%
%se = strel('line', 11,90);
%bi_left2 = imerode(bi_left, se);
%bi_left3 = ~bi_left2;
%se = strel('line', 25,90);
%bi_left4 = imerode(bi_left3, se);
bi_left = ~bi_left;
bi_left4 = imfill(bi_left, 'holes');
%se = strel('line', 40,90);
%bi_left4 = imerode(bi_left4, se);
bi_left5 = bwareaopen(bi_left4,200); 



figure(1), 
subplot(2,2,2), imshow(bi_left5);
title('Filled binary image')

%%
CC_left = bwconncomp(bi_left5);

centroid_left = regionprops(CC_left, 'centroid', 'area', 'orientation');

centroids = cat(1, centroid_left.Centroid);

imshow(bi_left4)
hold on
plot(centroids(:,1),centroids(:,2), 'b*')
hold off

%%

