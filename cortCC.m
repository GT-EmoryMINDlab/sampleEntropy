function cortCC = cortCC(cortical)
%arrange rois, cortical regions first, proceeded by subcortical regions
%two ccs are produced, one with all voxels realigned, one with only mean
%regions.
%fullVoxels = cortical(1).onlyValues;
%fullVoxels = fullVoxels';

meanRegions = cortical(1).mean';

%lines = zeros(1,size(cortical,2)+size(subcortical,2));
%lines(1) = size(fullVoxels,2);

for i = 2:size(cortical,2)
    %fullVoxels = [fullVoxels cortical(i).onlyValues'];
    %lines(i) = size(fullVoxels,2);
    meanRegions = [meanRegions cortical(i).mean'];
end
cortCC = corrcoef(meanRegions);
end