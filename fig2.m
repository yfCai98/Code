%% fig2.c
num = size(alldegree,1);
map = addcolorplus(89);
map1 = addcolorplus(24);
map_now =[[0.2353 1 0];addcolorplus(16);addcolorplus(112);]
ynamne = {'ACC rate','Hit rate','','FA num'};
figure
for c =1:2
hold on
errorbar(1:12,mean(alldata{c}),std(alldata{c})/sqrt(num),'s','Markersize',12,...
    'MarkerFaceColor',map_now(c,:),'MarkerEdgeColor',map_now(c,:),'LineWidth',2,'Color','k');
end  
ylim([0 1]);
set(gca,'FontSize',20,'YTick',0:0.2:1,'FontWeight','bold');
plot([0 14],[0.6 0.6],'r--','LineWidth',2);
ylabel('Probability','FontSize',25,'FontWeight','bold');

yyaxis right;
set(gca, 'YColor', 'k');
fatrial = alldata{3}.*repmat([2 8 11 12 13 14 14 14 14 14 14 14],num,1);
errorbar(1:12,mean(fatrial),std(fatrial)/sqrt(num),'s','Markersize',12,...
    'MarkerFaceColor',map_now(3,:),'MarkerEdgeColor',map_now(3,:),'LineWidth',2,'Color','k');
ylim([0 8]);
set(gca,'FontSize',20,'XTick',2:2:12,'FontWeight','bold');
xlabel('Block','FontSize',25,'FontWeight','bold');
ylabel('Trial num','FontSize',25,'FontWeight','bold');
xlim([0 13]);
set(gca,'Linewidth',2);
legend(ynamne,'FontSize',15,'box','off','location','best');
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);

%% fig2.d
num = size(alldegree,1);
map = addcolorplus(2);
map1 = addcolorplus(24);

figure
errorbar(1:4, mean(alldegree, 1), std(alldegree, 1) / sqrt(num), 's', 'Markersize', 12, ...
    'MarkerFaceColor', map, 'MarkerEdgeColor', map, 'LineWidth', 2, 'Color', 'k');
set(gca,'FontSize',20,'XTick',1:4,'XTickLabel',{'No Tone','25%','50%','75%'});
set(gca,'FontSize',20,'YTick',0:0.2:1);
set(gca,'Linewidth',2);
ylabel({'Probability','of Signal Chose'},'FontSize',25,'FontWeight','bold');
xlabel({'Intensity of Tone'},'FontSize',25,'FontWeight','bold');
xlim([0.5 4.5])
ylim([0 1])
set(gca,'Linewidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);
%% fig2.e
figure;
allnewconfidencenum = squeeze(round(mean(allnewconfidence,3),2));
imagesc(allnewconfidencenum,'CDataMapping','scaled');
for xii = 1:3
    for yii = 1:4
        text(yii-0.18,xii,num2str(allnewconfidencenum(xii,yii),'%.2f'),'FontSize',15);
    end
end
caxis([2.8, 3.8]);
colorbar
set(gca,'FontSize',20,'XTick',[1 2 3 4],'XTickLabel',{'0db','25%','50%','75%'});
set(gca,'FontSize',20,'YTick',[1 2 3],'YTickLabel',{'Yes','No','All'});
set(gca,'Linewidth',2);
ylabel('Chose','FontSize',20);
xlabel('Signal','FontSize',20);
set(gcf,'position',[0,0,600 400]);
colormap(addcolorplus(275));
set(gca,'Linewidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');

%% fig2.f
num = size(alldegree,1);
map = addcolorplus(2);
map1 = addcolorplus(24);

figure
conacc_mean = squeeze(mean(allconacc,1));
conacc_std = squeeze(std(allconacc,1));
errorbar(1:4,conacc_mean(:,2),conacc_std(:,2)/sqrt(num),'s','Markersize',12,...
    'MarkerFaceColor',map,'MarkerEdgeColor',map,'LineWidth',2,'Color','k');
set(gca,'FontSize',20,'XTick',1:4,'XTickLabel',{'1','2','3','4'},'FontWeight','bold');
set(gca, 'Linewidth', 2);
ylabel('ACC','FontSize',25,'FontWeight','bold');
xlabel('Confidence degree','FontSize',25 ,'FontWeight','bold');
xlim([0 5]);
ylim([0.2 0.9]);
yyaxis right;hold on;
plotallconacc = sum(allconacc(:,:,3),1);
plotallconacc1 = [ones(1,plotallconacc(1)),2*ones(1,plotallconacc(2)),3*ones(1,plotallconacc(3)),4*ones(1,plotallconacc(4))];
histogram(plotallconacc1)
ylabel('Num of Trial');
set(gca,'Linewidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);
%% fig2.g
num = size(alldegree,1);
map = addcolorplus(2);
map1 = addcolorplus(24);

figure
CH_con_mean = squeeze(mean(allCH_con,1));
CH_con_std = squeeze(std(allCH_con,1));
CH_con_all = sum(allCH_con(:,:,2),1);
plotCHconall = [ones(1,CH_con_all(1)),2*ones(1,CH_con_all(2)),3*ones(1,CH_con_all(3)),4*ones(1,CH_con_all(4))];
errorbar(1:4,CH_con_mean(:,2),CH_con_std(:,2)/sqrt(num),'s','Markersize',12,...
    'MarkerFaceColor',map,'MarkerEdgeColor',map,'LineWidth',2,'Color','k');
set(gca,'FontSize',20,'XTick',1:4,'XTickLabel',{'1','2','3','4'},'FontWeight','bold');
ylabel('Mean Trial of FA','FontSize',25,'FontWeight','bold');
xlabel('Confidence degree','FontSize',25 ,'FontWeight','bold');
ylim([0 20]);
yyaxis right;
histogram(plotCHconall)
xlim([0 5]);
ylabel('All Trial of FA');
set(gca,'Linewidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);
%% fig2.h
H_score = [0,0,5,0,1,6,1,4,9,5,0,4,0,3,1,0,7,8,0,0,0];
X = H_score;
Y = New_FArate(:,1)';

mdl = fitlm(X, Y);

xRange = linspace(min(X), max(X), 1000);
[yFit, yCI] = predict(mdl, xRange');

figure;
scatter(X, Y,'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 4);
hold on;
plot(xRange, yFit, '-k', 'LineWidth', 2.5);
set(gca,'FontSize',20,'XTick',1:9,'FontWeight','bold');

map = addcolorplus(2);
% 绘制置信区间
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

ylabel('Confident FA rate','FontSize',25,'FontWeight','bold');
xlabel('AH score','FontSize',25,'FontWeight','bold');
xlim([0 9]);
set(gca,'Linewidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);
%% fig2.h and i
H_score = [0,0,5,0,1,6,1,4,9,5,0,4,0,3,1,0,7,8,0,0,0];
X = H_score;
Y = (allthreshold(:,4)-allthreshold(:,2))./(allthreshold(:,4)+allthreshold(:,2));

mdl = fitlm(X, Y);
xRange = linspace(min(X), max(X), 1000);
[yFit, yCI] = predict(mdl, xRange');

figure;
scatter(X, Y,'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 4);
hold on;
plot(xRange, yFit, '-k', 'LineWidth', 2.5);
set(gca,'FontSize',20,'XTick',1:9,'FontWeight','bold');

map = addcolorplus(2);
% 绘制置信区间
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

ylabel('Threshold Sensitivity','FontSize',20,'FontWeight','bold');
xlabel('AH score','FontSize',25,'FontWeight','bold');
xlim([0 9]);
set(gca,'Linewidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);