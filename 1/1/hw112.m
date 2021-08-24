clc;
clear all;
close all;
F = imread('car1.jpg');
S = imread('car2.jpg');
F = im2double(rgb2gray(F));
S = im2double(rgb2gray(S));
[rows, cols] = size(F);
Tmp = [];
%zeros(rows, cols*2);
temp = 0;
S1 = [];
for j = 1:5
    for i = 1:rows
        S1(i,j) = S(i,j);
    end
end
for k = 0:cols-5% to prevent j to go beyond boundaries.
    for j = 1:5
        F1(:,j) = F(:,k+j);
    end
    temp = corr2(F1,S1);
    Tmp = [Tmp temp]; % Tmp keeps growing, forming a matrix of 1*cols
    temp = 0;
end
% 
[Min_value, Index] = max(Tmp);% .
n_cols = Index + cols - 1;% New column of output image.
Opimg = [];
for i = 1:rows
    for j = 1:Index-1
        Opimg(i,j) = F(i,j);% First image is pasted till Index.
    end
    for k = Index:n_cols
        Opimg(i,k) = S(i,k-Index+1);%Second image is pasted after Index.
    end    
end
[r_Opimg c_Opimg] = size(Opimg);
figure,
imshow(Opimg);
title('Stitched Image');
