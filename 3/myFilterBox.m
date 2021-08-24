function [c] = myFilterBox(NIm,window)
% Defining the box filter mask
w=(1/window*window)*ones(window,window);    
[ma, na] = size(NIm);
[mb, nb] = size(w);

% To do convolution
c = zeros( ma+mb-1, na+nb-1 );
for i = 1:mb
    for j = 1:nb
        r1 = i;
        r2 = r1 + ma - 1;
        c1 = j;
        c2 = c1 + na - 1;
        c(r1:r2,c1:c2) = c(r1:r2,c1:c2) + w(i,j) * double(NIm);
    end
end


% extract region of size(a) from c
r1 = floor(mb/2) + 1;
r2 = r1 + ma - 1;
c1 = floor(nb/2) + 1;
c2 = c1 + na - 1;
c = c(r1:r2, c1:c2);

end

