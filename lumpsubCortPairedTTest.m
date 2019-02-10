function [hVal, pVal] = lumpsubCortPairedTTest(restRois,taskRois)
restRois = cell2mat(restRois');
taskRois = cell2mat(taskRois');
restLump = mean(restRois,1);
taskLump = mean(taskRois,1);
[hVal, pVal] = ttest(restLump,taskLump,'Tail','Right','Alpha',0.01);
end