function [out] = quantize2(img)
Red = img(:,:,1);
Green = img(:,:,2);
blue = img(:,:,3);
qr= 256/6;
qg= 256/6;
qb= 256/4;
qr1= quantize(Red,qr);
qg1= quantize(Green,qg);
qb1= quantize(blue,qb);
out=cat(3,qr1,qg1,qb1);
figure;
imshow(out,[]),title("quantized");
end

function [out1]= quantize(f,q)
[n,m] = size(f);
for i=1:n
    for j=1:m
        if(f(i,j)>0&& f(i,j)<255)
            out1(i,j)= floor(f(i,j)/q)*q+q/2;
        elseif(f(i,j)<=0)
            out1(i,j)= q/2;
        elseif(f(i,j)>=255)
            out1(i,j)= 255 - q/2; 
        end
    end 
end
end

