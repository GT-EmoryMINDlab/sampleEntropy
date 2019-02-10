function meanCCMap = meanCC(images)
%takes in images linearized along the first dimension, so takes in a nxm
%matrix where n is the number of voxels in one image, and m is the number
%of images.
%finds the mean value of each scan, finds the correlation coefficient of
%each 200x1 voxel with the 200x1 mean value 
s = size(images,1);
meanCCMap = zeros(s,1);
meanImage = nanmean(images,1);
for i = 1:s
   meanCC = corrcoef(images(i,:),meanImage);
   meanCCMap(i) = meanCC(1,2); 
end

end