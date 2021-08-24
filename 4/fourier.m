function customFilter(img,t)
[m,n]=size(img);
N = n;
fimg = fft2(img);
filter = ones(m,n);
%a
for i=1:m
    for j=1:n
        if(i>t*N && j>t*N && i<(1-t)*N && i<(1-t)*N)
            filter(i,j)=0;
        end
    end
end


%b.1
for i=1:m
    for j=1:n
        if(i<=t*N && j<=t*N && i>=0 && j>=0)
            filter(i,j)=0;
        end
    end
end


%b.2
for i=1:m
    for j=1:n
        if(i<=t*N && j<=N-1 && j>=(1-t)*N)
            filter(i,j)=0;
        end
    end
end


%b.3
for i=1:m
    for j=1:n
        if(i<=N && i>=(1-t)*N && j<=t*N)
            filter(i,j)=0;
        end
    end
end


%b.4
for i=1:m
    for j=1:n
        if(i>=(1-t)*N && j<=N-1)
            filter(i,j)=0;
        end
    end
end

fimg = fimg.*filter;
image = ifft2(fimg);
image = real(uint8(image));
figure;
imshow(image,[]);
end

