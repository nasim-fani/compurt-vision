function lp(img,levels)
avg_filter = [1 1;1 1]/4;
[pyramid,laplacians] = lpyramid(img,levels,avg_filter);
[n,~] = size(laplacians);
recovered = laplacians{n};
for i=1:levels
    n = n-1;
    recovered = pixel_rep(recovered);
    recovered = recovered + laplacians{n};
end
recovered = uint8(recovered);
imshow(recovered);
figure ,imshow(pyramid);





    function [final,laplacians_recovered] = lpyramid(img,levels,avg_filter)              
        [n,m] = size(img);
        final = zeros(2*n,2*m,'uint8');
        img = double(img);        
        N = levels;
        laplacians_recovered = cell(N,1);
        for i=1:levels            
            r1 = n-(0.5)^(i-1)*n+1;
            r2 = n;
            c1 = ((2^(i-1)-1)/(2^(i-2)))*m+1;
            c2 = (2^(i)-1)/(2^(i-1))*m;            
            final(r1:r2,c1:c2) = img;           
            new_img = average_filter(img,avg_filter);         
            laplace = img - pixel_rep(new_img);          
            laplacians_recovered{i} = laplace;            
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
        laplacians_recovered{levels+1}=img;
    end






    function output = pixel_rep(img)
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



    function output=average_filter(image,filter)
        [R,C] = size(image);
        output = zeros(R/2,C/2,'double');
        for i=1:2:R
            for j=1:2:C
                part = double(image(i:i+1,j:j+1));
                mult = part.*filter;
                out = sum(mult,'all');
                
                output(ceil(i/2),ceil(j/2)) = out;
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

