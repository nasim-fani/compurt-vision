function out = quantize(img, level)
out = floor(img ./ (256/level));
end

