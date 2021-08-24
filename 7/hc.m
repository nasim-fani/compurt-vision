function [c,r,R] = hc(img,sigma,t)
dx = [-1 0 1;-1 0 1;-1 0 1]/6;
dy = [-1 -1 -1;0 0 0 ; 1 1 1]/6;
g = fspecial('gaussian',max(1,fix(6*sigma)), sigma);
x = flt(img,dx);
y = flt(img,dy);
x2 = conv2(x.^2, g);
y2 = conv2(y.^2, g);
xy = conv2(x.*y, g);
k = 0.04;
R11 = (x2.*y2 - xy.^2)- k*(x2 + y2).^2;
cond = R11>t;
R = R11.*cond;
X = mat2gray(R);
R = (255/(max(max(X))-min(min(X))))*X;
sze = 2*20+1;
mx =ordfilt2(R,sze^2,ones(sze));
R =(R==mx)&(R>t);
[r,c] = find(R);


    function output=flt(img,mask)
        [A,C] = size(img);
        [a,b] = size(mask);
        img = padarray(img,[1,1]);
        output = zeros(A,C,'double');
        for i=1:A
            for j=1:C
                part = img(i:i+a-1,j:j+b-1);
                mult = part.*mask;
                out = sum(mult,'all');
                output(i,j) = out;
            end
        end
    end
end

