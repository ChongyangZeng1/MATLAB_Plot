clear all 
clc
close all
Sig00 = 335.4;
Sig15 = 335.1;
Sig30 = 338.1;
Sig45 = 343.2;
Sig65 = 349.1;
Sig75 = 356.1;
Sig90 = 359.4;
Sigb = 345;
%% plot 1
%% Von Mises
figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
syms x y % x=sigma1; y=sigma2
YF=sqrt((x^2+y^2+(x-y)^2)/2);
Mises = fcontour(YF,'b','LineWidth',1.5);
Mises.LevelList = Sig00;  % Initial Yield stress 

%% Hill48
F1 = (Sig00/Sig90)^2-1+(Sig00/Sigb)^2;
G1 = 1 - (Sig00/Sig90)^2+(Sig00/Sigb)^2;
H1 = 1+(Sig00/Sig90)^2-(Sig00/Sigb)^2;
YF=(G1+H1)*x^2+(F1+H1)*y^2-2*H1*x*y;
% F=0.9221; G=1.1051; H=0.8949;
% YF=(G+H)*x^2+(F+H)*y^2-2*H*x*y;
hold on
set(gca,'fontsize', 18)
Hill = fcontour(YF,'--r','LineWidth',1.5);
Hill.LevelList = [2.*Sig00^2];
% Hill.YRange = [-500,500];
% Hill.XRange = [-500,500];

%% Experimental
grid on
plot([0,Sig00,Sig45],[Sig90,0,Sig45],'ok','linewidth',1.5,'Marker','o','LineStyle','none')
% plot([0,408.7,405.3],[420.4,0,405.3],'og')
% plot([0,457.4,450.8],[468.7,0,450.8],'ob')
% plot([0,489.2,482.2],[500.4,0,482.2],'or')
% legend ('Hill 48','Experimental')
% legend ('von Mises','Hill 48','Hill 90','Experimental')
xlabel('$\sigma_{11}$, -','FontSize',14,'Color','k','interpreter','Latex')
xlim([-500 500])
xticks(-400:200:400)
ylim([-500 500])
yticks(-400:200:400)
ylabel('$\sigma_{22}$, -','FontSize',14,'Color','k','interpreter','Latex')

l = legend({'von Mises','Hill 48','Hill 90','Experimental'}...
    ,'location','southeast');

set(l,'interpreter','latex')
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
grid off
% print(gcf,'-dtiffn','Hill90_1')
%% plot 2