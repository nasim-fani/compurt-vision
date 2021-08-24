function wav2(img,level)
[R,C] = size(img);
output= zeros(R,C,'double');
wfilters('haar','d');
[cA,cH,cV,cD] = dwt2(img,'haar');
cA = quantizer(cA,2);
cV = quantizer(cV,2);
cH = quantizer(cH,2);
cD = quantizer(cD,2);
output(1:R/2,1:C/2) = wavelet(cA,level-1);
output(R/2+1:R,1:C/2)=cV;
output(1:R/2,C/2+1:C)=cH;
output(R/2+1:R,C/2+1:C)=cD;
o = output;
[R,C] = size(o);
x = o(1:R/(2^(level1)),1:C/(2^(level-1)));
[r,c] = size(x);
A = x(1:r/2,1:c/2);
V = x(r/2+1:r,1:c/2);
H = x(1:r/2,c/2+1:c);
D = x(r/2+1:r,c/2+1:c);
o(1:R/(2^(level1)),1:C/(2^(level-1))) = idwt2(A,H,V,D,'haar');
o = wt(o,level-1);
imshow(output);
figure,imshow(uint8(o));
end









function out = quantizer(img,g)
[M,N] = size(img);
out = zeros(M,N,'double');
for i=1:M
    for j=1:N
        out(i,j) = g*sign(img(i,j))*floor(abs(img(i,j))/g);
    end
end
end













end

