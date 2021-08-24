function [output] = untitled3(img,level)
noisyImg = imnoise(img,'gaussian',0.01);
[R,C] = size(noisyImg);
output = zeros(R,C,'double');
[A,H,V,D] = dwt2(noisyImg,'haar');
beta = sqrt(log2(R/3));
sigma = median(abs(cD)./0.6745).^2;
H = treshold(H,beta,sigma);
D = treshold(D,beta,sigma);
V = treshold(V,beta,sigma);
output(1:R/2,1:C/2) = wt(A,level-1);
output(R/2+1:R,1:C/2)=V;
output(1:R/2,C/2+1:C)=H;
output(R/2+1:R,C/2+1:C)=D;
x = iwt(output,level);
imshow(noisyImg);
figure,imshow(uint8(x));
end











function output= treshold(img,beta,sigma)
[R,C] = size(img);
output = zeros(R,C);
local_sigma = std(double(img));
T = (beta*sigma)/local_sigma;
for i=1:R
    for j=1:C
        res = img(i,j);
        if(abs(res)<T)
            res =0;
        else
            res = sign(res)*abs(res-T);
        end
        output(i,j)=res;
    end
end

end







function output = iwt(wt_pyramid,level)
if(level==0)
    output = wt_pyramid;
    return
end
output = wt_pyramid;
[R,C] = size(output);
dec_part = output(1:R/(2^(level1)),1:C/(2^(level-1)));
[r,c] = size(dec_part);
cA = dec_part(1:r/2,1:c/2);
cV = dec_part(r/2+1:r,1:c/2);
cH = dec_part(1:r/2,c/2+1:c);
cD = dec_part(r/2+1:r,c/2+1:c);

output(1:R/(2^(level1)),1:C/(2^(level-1))) =
idwt2(cA,cH,cV,cD,'haar');

output = iwt(output,level-1);

end

end

