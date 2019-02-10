function [hVals pVals] = networkPairedTTest(restRois,taskRois)
restRoiMeans = {restRois(:).mean};
taskRoiMeans = {taskRois(:).mean};
hVals = zeros(size(restRoiMeans,2),1);
pVals = zeros(size(restRoiMeans,2),1);
for i = 1:size(restRoiMeans,2)
    currRest = restRoiMeans{i};
    currTask = taskRoiMeans{i};
    [hVals(i) pVals(i)] = ttest(currRest,currTask,'Tail','Right','Alpha',0.01);
end
end