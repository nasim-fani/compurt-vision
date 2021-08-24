function wav_pyr(img,level)
[R,C] = size(img);
out= zeros(R,C,'double');
wfilters('haar','d');
[A,H,V,D] = dwt2(img,'haar');
out(1:R/2,1:C/2) = wavelet(A,level-1,present);
out(R/2+1:R,1:C/2)=V;
out(1:R/2,C/2+1:C)=H;
out(R/2+1:R,C/2+1:C)=D;
output = out;
[P,Q] = size(output);
x = output(1:P/(2^(level1)),1:Q/(2^(level-1)));
[r,c] = size(x);
A2 = x(1:r/2,1:c/2);
H2 = x(1:r/2,c/2+1:c);
V2 = x(r/2+1:r,1:c/2);
D2 = x(r/2+1:r,c/2+1:c);
output(1:P/(2^(level1)),1:Q/(2^(level-1))) = idwt2(A2,H2,V2,D2,'haar');
output = wt(output,level-1);
imshow(out);
figure,imshow(uint8(output));

end

