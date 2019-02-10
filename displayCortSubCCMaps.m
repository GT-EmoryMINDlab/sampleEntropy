function displayCortSubCCMaps(ccMap,filename,header)
imagesc(ccMap);
colorbar;
colormap jet;
%caxis([0 1]);
caxis([0 1]);
line(0:69,48.5+zeros(70),'LineWidth',1,'Color',[0 0 0]);
line(48.5+zeros(70),0:69,'LineWidth',1,'Color',[0 0 0]);
set(gca,'XTick',[48/2,48+(21/2)],'XTickLabel',{'Cortical' 'Subcortical'});
set(gca,'YTick',[48/2,48+(21/2)],'YTickLabel',{'Cortical' 'Subcortical'});
title(header);
saveas(gcf,filename);
end
