clear  
clc
close all
%% true strain 0.05
Sig00 = 448;
Sig45 = 458;
Sig90 = 458;
Sigb = 480;

Sig45 = Sig45/Sig00;
Sig90 = Sig90/Sig00;
Sigb = Sigb/Sig00;
Sig00 = Sig00/Sig00;

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

hold on
set(gca,'fontsize', 18)
Hill = fcontour(YF,'--r','LineWidth',1.5);
Hill.LevelList = [2.*Sig00^2];

%% Experimental
grid on
plot([0,Sig00,Sigb],[Sig90,0,Sigb],'ok','linewidth',1.5,'Marker','o','LineStyle','none')

xlabel('$\sigma_{11}$, -','FontSize',14,'Color','k','interpreter','Latex')
xlim([-1.5 1.5])
xticks(-1.5:0.5:1.5)
ylim([-1.5 1.5])
yticks(-1.5:0.5:1.5)
ylabel('$\sigma_{22}$, -','FontSize',14,'Color','k','interpreter','Latex')

l = legend({'von Mises','Hill48','Experimental'}...
    ,'location','southeast');

set(l,'interpreter','latex')
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend boxoff
grid off
print(gcf,'-dtiffn','Hill48_1')
