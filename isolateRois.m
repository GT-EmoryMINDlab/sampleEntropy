function isolatedROIs = isolateRois(arrScans, rois)
% @parameters:
% arrScans - Linearized scans in an array, where each new row is a new scan
% rois - Structure of rois to be isolated
%
% @returns
% isolatedROIs - a structure containing each isolated roi (linearized), 
% the mean roi (scan dimension, not 1-D space), and the roi without any nan
% values.

numRois = size(rois,2);
numScans = size(arrScans,2);
for i = 1:numRois
    roi = rois(i).maskLine;
    for j = 1:numScans
        currScan = arrScans(:,j);
        currScan(~roi) = nan;
        isolatedROIs(i).networks(:,j) = currScan;
        isolatedROIs(i).mean(j) = nanmean(currScan(:));
        isolatedROIs(i).onlyValues(:,j) = currScan(~isnan(currScan));
    end
end
end