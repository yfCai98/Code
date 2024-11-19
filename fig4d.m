clear;clc;
load('fig4d.mat');

H_score = [0,0,5,0,1,6,1,4,9,5,0,4,0,3,1,0,7,8,0,0,0];

X = H_score; % H_score  or allCH
Y =  allnu; % allnu allbeta allomega  allseita

[mdl_clean,outidk] = fitlm_clean(X,Y);
idkin = ~ismember(1:length(H_score),outidk);
map = addcolorplus(2);
xRange = linspace(min(X(idkin)), max(X(idkin)), 100);
[yFit, yCI] = predict(mdl_clean, xRange');

figure;
scatter(X(idkin), Y(idkin),'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 5);
hold on;
plot(xRange, yFit, '-k', 'LineWidth', 2);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

xlim([0 max(X)]);
set(gca,'Linewidth',2);
set(gca,'FontSize',20,'FontWeight','bold');
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);