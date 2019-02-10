restInArray = zeros(91*91*109,200);
for i = 1:200
    currRest = restImages{i};
    currRest = currRest(:);
    currRest(isnan(currRest)) = 0;
    restInArray(:,i) = currRest;
end
taskInArray = zeros(91*91*109,200);
for i = 1:200
    currTask = taskImages{i};
    currTask = currTask(:);
    currTask(isnan(currTask)) = 0;
    taskInArray(:,i) = currTask;
end
ttestLine = zeros(size(taskInArray,1),1);
for i = 1:size(taskInArray,1)
    ttestLine(i) = ttest(restInArray(i,:),taskInArray(i,:),'Alpha',0.001);
end