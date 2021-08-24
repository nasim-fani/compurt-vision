function imgOut = myDownsample(img,factor)
[rows,columns]=size(img);
i=1;j=1;
imgOut = zeros(rows/factor, columns/factor);
for x=1:factor:rows
    for y=1:factor:columns
        imgOut(i,j)=img(x,y);
        j=j+1;
    end  
i = i+1;
j=1; 
end

