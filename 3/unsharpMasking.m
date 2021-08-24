function[out] = unsharpMasking(img,alpha,filterSize)
blurred = imgaussfilt(img,'FilterSize',filterSize);
out = img + (alpha*(blurred-img));
end

