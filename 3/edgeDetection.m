function edgeDetection(image)
mask1=[1,0,-1]/2;
mask2=[1,0,-1;1,0,-1;1,0,-1]/6;
mask3=[1,0,-1;2,0,-2;1,0,-1]/8;
I1 = image;
I2 = image;
I3 = image;
In1=I1;
In2=I2;
In3=I3;
mask1=flipud(mask1);  
mask1=fliplr(mask1); 
mask2=flipud(mask2);  
mask2=fliplr(mask2);
mask3=flipud(mask3);  
mask3=fliplr(mask3);
for i=2:size(I1, 1)-1
    for j=2:size(I1, 2)-1
        neighbour_matrix=mask1.*In1(i-1:i+1, j-1:j+1);  
        avg_value=sum(neighbour_matrix(:)); 
        I1(i, j)=avg_value/2; 
    end 
end 

for i=2:size(I2, 1)-1
    for j=2:size(I2, 2)-1
        neighbour_matrix=mask2.*In2(i-1:i+1, j-1:j+1);  
        avg_value=sum(neighbour_matrix(:)); 
        I2(i, j)=avg_value/6; 
    end 
end 

for i=2:size(I3, 1)-1
    for j=2:size(I3, 2)-1
        neighbour_matrix=mask3.*In3(i-1:i+1, j-1:j+1);  
        avg_value=sum(neighbour_matrix(:)); 
        I3(i, j)=avg_value/8; 
    end 
end 


subplot(3,1,1), imshow(imadjust(uint8(I1))),title('a');
subplot(3,1,2), imshow(imadjust(uint8(I2))),title('b');
subplot(3,1,3), imshow(imadjust(uint8(I3))),title('c');
end

%https://www.geeksforgeeks.org/matlab-edge-detection-of-an-image-without-using-in-built-function/
