function roiStruct = separateROIs(rois)
roiStruct = struct();
roiNum = max(rois(:));
for k = 1:roiNum
    roiStruct(k).mask = rois == k;
    roiStruct(k).maskLine = roiStruct(k).mask(:);
end