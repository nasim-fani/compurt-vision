function[ziz] = verticalEdge(I,mask)
I=double(I);
In=I;      
%Rotate image by 180 degree first flip up to down then left to right 

ziz = mask;
for i=2:size(I, 1)-1
    for j=2:size(I, 2)-1
        %multiplying mask value with the corresponding image pixel value 
        neighbour_matrix=mask.*In(i-1:i+1, j-1:j+1);  
        avg_value=sum(neighbour_matrix(:)); 
        I(i, j)=avg_value; 
    end 
end 
figure, imshow(uint8(I));
end

%https://www.geeksforgeeks.org/matlab-edge-detection-of-an-image-without-using-in-built-function/
