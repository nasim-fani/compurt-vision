function image2=Rotate(image, angle)
[h,w,c]=size(image);
midx=round(h/2);
midy=round(w/2);

for cc=1:c
for ii=1:h
    for jj=1:w
        
    x_idx=round((ii-midx)*cosd(angle)+sind(angle)*(jj-midy))+midx;
    y_idx=round(cosd(angle)*(jj-midy)-sind(angle)*(ii-midx))+midy;
    if(x_idx>1 && y_idx>1 && x_idx<=h && y_idx<=w)
    image2(ii,jj,cc)=image(x_idx,y_idx,cc);   
    end
    
    end
end 
end
