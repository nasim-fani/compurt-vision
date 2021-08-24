function [counts, grayLevels] = MyHistogram(grayImage)
[rows, columns, numberOfColorChannels] = size(grayImage);
counts = zeros(1, 256);
for col = 1 : columns
	for row = 1 : rows
		% Get the gray level.
		grayLevel = grayImage(row, col);
		% Add 1 because graylevel zero goes into index 1 and so on.
		counts(grayLevel+ 1) = counts(grayLevel+1) + 1;
	end
end
grayLevels = 0 : 255;
bar(grayLevels, counts, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 10);
ylabel('Pixel Count', 'FontSize', 10);
title('Histogram', 'FontSize', 10);
grid on;
end