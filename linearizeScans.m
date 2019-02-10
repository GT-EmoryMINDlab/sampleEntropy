function linArr = linearizeScans(images)

linArr = zeros(size(images,1),size(images{1}(:),1))';
for i = 1:size(images,1)
    linArr(:,i) = images{i}(:);
end
end