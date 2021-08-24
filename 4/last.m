clc;
clear all;
img = imread('Lena.bmp');
img = rgb2gray(img);
img = imresize(img,0.5);
f = customFilter(img,1/4);

img1 = imread('Barbara.bmp');
img1 = rgb2gray(img1);
img1 = im2double(img1);
mask1=[1,2,1;2,4,2;1,2,1]/16;
mask2 =[-1,-1,-1;-1,8,-1;-1,-1,-1];
mask3 =[0,-1,0;-1,5,-1;0,-1,0];
out=filtering(mask2,img1);

img2 = imread('Baboon.bmp');
img2 = rgb2gray(img2);
subplot(2,2,2),imshow(abs(fft2(img2)),[]),title("magnitude of DFT");
subplot(2,2,3),imshow(abs(fftshift(fft2(img2))),[]),title("magnitude of shifted DFT ");
subplot(2,2,4),imshow(log(1+abs(fftshift(fft2(img2)))),[]),title("magnitude of logged DFT");
subplot(2,2,1),imshow(img2,[]),title("original image");
