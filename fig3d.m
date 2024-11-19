data1 = covFAonset*10;
data2 = covHitonset*10;

FAidk = abs(data1 - nanmean(data1)) <= 2 * nanstd(data1);
FAnow = data1(FAidk);
Hitidk = abs(data2 - nanmean(data2)) <= 2 * nanstd(data2);
Hitnow = data2(Hitidk);
cond1 = ones(length(FAnow),1);
cond2 = 2*ones(length(Hitnow),1);

[Tsave,Psave,lmeModel_now] = LMEquick(FAnow',Hitnow',cond1,cond2,suball(FAidk),suball(Hitidk),contactall(FAidk),contactall(Hitidk));
color_matrix= [addcolorplus(112);addcolorplus(1);addcolorplus(16);addcolorplus(2)];

figure
onsetFA = mean(FAnow)
onsetFAstd = std(FAnow)/sqrt(length(FAnow));
onsetHit = mean(Hitnow)
onsetHitstd = std(Hitnow)/sqrt(length(Hitnow));

hold on
y=[onsetHit,onsetFA];
errory = [onsetHitstd,onsetFAstd];
h = bar(y,'FaceColor',addcolorplus(4));
for errori = 1:size(y,2)
if y(errori)>0
errorbar(errori, y(errori), [], errory(errori),'.k','LineWidth',1.5,'CapSize',25);
else    
errorbar(errori, y(errori), errory(errori),[], '.k','LineWidth',1.5,'CapSize',25);
end 
end
scatter(ones(length(Hitnow),1),Hitnow,'MarkerEdgeColor',color_matrix(1,:));
scatter(2*ones(length(FAnow),1),FAnow,'MarkerEdgeColor',color_matrix(3,:));
set(gca,'FontSize',20,'XTick',1:2,'XTickLabel',{'Hit','FA'});
xlim([0 3]);
xlabel('Condition','FontSize',25);
ylabel('Onset Time(ms)','FontSize',25);
set(gca, 'Linewidth', 2);
ylim([0 1000])
set(gca,'FontName','Times New Roman','FontWeight','bold');

set(gcf,'position',[0,0,1000 800]);
