clear all 
clc
close all

x1 = xlsread('Faliure strain','new','I38:P41');
X1_e1 = x1(:,1);
Y1_e1 = x1(:,2);
X1_e2 = x1(:,3);
Y1_e2 = x1(:,4);
X1_e3 = x1(:,5);
Y1_e3 = x1(:,6);
X1_e4 = x1(:,7);
Y1_e4 = x1(:,8);

%%
figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
plot(X1_e1, Y1_e1,'k.','LineWidth',15,'MarkerSize',25) 
hold on
% plot(X_e2, Y_e2,'b.','LineWidth',15,'MarkerSize',20)
hold on
plot(X1_e2, Y1_e2,'MarkerFaceColor',[1 0 0],...
    'Marker','diamond',...
    'LineWidth',1,...
    'LineStyle','none',...
    'Color',[1 0 0]);
hold on
% plot(X_e3, Y_e3,'g.','LineWidth',15,'MarkerSize',20)
plot(X1_e3, Y1_e3,'MarkerSize',7,'Marker','o',...
    'LineWidth',1,...
    'LineStyle','none',...
    'Color','b');
hold on
% plot(X_e4, Y_e4,'r.','LineWidth',15,'MarkerSize',20)
plot(X1_e4, Y1_e4,'MarkerFaceColor',[0 1 0],...
    'MarkerSize',7,...
    'Marker','square',...
    'LineWidth',1,...
    'LineStyle','none',...
    'Color','g');
hold on

xlabel('Average strain rate, 1/s')
% xticks(0.0001:10:10000)
% xlim([0.0001 10000])
% yyaxis left
ylabel('Surface fracture strain (DIC), -')
yticks(0.2:0.2:1.4)
ylim([0.2 1.4])
set(gca,'XScale','log')
h = legend('SH ','CH-R3','NDB-R8','PS-R4',...
    'FontSize',11,'linewidth',1.,'location','southwest');
% l = legend({'Exp.','Sim. eMBW','Damage initiation'},'location','southeast');
% l = legend({'Exp','Sim. GISSMO'},'location','southeast');
l.ItemTokenSize = [20,20];
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff 
grid(gca,'minor')
set(gca, 'XMinorTick','off', 'XMinorGrid','off')
set(gca, 'YMinorTick','off', 'YMinorGrid','off')
print(gcf,'-dtiffn','failue locus-DIC')
%% plot 2
x2 = xlsread('Faliure strain','new','I46:P49');
X2_e1 = x2(:,1);
Y2_e1 = x2(:,2);
X2_e2 = x2(:,3);
Y2_e2 = x2(:,4);
X2_e3 = x2(:,5);
Y2_e3 = x2(:,6);
X2_e4 = x2(:,7);
Y2_e4 = x2(:,8);

X2_s1 = 0 : 1: 15;
Y2_s1 = -0.0085.*X2_s1+1;

X2_s2 = 0 : 1: 15;
Y2_s2 = -0.0005.*X2_s2+1;

X2_s3 = 0 : 1: 15;
Y2_s3 = 0.0009.*X2_s3+1;

X2_s4 = 0 : 1: 15;
Y2_s4 = -0.0167.*X2_s4+1;

figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])

plot(X2_e1, Y2_e1,'k.','LineWidth',15,'MarkerSize',25) 
hold on
% plot(X_e2, Y_e2,'b.','LineWidth',15,'MarkerSize',20)
hold on
plot(X2_e2, Y2_e2,'MarkerFaceColor',[1 0 0],...
    'Marker','diamond',...
    'LineWidth',1,...
    'LineStyle','none',...
    'Color',[1 0 0]);
hold on
% plot(X_e3, Y_e3,'g.','LineWidth',15,'MarkerSize',20)
plot(X2_e3, Y2_e3,'MarkerSize',7,'Marker','o',...
    'LineWidth',1,...
    'LineStyle','none',...
    'Color',['b' ...
    '']);
hold on
% plot(X_e4, Y_e4,'r.','LineWidth',15,'MarkerSize',20)
plot(X2_e4, Y2_e4,'MarkerFaceColor',[0 1 0],...
    'MarkerSize',7,...
    'Marker','square',...
    'LineWidth',1,...
    'LineStyle','none',...
    'Color','g');
hold on
plot(X2_s1, Y2_s1,'k-','LineWidth',1.5) 
hold on
plot(X2_s2, Y2_s2,'r-','LineWidth',1.5) 
hold on
plot(X2_s3, Y2_s3,'b-','LineWidth',1.5) 
hold on
plot(X2_s4, Y2_s4,'g-','LineWidth',1.5) 

hold on
xlabel('$ln(\bar{\dot{\varepsilon}}_p/\dot{\varepsilon}_0)$, -',...
    'FontSize',18,'interpreter','latex')

xticks(0:2:16)
xlim([0 16])
% yyaxis left
ylabel('Normalized fracture strain, -')
yticks(0.6:0.1:1.2)
ylim([0.6 1.2])

h = legend('SH Exp.','CH-R3 Exp.','NDB-R8 Exp.','PS-R4 Exp.',...
    'SH Fit','CH-R3 Fit','NDB-R8 Fit','PS-R4 Fit',...
    'FontSize',11,'linewidth',1.,'location','southwest');
% l = legend({'Exp.','Sim. eMBW','Damage initiation'},'location','southeast');
% l = legend({'Exp','Sim. GISSMO'},'location','southeast');
l.ItemTokenSize = [20,20];
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff 
grid(gca,'minor')
set(gca, 'XMinorTick','off', 'XMinorGrid','off')
set(gca, 'YMinorTick','off', 'YMinorGrid','off')
print(gcf,'-dtiffn','failue locus-fit')