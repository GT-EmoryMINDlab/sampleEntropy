function displayEntropyScan(flattenedScan,filename,header)
%takes in flattened entropy scan, and displays it with a colorbar and
%adjusts the colormap limits
imagesc(flattenedScan);
colorbar;
cmap = jet(200);
cmap = [.7+zeros(1,3);cmap];
colormap(cmap);
flattenedLine = flattenedScan(:);
caxis([0.48 1.1]); %empirically determined, shows both ranges (task and rest)
title(header);
saveas(gcf,filename);
end
