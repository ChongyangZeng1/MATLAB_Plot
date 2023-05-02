clear all
close all
clc
%% Load data
DCRT1 = xlsread('Auswertung DC04 RT.xlsx','007 DC04 20°C WR','A4:I1000');
DCRT2 = xlsread('Auswertung DC04 RT.xlsx','008 DC04 20°C WR','A4:I1000');
DCRT3 = xlsread('Auswertung DC04 RT.xlsx','009 DC04 20°C WR','A4:I1000');

DC1001 = xlsread('Auswertung DC04 100 Grad','015 100Grad DC04 WR','A4:I1000');
DC1002 = xlsread('Auswertung DC04 100 Grad','016 100Grad DC04 WR','A4:I1000');
DC1003 = xlsread('Auswertung DC04 100 Grad','017 100Grad DC04 WR','A4:I1000');

DC2001 = xlsread('Auswertung DC04 200Grad.xlsx','033 200Grad DC04 WR','A4:I1000');
DC2002 = xlsread('Auswertung DC04 200Grad.xlsx','034 200Grad DC04 WR','A4:I1000');
DC2003 = xlsread('Auswertung DC04 200Grad.xlsx','037 200Grad DC04 WR','A4:I1000');

DC2801 = xlsread('Auswertung DC04 280Grad.xlsx','043 280Grad DC04 WR','A4:I1000');
DC2802 = xlsread('Auswertung DC04 280Grad.xlsx','044 280Grad DC04 WR','A4:I1000');
DC2803 = xlsread('Auswertung DC04 280Grad.xlsx','046 280Grad DC04 WR','A4:I1000');

%% Plot
figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
plot(DCRT1(:,9),DCRT1(:,8),'k-','linewidth',1.5)
hold on
plot(DC1001(:,9),DC1001(:,8),'r-','linewidth',1.5)
hold on
plot(DC2001(:,9),DC2001(:,8),'b-','linewidth',1.5)
hold on
plot(DC2801(:,9),DC2801(:,8),'m-','linewidth',1.5)
hold on

plot(DCRT2(:,9),DCRT2(:,8),'k-','linewidth',1.5)
hold on
plot(DCRT3(:,9),DCRT3(:,8),'k-','linewidth',1.5)
hold on


plot(DC1002(:,9),DC1002(:,8),'r-','linewidth',1.5)
hold on
plot(DC1003(:,9),DC1003(:,8),'r-','linewidth',1.5)
hold on


plot(DC2002(:,9),DC2002(:,8),'b-','linewidth',1.5)
hold on
plot(DC2003(:,9),DC2003(:,8),'b-','linewidth',1.5)
hold on


plot(DC2802(:,9),DC2802(:,8),'m-','linewidth',1.5)
hold on
plot(DC2803(:,9),DC2803(:,8),'m-','linewidth',1.5)
hold on

%%
% title('True stress - true plastic strain - Temperature')
xlabel('True plastic strain, -','FontSize',14,'Color','k')
xlim([0 0.25])
xticks(0:0.05:0.25)
ylim([0 450])
yticks(0:50:450)
ylabel('True stress, MPa','FontSize',14,'Color','k')

l = legend({'DC04-0° RT','DC04-0° 100°C','DC04-0° 200°C','DC04-0° 280°C'}...
    ,'location','southeast');
set(l,'interpreter','latex')
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
print(gcf,'-dtiffn','DC04_0°_Temp_True')

%%

%% Plot
figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
plot(DCRT1(:,3),DCRT1(:,6),'k-','linewidth',1.5)
hold on
plot(DC1001(:,3),DC1001(:,6),'r-','linewidth',1.5)
hold on
plot(DC2001(:,3),DC2001(:,6),'b-','linewidth',1.5)
hold on
plot(DC2801(:,3),DC2801(:,6),'m-','linewidth',1.5)
hold on

plot(DCRT2(:,3),DCRT2(:,6),'k-','linewidth',1.5)
hold on
plot(DCRT3(:,3),DCRT3(:,6),'k-','linewidth',1.5)
hold on


plot(DC1002(:,3),DC1002(:,6),'r-','linewidth',1.5)
hold on
plot(DC1003(:,3),DC1003(:,6),'r-','linewidth',1.5)
hold on


plot(DC2002(:,3),DC2002(:,6),'b-','linewidth',1.5)
hold on
plot(DC2003(:,3),DC2003(:,6),'b-','linewidth',1.5)
hold on


plot(DC2802(:,3),DC2802(:,6),'m-','linewidth',1.5)
hold on
plot(DC2803(:,3),DC2803(:,6),'m-','linewidth',1.5)
hold on

%%
% title('True stress - true plastic strain - Temperature')
xlabel('Eng. strain, %','FontSize',14,'Color','k')
xlim([0 60])
xticks(0:10:60)
ylim([0 350])
yticks(0:50:350)
ylabel('Eng. stress, MPa','FontSize',14,'Color','k')

l = legend({'DC04-0° RT','DC04-0° 100°C','DC04-0° 200°C','DC04-0° 280°C'}...
    ,'location','southwest');
set(l,'interpreter','latex')
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
print(gcf,'-dtiffn','DC04_0°_Temp_Eng')
