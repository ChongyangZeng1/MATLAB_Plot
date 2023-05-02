clear all
clc
close all
%%
% X1 = xlsread('Stress_states','stress_state_QS','A3:A120');
% Y1 = xlsread('Stress_states','stress_state_QS','B3:B120');
% Z1 = xlsread('Stress_states','stress_state_QS','C3:C120');

X1 = xlsread('Stress_states','SH','A3:A120');
Y1 = xlsread('Stress_states','SH','B3:B120');
Z1 = xlsread('Stress_states','SH','C3:C120');

X2 = xlsread('Stress_states','stress_state_QS','D3:D120');
Y2 = xlsread('Stress_states','stress_state_QS','E3:E120');
Z2 = xlsread('Stress_states','stress_state_QS','F3:F120');

X3 = xlsread('Stress_states','stress_state_QS','G3:G120');
Y3 = xlsread('Stress_states','stress_state_QS','H3:H120');
Z3 = xlsread('Stress_states','stress_state_QS','I3:I120');

X4 = xlsread('Stress_states','stress_state_QS','J3:J120');
Y4 = xlsread('Stress_states','stress_state_QS','K3:K120');
Z4 = xlsread('Stress_states','stress_state_QS','L3:L120');

figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
plot3(X1,Y1,Z1,'k','LineWidth', 1.5)
hold on
plot3(X2,Y2,Z2,'r','LineWidth', 1.5)
hold on
plot3(X3,Y3,Z3,'b','LineWidth', 1.5)
hold on
plot3(X4,Y4,Z4,'m','LineWidth', 1.5)
hold on

shading interp;
xlabel('Stress triaxiality,-','FontSize',13,'Color','k','Rotation',-2);
ylabel('Lode angle para.,-','FontSize',13,'Color','k','Rotation',45);
zlabel('Effective plastic strain,-','FontSize',13,'Color','k')
xlim([-0.2 0.8])
ylim([-0.2 1])
zlim([0 0.8])
xticks(-0.2:0.2:0.8)
yticks(-0.2:0.4:1)
zticks(0:0.2:0.8)

view([-344.099999706288 13.8584071272496]);
l = legend({'SH','CH-R3','NDB-R8','PS-R4'}...
    ,'Position',[0.772410715855656 0.668252477117781 0.196428568288684 0.203571422894796]);
legend boxoff
grid('on');
set(gca,'FontSize',13,'LineWidth',1,'GridColor',[0 0 1],...
    'MinorGridLineStyle','-','XColor',[0 0 0],'YColor',[0 0 0],'ZColor',[0 0 0],...
    'Position',[0.13 0.121902969135358 0.619642857142851 0.803097030864642]);

set(gca, 'YMinorGrid','off')
set(gca, 'YMinorTick', 'Off')
print(gcf,'-dtiffn','stress-state')