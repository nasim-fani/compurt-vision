function res = averaging(img)
[x,y] = size(img);
res = zeros(x,y);
windows = 8;
for i=1:windows:x
    for j=1:windows:y
        res(i:i+windows-1,j:j+windows-1)=...
            mean2(img(i:i+windows-1,j:j+windows-1));
    end
end

end

