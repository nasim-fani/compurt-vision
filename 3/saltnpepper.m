function[im] = saltnpepper(im, density)
 
b = 0.5; % 50% percent white pixels among all altered pixels
n = numel(im(:,:,1));
m = fix(density*n);
idx = randperm(n, m);
k = fix(b*m);
idx1 = idx(1:k);
idx2 = idx(k+1:end);
idx1 = idx1' + n.*(0:size(im,3)-1);
idx1 = idx1(:);
idx2 = idx2' + n.*(0:size(im,3)-1);
idx2 = idx2(:);
im(idx1) = 255;
im(idx2) = 0;

end
