%% plot
load('figcde.mat')
map = addcolorplus(2);
map_now =[[0.2353 1 0];addcolorplus(16);addcolorplus(112);]
mapnow2 = [addcolorplus(7);addcolorplus(3)];
num=8;

figure
subplot(1,3,1)
hold on
SignalChose_no = squeeze(SignalChose(:,1,:));
SignalChose_s = squeeze(SignalChose(:,2,:));
errorbar(1:4,mean(SignalChose_no,2)',std(SignalChose_no',1)/sqrt(num),'s-','Markersize',15,...
    'MarkerFaceColor',addcolorplus(252),'MarkerEdgeColor',addcolorplus(252),'LineWidth',2,'Color','k');
errorbar(1:4,mean(SignalChose_s,2)',std(SignalChose_s',1)/sqrt(num),'s-','Markersize',15,...
    'MarkerFaceColor',addcolorplus(23),'MarkerEdgeColor',addcolorplus(23),'LineWidth',2,'Color','k');
legend({'No Stimulus','Stimulus'},'FontSize',20,'Location','best','box','off');
set(gca,'FontSize',20,'XTick',1:4,'XTickLabel',{'0db','25%','50%','75%'});
set(gca,'Linewidth',2);
ylabel('Signal choice','FontName','arial','FontSize',25);
xlabel('Signal db','FontName','arial','FontSize',25);
set(gca,'FontName','Times New Roman','FontWeight','bold');
xlim([0 5]);

subplot(1,3,2);hold on;
Behavior2_nos = squeeze(nanmean(Behavior2_cov(:,1,:),2));
Behavior2_sti = squeeze(nanmean(Behavior2_cov(:,2,:),2));
xp = [1 2;4 5;7 8];
for pbi =1:3
    [h,p,ci,stats] = ttest(Behavior2_nos(pbi,:),Behavior2_sti(pbi,:), 'Tail', 'right');
    psave(pbi) = p;
    tsave(pbi) = stats.tstat;
    %polt
    meanplotdata = [mean(Behavior2_nos(pbi,:)) mean(Behavior2_sti(pbi,:))];
    stdplotdata = [std(Behavior2_nos(pbi,:)) std(Behavior2_sti(pbi,:))]/sqrt(num);
    for hi = 1:length(meanplotdata)
        h = bar(xp(pbi,hi),meanplotdata(hi),'FaceColor',mapnow2(hi,:));
    end
    x_a = xp(pbi,1) * ones(num,1) + 0.06 * randn(num,1); 
    x_b = xp(pbi,2) * ones(num,1) + 0.06 * randn(num,1); 
    scatter(x_a,Behavior2_nos(pbi,:)','MarkerEdgeColor',map_now(pbi,:));
    scatter(x_b,Behavior2_sti(pbi,:)','MarkerEdgeColor',map_now(pbi,:),'MarkerFaceColor',map_now(pbi,:));
    for ii = 1:length(x_a)
        plot([x_a(ii), x_b(ii)], [Behavior2_nos(pbi,ii),Behavior2_sti(pbi,ii)], '-k','LineWidth',1.5);
    end
end
ylabel('Rate','FontSize',25,'FontWeight','bold');
set(gca,'Linewidth',2);
set(gca,'FontSize',20,'XTick',[1.5 4.5 7.5],'FontWeight','bold');
set(gca,'FontSize',20,'XTick',[1.5 4.5 7.5],'XTickLabel',{'ACC rate','Hit rate','FA rate'});
xlim([0 9]);
set(gca,'FontName','Times New Roman','FontWeight','bold');

subplot(1,3,3);hold on;
FAchange = Behavior2_nos(3,:)-Behavior2_sti(3,:);
H_score = [7,0,5,3,6,4,1,2];
[Rraw PR] = corrper(H_score,FAchange,1000);

[coeff, S] = polyfit(H_score, FAchange, 1);
x_fit = linspace(0, 9, 100);
[fit_y_ci, delta] = polyval(coeff, x_fit, S); 

scatter(H_score, FAchange,'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 4);
plot(x_fit, fit_y_ci, '-k', 'LineWidth', 1.5);
ylabel('Decrease of FA Rate','FontSize',25,'FontWeight','bold');
xlabel('AH score','FontSize',25,'FontWeight','bold');
set(gca,'FontSize',20,'XTick',1:9,'FontWeight','bold');
set(gca,'FontName','Times New Roman','FontWeight','bold');
xlim([0 9]);
ylim([-0.15 0.2]);

set(gcf,'position',[0,0,2200 400]);
