function allNetMasks = meanMasksNetworks(networks,filename)
allNetMasks = nan(size(networks(1).networks,1),1);
for i = 1:size(networks,2)
    currNetMask = networks(i).networks;
    currNetMask = mean(currNetMask,2);
    avgValue = mean(mean(networks(i).onlyValues));
    allNetMasks(~isnan(currNetMask)) = avgValue;
end
allNetMasks = reshape(allNetMasks,91,91,109);
allNetMasks = permute(rot90(allNetMasks,3),[1 3 2]);
nii = make_nii(allNetMasks,[2,2,2],[0 0 0],16,'filename');
save_nii(nii,[filename,'.nii']);