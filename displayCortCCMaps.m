function displayCortCCMaps(ccMap,filename,header)
imagesc(ccMap);
colorbar;
colormap jet;
%caxis([0 1]);
caxis([0 1]);
set(gca,'XTick',48/2,'XTickLabel','Cortical');
set(gca,'YTick',48/2,'YTickLabel','Cortical');
title(header);
saveas(gcf,filename);
end