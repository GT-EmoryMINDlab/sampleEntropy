%prep network data for anova
allValues = [];
netGroup = [];
restTaskGroup = {};
for i = 1:7
    cNet = restNet(i).onlyValues;
    cNet = mean(cNet,2);
    cSize = size(cNet,1);
    allValues = [allValues; cNet];
    rtAdd = cell(cSize,1);
    rtAdd(:) = {'rest'};
    if i == 1
        netGroup(1:end+cSize,1) = i;
    else
        netGroup(end+1:end+cSize) = i;
    end
    restTaskGroup = [restTaskGroup; rtAdd];
end

for i = 1:7
    cNet = taskNet(i).onlyValues;
    cNet = mean(cNet,2);
    cSize = size(cNet,1);
    allValues = [allValues; cNet];
    rtAdd = cell(cSize,1);
    rtAdd(:) = {'task'};
    netGroup(end+1:end+cSize) = i;
    restTaskGroup = [restTaskGroup; rtAdd];
end