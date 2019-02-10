function NetworkCCs = networkCC(networks)
reArrangedNet = networks(1).onlyValues;
reArrangedNet = reArrangedNet';
meanNet = networks(1).mean;
lines = zeros(7,1);
lines(1) = size(reArrangedNet,2);
%takes in rest or task networks, creates mean CC and rearranged CC.
for i = 2:7
    reArrangedNet = [reArrangedNet networks(i).onlyValues'];
    lines(i) = size(reArrangedNet,2);
    meanNet = [meanNet; networks(i).mean];
end
NetworkCCs.reArrangedCC = corrcoef(reArrangedNet);
NetworkCCs.meanCC = corrcoef(meanNet');
NetworkCCs.lines = lines;
end