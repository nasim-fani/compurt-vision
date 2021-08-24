clc;
clear all;
img = imread('Pepper.bmp');
%rgbtohsi(img);

% out1=uniform_quantize(img,8);
% psnr1 = psnr(img,out1);
% out2=uniform_quantize(img,16);
% psnr2 = psnr(img,out2);
% out3=uniform_quantize(img,32);
% psnr3 = psnr(img,out3);
% out4=uniform_quantize(img,64);
% psnr4 = psnr(img,out4);

out = quantize2(img);
psnr1 = psnr(img,out);
mse = immse(img,out);