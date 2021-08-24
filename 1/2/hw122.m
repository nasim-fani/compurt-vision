clc;
clear all;
close all;

img = imread('goldhill.bmp');

downsampled = myDownsample(img, 2);
avDownSampled = myDownsample(averaging(img),2);
% figure;
% imshow(downsampled,[]);
% figure;
% imshow(avDownSampled,[]);

avgUpBi = bi_inter(downsampled,2);
figure;
imshow(avgUpBi,[]);
% 
% avgUpnear = upsample_nearest(avDownSampled);
% figure;
% imshow(avgUpnear,[]);
err =immse(avgUpBi,img);