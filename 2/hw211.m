img = imread('Camera Man.bmp');
he1 = imread('HE1.jpg');
he2 = imread('HE2.jpg');
he3 = imread('HE3.jpg');
he4 = imread('HE4.jpg');
subplot(1,2,1),imshow(imadjust(img)),title('after imadjust');
subplot(1,2,2),imhist(imadjust(img)),title('after imadjust histogram');

% MyHistogram(img);
% histogrameq(img);
% 
% localEq(he1,8);
% localEq(he1,16);
% localEq(he1,24);

% localEq(he2,8);
% localEq(he2,16);
% localEq(he2,24);

% localEq(he3,8);
% localEq(he3,16);
% localEq(he3,24);

% localEq(he4,8);
% localEq(he4,16);
% localEq(he4,24);

% subplot(3,2,1),imshow(img),title('original image');
% subplot(3,2,2),imhist(img), title('original histogram');
% 
% 
% subplot(3,2,1),imshow(img),title('original image');
% subplot(3,2,2),imhist(img), title('original histogram');
% 
% subplot(3,2,3),imshow(histeq(img)),title('equlized image');
% subplot(3,2,4),imhist(histeq(img)), title('equlized histogram');
% 
% 
