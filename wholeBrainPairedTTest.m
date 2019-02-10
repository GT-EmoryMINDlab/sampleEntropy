function [hVol, pVol] = wholeBrainPairedTTest(task,rest)
dims = size(task{1});
hVol = zeros(dims(1),dims(2),dims(3));
pVol = zeros(dims(1),dims(2),dims(3));
restTest = zeros(size(task,1),1);
taskTest = zeros(size(task,1),1);
for i = 1:dims(1)
    for j = 1:dims(2)
        for k = 1:dims(3)
            for w = 1:size(rest,1)
                restTest(w) = rest{w}(i,j,k);
                taskTest(w) = task{w}(i,j,k);
                [hVol(i,j,k),pVol(i,j,k)] = ttest(restTest,taskTest,'Tail','Left','Alpha',0.01);
            end
        end
    end
end
            
end