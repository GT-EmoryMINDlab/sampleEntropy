function intensityAverages()
%Run this while in the data folder. Remember to add code and nifti toolbox 
%folder to the path;
direc = dir;
folderNames = {direc(3:end).name};
isDir = {direc(3:end).isdir};
isDir = cell2mat(isDir);
folderNames = folderNames(isDir);
sum = zeros(5,5,5);
totalFileNum = 0;
for i = folderNames
    homeFolder = pwd; 
    currfolder = i{:};
    cd(currfolder);
    subDir = dir;
    filenames = {subDir(:).name};
    filenames = regexp(filenames,'.*\.nii','match');
    filenames(cellfun('isempty',filenames)) = [];
    fileNum = size(filenames,2);
    totalFileNum = totalFileNum + fileNum;
    for file = filenames
        fileN = file{:};
        fileN = fileN{:};
        nii = load_nii(fileN);
        nii = nii.img;
        meanNii = mean(nii,4);
        sizeMean = size(meanNii);
        if (sizeMean ~= size(sum))
            sum = meanNii;
        else
            sum = sum + meanNii;
        end
    end
    cd(homeFolder);
end
averageScans = sum./totalFileNum;
fname = 'avg200';
save([fname '.mat'],'averageScans');
flat = imFlat(averageScans);
imagesc(flat);
saveas(gcf,[fname '.png']);
end