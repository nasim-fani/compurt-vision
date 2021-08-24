clc;
% I = imread('Lena.bmp');
% J = rgb2gray(I);
% den1 = imnoise(J,'salt & pepper',0.05);
% den3 = imnoise(J,'salt & pepper',0.1);
% den2 = imnoise(J,'salt & pepper',0.2);
% subplot(3,1,1),imshow(den1),title('0.05');
% subplot(3,1,2),imshow(den2),title('0.1');
% subplot(3,1,3),imshow(den3),title('0.2');
% 
% 
% out3 = medianFilter(den1,3);
% out5 = medianFilter(den1,5);
% out7 = medianFilter(den1,7);
% out9 = medianFilter(den1,9);
% 
% 
% im3 =immse(out3,J);
% fprintf('%0.2f\n', im3);
% im5 =immse(out5,J);
% fprintf('%0.2f\n', im5);
% im7 =immse(out7,J);
% fprintf('%0.2f\n', im7);
% im9 =immse(out9,J);
% fprintf('%0.2f', im9);
% I= imread('Lena.bmp');
% IR = rgb2gray(I);
% blurred = IR;
% blurred1 = IR;
% blurred2 = IR;
% blurred3 = IR;
% for i = 0:1:50
%     blurred = myFilterBox(blurred,3);
% end 
% for i = 0:1:100
%     blurred1 = myFilterBox(blurred1,3);
% end 
% for i = 0:1:200
%     blurred2 = myFilterBox(blurred2,3);
% end 
% for i = 0:1:300 
%     blurred3 = myFilterBox(blurred3,3);
% end 
% subplot(4,1,1), imshow(blurred,[]),title('50');
% subplot(4,1,2), imshow(blurred1,[]),title('100');
% subplot(4,1,3), imshow(blurred2,[]),title('200');
% subplot(4,1,4), imshow(blurred3,[]),title('300');
% 
% image = imread('Lena.bmp');
% grayImg = double(rgb2gray(image));
% 
% % unsharpMasking(grayImg,0.9);
% edgeDetection(grayImg);

% 
A=[1,0,-1]/2;
B=[1,0,-1;1,0,-1;1,0,-1]/6;
C=[1,0,-1;2,0,-2;1,0,-1]/8;
% [-0.166666666666667,0,0.166666666666667;-0.166666666666667,0,0.166666666666667;-0.166666666666667,0,0.166666666666667]
ziz = verticalEdge(grayImg,B);

% img = imread('a.jpg');
% 
% out =unsharpMasking(img,0,5);
% out =medianFilter(out,3);
% imshow(out);
