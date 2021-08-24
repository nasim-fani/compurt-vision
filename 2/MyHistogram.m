function MyHistogram(grayImage)
[M,N]=size(grayImage);
t=1:256;
n=0:255;
count=0;
for z=1:256
    for i=1:M
        for j=1:N
            
            if grayImage(i,j)==z-1
                count=count+1;
            end
        end
    end
            t(z)=count;
            count=0;
end
figure;
subplot(1,2,1);
stem(n,t); 
grid on;
subplot(1,2,2);
imhist(grayImage);
end