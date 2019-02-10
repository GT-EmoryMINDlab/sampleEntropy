function roiBoxPlot(restRois,taskRois)
restRois = cell2mat(restRois');
taskRois = cell2mat(taskRois');
boxplot(restRois','Labels',{'V','SM','DA','VA','LM','FP','DF'});
title('Rest 7-Network Box Plot');
saveas(gcf,'RestNetBox.png');
boxplot(taskRois','Labels',{'V','SM','DA','VA','LM','FP','DF'});
title('Task 7-Network Box Plot');
saveas(gcf,'TaskNetBox.png');
end