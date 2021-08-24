function [out] = uniform_quantize(img,L)
Red = img(:,:,1);
Green = img(:,:,2);
blue = img(:,:,3);
q= 256/L;
qr= quantize(Red,q);
qg= quantize(Green,q);
qb= quantize(blue,q);
out=cat(3,qr,qg,qb);
figure;
imshow(out,[]),title("quantized L=64");
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

