clear all 
clc
close all

NDB = xlsread('Force_time_comp','NDB','A4:C500'); 
PS = xlsread('Force_time_comp','PS','A4:C500'); 
CH = xlsread('Force_time_comp','CHR','A4:C500'); 
SH = xlsread('Force_time_comp','SH','A4:C500'); 
%% plot 1
figure
plot(SH(:,1),SH(:,3),'b','LineWidth',1.5)
hold on
plot(SH(:,1),SH(:,2),'r','LineWidth',1.5)
hold on

xlabel('Time, ms')
xticks(0:0.1:0.6)
xlim([0 0.6])
ylabel('Force, kN')
yticks(0:1:7)
ylim([0 7])

l = legend({'Load cell','EMA'},'location','northwest');
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
hold on
annotation('textbox',[0.754999999999997 0.841904761904763 0.120000000000003 0.0599999999999999],...
    'String','@ SH',...
    'FontSize',12,'FitBoxToText','off','EdgeColor',[1 1 1]);
print(gcf,'-dtiffn','SH_10mps_force')

%% plot 2
figure
plot(CH(:,1),CH(:,3),'b','LineWidth',1.5)
hold on
plot(CH(:,1),CH(:,2),'r','LineWidth',1.5)
hold on

xlabel('Time, ms')
xticks(0:0.1:0.7)
xlim([0 0.7])
ylabel('Force, kN')
yticks(0:2:14)
ylim([0 14])

l = legend({'Load cell','EMA'},'location','northwest');
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
hold on
annotation('textbox',[0.710357142857142 0.834761904761905 0.1575 0.0599999999999999],...
    'String','@ CH-R3',...
    'FontSize',12,'FitBoxToText','off','EdgeColor',[1 1 1]);
print(gcf,'-dtiffn','CH-R3_10mps_force')
%% plot 3
figure
plot(NDB(:,1),NDB(:,3),'b','LineWidth',1.5)
hold on
plot(NDB(:,1),NDB(:,2),'r','LineWidth',1.5)
hold on

xlabel('Time, ms')
xticks(0:0.1:0.7)
xlim([0 0.7])
ylabel('Force, kN')
yticks(0:1:8)
ylim([0 8])

l = legend({'Load cell','EMA'},'location','northeast');
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
hold on
annotation('textbox',[0.146071428571428 0.851428571428572 0.28 0.0599999999999999],...
    'String','@ NDB-R8',...
    'FontSize',12,'FitBoxToText','off','EdgeColor',[1 1 1]);
print(gcf,'-dtiffn','NDB_10mps_force')
%% plot 4
figure
plot(PS(:,1),PS(:,3),'b','LineWidth',1.5)
hold on
plot(PS(:,1),PS(:,2),'r','LineWidth',1.5)
hold on

xlabel('Time, ms')
xticks(0:0.1:0.9)
xlim([0 0.9])
ylabel('Force, kN')
yticks(0:2:16)
ylim([0 16])

l = legend({'Load cell','EMA'},'location','northeast');
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
hold on
annotation('textbox',[0.149642857142856 0.846666666666668 0.28 0.0599999999999999],...
    'String','@ PS-R4',...
    'FontSize',12,'FitBoxToText','off','EdgeColor',[1 1 1]);
print(gcf,'-dtiffn','PS_10mps_force')