taskLine = taskImages{1};
taskLine = taskLine(:);
size1 = size(taskLine,1);
taskCluster = zeros(size1,200);
for k = 1:200
    toAdd = taskImages{k};
    toAdd = toAdd(:);
    taskCluster(1:end,k) = toAdd;
end