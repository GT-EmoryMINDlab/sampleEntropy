function separated = sepNet(networkStruct, brainEn)
%takes in networks, and a linearized mxn matrix (m is length of full line,
%n is number of scans) and creates a structure isolating all 7 tight
%networks
for i = 1:7
    network = networkStruct(i).maskLine;
    for j = 1:200
        currRow = brainEn(:,j);
        currRow(~network) = nan;
        separated(i).networks(:,j) = currRow;
        separated(i).mean(j) = nanmean(currRow(:));
        separated(i).onlyValues(:,j) = currRow(~isnan(currRow));
    end
end
end