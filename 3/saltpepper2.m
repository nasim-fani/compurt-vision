function img = saltpepper2(varargin)

img = varargin{1};
ND = varargin{2};
min_val = 0;
max_val = 255;
Narr = rand(size(img));
img(Narr<ND/2) = min_val;
img((Narr>=ND/2)&(Narr<ND)) = max_val;

end