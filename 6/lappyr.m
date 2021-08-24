function lappyr(img,levels, filter)
[n,m] = size(img);
final = zeros(2*n,2*m,'uint8');
img = double(img);
N = levels;
lr = cell(N,1);
for i=1:levels
    r1 = n-(0.5)^(i-1)*n+1;
    r2 = n;
    c1 = ((2^(i-1)-1)/(2^(i-2)))*m+1;
    c2 = (2^(i)-1)/(2^(i-1))*m;
    final(r1:r2,c1:c2) = img;
    [P,Q] = size(img);
    new_img = zeros(P/2,Q/2,'double');
    for i=1:2:P
        for j=1:2:Q
            part = double(img(i:i+1,j:j+1));
            mult = part.*filter;
            out = sum(mult,'all');
            new_img(ceil(i/2),ceil(j/2)) = out;
        end
    end
    laplace = img - rep(new_img);
    lr{i} = laplace;
    laplace = norm(laplace);
    laplace = uint8(laplace);
    r1 =n+1;
    r2 = n+(0.5)^(i-1)*n;
    final(r1:r2,c1:c2)=laplace;
    img = new_img;
end
i = levels+1;
r1 = n-(0.5)^(i-1)*n+1;
r2 = n;
c1 = ((2^(i-1)-1)/(2^(i-2)))*m+1;
c2 = (2^(i)-1)/(2^(i-1))*m;
final(r1:r2,c1:c2) =img;
r1 =n+1;
r2 = n+(0.5)^(i-1)*n;
final(r1:r2,c1:c2) = img;
lr{levels+1}=img;

[n,~] = size(laplacians);
recover = lr{n};
for i=1:levels
    n = n-1;
    recover = rep(recover);
    recover = recover + lr{n};
end
recover = uint8(recover);
imshow(recover);
figure ,imshow(final);




    function output = rep(img)
        [r,c] = size(img);
        output = zeros(2*r,2*c,class(img));
        for x = 1:r
            for y = 1:c
                j = 2*(x-1) +1;
                i = 2*(y-1) +1;
                output(j,i) = img(x,y);
                output(j+1,i)= img(x,y);
                output(j,i+1)= img(x,y);
                output(j+1,i+1) =img(x,y);
            end
        end
    end



    function output = norm(img)
        output = mat2gray(img);
        Max = max(max(output));
        Min = min(min(output));
        output = (255/(Max-Min))*output;
    end

end

