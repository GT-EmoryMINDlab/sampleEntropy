function entropyAverages()
%Run this while in the data folder to collect all data from entropy
%calculations into one file.
direc = dir;
folderNames = {direc(3:end).name};
isDir = {direc(3:end).isdir};
isDir = cell2mat(isDir);
folderNames = folderNames(isDir);
totalFileNum = 0;
images = {};
for i = folderNames
    homeFolder = pwd; 
    currfolder = i{:};
    cd(currfolder);
    load('allImages.mat');
    images = [images; entropyImages];
    totalFileNum = totalFileNum + 1;
    cd(homeFolder);
end
save('imagesFullSet','images');
end
