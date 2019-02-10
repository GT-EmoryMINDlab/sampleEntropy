function [meanImage, meanImageFlat] = meanImage(images)
total = 200;
sum = zeros(91,91,109);
for k = 1:total
    curr = images{k};
    sum = sum + curr;
end
meanImage = sum./total;
meanImageFlat = imFlat(meanImage);
end