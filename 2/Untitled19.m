clc; clear all; close all;
h=imread('Camera Man.bmp');

[M,N]=size(h);
t=1:256;
n=0:255;
count=0;
for z=1:256
    for i=1:M
        for j=1:N
            
            if h(i,j)==z-1
                count=count+1;
            end
        end
    end
            t(z)=count;
            count=0;
end
disp(t')
stem(n,t); 
grid on;

