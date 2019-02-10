counter = 1;
restImages = cell(200,1);
folders = dir;
folders = {folders(3:end).name};
for x = 1:100
    currFolder = folders{x};
    load([currFolder '/allImages.mat']);
    restImages{counter} = entropyImages{1};
    restImages{counter+1} = entropyImages{2};
    counter = counter+2;
end

    