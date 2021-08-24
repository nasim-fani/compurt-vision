clc;
clear all;
close all;
img = imread('Barbara.bmp');
f = rgb2gray(img);
q8 = quantize(f,8);
q16 = quantize(f,16);
q32 = quantize(f,32);
q64 = quantize(f,64);
q128 = quantize(f,128); 

histf = histeq(f);
eq8 = imquantize(histf,8);
eq16 = quantize(histf,16);
eq32 = quantize(histf,32);
eq64 = quantize(histf,64);
eq128 = quantize(histf,128);

err8 = immse(q8,f);
err16 = immse(q16,f);
err32 = immse(q32,f);
err64 = immse(q64,f);
err128 = immse(q128,f);

erreq8 = immse(im2uint8(eq8),f);
erreq16 = immse(im2uint8(eq16),f);
erreq32 = immse(eq32,f);
erreq64 = immse(eq64,f);
erreq128 = immse(eq128,f);

