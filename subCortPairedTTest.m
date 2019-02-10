function [hVals pVals] = subCortPairedTTest(restRois,taskRois)
hVals = zeros(size(restRois,2),1);
pVals = zeros(size(restRois,2),1);
for i = 1:size(restRois,2)
    currRest = restRois{i};
    currTask = taskRois{i};
    [hVals(i) pVals(i)] = ttest(currRest,currTask,'Tail','Left','Alpha',0.01);
end
end