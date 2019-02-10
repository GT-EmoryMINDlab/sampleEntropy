function plotReArrangedCC(CCs,filename,header)
figure;
imagesc(CCs.reArrangedCC);
title([header ' Full']);
colormap jet;
points = 1:size(CCs.reArrangedCC,2);
colorbar;
caxis([-.5 1]);
ticks = CCs.lines(1)/2;
for i = 2:7
    ticks = [ticks, CCs.lines(i-1) + (CCs.lines(i)-CCs.lines(i-1))/2];
end
for i = 1:6
    currLine = zeros(size(points)) + CCs.lines(i);
    line(currLine, points, 'LineWidth',1,'Color',[0 0 0]);
    line(points, currLine,'LineWidth',1,'Color',[0 0 0]);
end
labels = {'V' 'SM' 'DA' 'VA' 'LM' 'FP' 'DF'};
set(gca,'XTick',ticks,'YTick',ticks,'XTickLabel',labels,'YTickLabel',labels);
saveas(gcf,[filename '_expandedCC.png']);
figure;
imagesc(CCs.meanCC);
set(gca,'XTick',1:7,'YTick',1:7,'XTickLabel',labels,'YTickLabel',labels);
colormap jet;
colorbar;
caxis([0.5 1]);
title([header ' Mean']);
saveas(gcf,[filename '_meanCC.png']);
end
