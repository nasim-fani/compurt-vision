function out = filtering(filter,input)
[m,n] = size(input);
c = zeros(2*m,2*n);
[p,q] = size(c);
for i = 1:p
    for j = 1:q
        if i <= m && j<= n
            c(i,j) = input(i,j);
        else
            c(i,j) = 0;
        end
    end
end

d = zeros(p,q);
for i = 1:p
    for j = 1:q
        d(i,j) = c(i,j).*(-1).^(i + j);
    end
end

e = fft2(d);
eshift =fftshift(e);
z = zeros(p,q);
z(floor(p/2-1):floor(p/2+1),floor(q/2-1):floor(q/2+1))= filter;
zshift=fft2(z);
h1 = eshift.*zshift;
hh = ifftshift(h1);
h2 = ifft2(hh);
rh2 = real(h2);
h3 = zeros(p,q);
for i = 1:p
    for j = 1:q
        h3(i,j) = rh2(i,j).*((-1).^(i+j));
    end
end

out = zeros(m,n);
for i = 1:m
    for j = 1:n
        out(i,j) = h3(p-i,q-j);
    end
end
imshow(im2double(out));
end

