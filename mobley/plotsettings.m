function plotsettings(p,color)
ax=gca;
ax.LineWidth=1;
% ax.XTickLabelMode='manual';
% ax.YTickLabelMode='manual';
ax.Box='on';
set(gca,'fontsize',28);
%ax.XLim=ax.YLim;
%ax.XTick=ax.YTick;
ax.PlotBoxAspectRatio=[1,1,1];
fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 1 1];
p.LineWidth = 0.6;
p.MarkerEdgeColor = color;
%p.MarkerFaceColor = color;
p.MarkerSize=10;


