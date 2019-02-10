% This Script will run on the contents inside the specified folder, 
%converting each nifti file, and then running the sampEn script on the file.

%This script is for my (Hisham's) personal use, if you need to adapt it to
%your own needs, send me a message so i can explain how it works and where
%it needs to go if you cant figure it out.
echo on;
addpath('/keilholz-lab/hisham/tools/nifti_20140122');
addpath('/keilholz-lab/hisham/sample_entropy_project/code');

%First, convert .nii.gz files to .nii fslchfiletype NIFTI (decompressing seems to break due to
%file size so this is the best workaround i have found) Make sure you have
%navigated to the folder you're running the script on in the command line
%before you open matlab.

%Creates cell array of file names
directory = dir;
filenames = {directory(:).name};
filenames = regexp(filenames,'.*\.nii','match');
filenames(cellfun('isempty',filenames)) = [];
fileNum = size(filenames,2);
niiImages = cell(fileNum,1);
entropyImages = cell(fileNum,1);
%loads nii files into separate cell array
for k = 1:fileNum
    echo on;
    file = filenames{k};
    file = file{1};
    niiImages{k} = load_nii(file);
    niiImages{k} = niiImages{k}.img;
end

%calculates entropy images, saves photo and individual .mat file 
for k = 1:size(niiImages,1)
    entropyImages{k} = entropyCalc(niiImages{k});
    entropyImages{k} = rot90(permute(entropyImages{k},[1 3 2]));
    flattenedImage = imFlat(entropyImages{k});
    imagesc(flattenedImage);
    colormap jet;
    colorbar;
    fileName = filenames{k};
    fileName = fileName{1};
    fileHead = strtok(fileName,'.');
    filenamePNG = [fileHead '_EnImage.png'];
    filenameMAT = [fileHead '_EnImage.mat'];
    saveas(gcf,filenamePNG);
    toSave = entropyImages{k};
    save(filenameMAT,'toSave');
end

%additionally, save all entropyimages to one single .mat, for use in
%calculating average, once this is done.
save('allImages.mat','entropyImages');