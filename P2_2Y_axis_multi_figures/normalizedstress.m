clear all 
clc
close all
%% 
x1 = xlsread('Diagramme_alpha(t)_richtige Länge','Diagramm_1000','B3:M30'); %Einlesen der Daten

X1 = x1(:,1);
Y1 = x1(:,2);

X2 = x1(:,3);
Y2 = x1(:,4);

X3 = x1(:,5);
Y3 = x1(:,6);

X4 = x1(:,7);
Y4 = x1(:,8);

X5 = x1(:,9);
Y5 = x1(:,10);

X6 = x1(:,11);
Y6 = x1(:,12);

%% plot force-time 1-5
figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
plot(X6,Y6,'-k.','MarkerSize',20,'Color',[0 0 1]','linewidth',1.5)  
hold on
plot(X3,Y3,'-k.','MarkerSize',20,'Color',[1 0 0]','linewidth',1.5)  
hold on


yyaxis right
plot(X4,Y4,'-o','MarkerSize',5,'Color',[0.07 0.62 1],'linewidth',1.5) 
hold on
plot(X5,Y5,'-o','MarkerSize',5,'Color',[0 1 0]','linewidth',1.5) 
hold on
plot(X1,Y1,'--d','MarkerSize',5,'Color',[1 0 1],'linewidth',1.5) 
hold on
plot(X2,Y2,'--d','MarkerSize',5,'Color',[0 0 0]','linewidth',1.5) 
hold on

yyaxis left
ylabel('Normalized stress [-]')
yticks(0:0.1:1)
ylim([0 1])

yyaxis right
ylabel('Alpha [-]')
ylim([0 30])
yticks(0:5:30)

% title('Experimental and extrapolated flow curves')
xlabel('Time [ms]','FontSize',14)
xticks(0:0.05:0.3)
xlim([0 0.3])

% yyaxis left

% l = legend({'Exp.','Swift law','Voce law','S-V.-alpha=0.7', 'S-V.-alpha=0.8','S-V.-alpha=0.9'},'location','southeast');
l = legend({'Stress-DC04 Gen.III Geometry','Stress-DP600 Gen.III Geometry',...
    '\alpha_{2} DC04','\alpha_{4} DC04','\alpha_{2} DP600','\alpha_{4} DP600'},'FontSize',10,'location','Northwest');
l.ItemTokenSize = [20,20];
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff 

print(gcf,'-dtiffn','normalized-stress.tif')
 