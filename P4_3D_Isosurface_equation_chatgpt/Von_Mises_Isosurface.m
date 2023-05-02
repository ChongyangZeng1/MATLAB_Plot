clc
close all
clear
% Constants for the Hill 1948 plasticity model
% Sig00 = 1; % Yield stress in uniaxial tension along the rolling direction
% Sig90 = .9; % Yield stress in uniaxial tension along the transverse direction
% Sigb = 1.2; % Yield stress in uniaxial tension along the normal direction

Sig00 = 335.4;
Sig15 = 335.1;
Sig30 = 338.1;
Sig45 = 343.2;
Sig65 = 349.1;
Sig75 = 356.1;
Sig90 = 359.4;
Sigb = 345;
% Tau = 340;
% Tau = Tau/Sig00;
Tau = 1/sqrt(3);


Sig45 =Sig45/Sig00;
Sig90 =Sig90/Sig00;
Sigb =Sigb/Sig00;
Sig00 = 1;
% Calculate F1, G1, and H1 coefficients
F1 = (Sig00/Sig90)^2 - 1 + (Sig00/Sigb)^2;
% F1 = 1;
G1 = 1 - (Sig00/Sig90)^2 + (Sig00/Sigb)^2;
% G1 = 1;
H1 = 1 + (Sig00/Sig90)^2 - (Sig00/Sigb)^2;
% H1 = 1;
% N1 =  (4*(Sig00)^2)/(Sig45)^2 - ((Sig00)^2)/((Sigb)^2);
N1 = (4*(Sig00)^2)/(Sig45)^2 - ((Sig00)^2 - 1/sqrt(3)*Tau^2)/((Sigb)^2);
% N1 = (4*(Sig00)^2)/(Sig45)^2 - ((Sig00)^2 + Tau^2)/((Sigb)^2);
% N1 = 3;
% N1 = 0;
% Range of stress components
sigma1_range = linspace(-1.2, 1.2, 100);
sigma2_range = linspace(-1.2, 1.2, 100);
tau12_range = linspace(-1, 1, 100);

xlim([-1.2 1.2])
xticks(-1.2:0.4:1.2)
ylim([-1.2 1.2])
yticks(-1.2:0.4:1.2)
zlim([-1 1])
zticks(-1:0.5:1)

% Create a meshgrid for stress components
[sigma1, sigma2, tau12] = meshgrid(sigma1_range, sigma2_range, tau12_range);

% Calculate the von Mises yield criterion value for plane stress conditions (sigma3 = 0)
vonMises = sqrt(.5*((sigma1 - sigma2).^2 + sigma2.^2 + sigma1.^2) + 3 * tau12.^2);

% Create a 3D surface plot
% figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
% figure
isosurface_threshold = 1;
h2 = patch(isosurface(sigma1, sigma2, tau12, vonMises, isosurface_threshold));
% set(h2, 'FaceColor', 'b', 'EdgeColor', 'none', 'FaceAlpha', 0.3);
ctau12 = smooth3(rand(size(tau12)),'box',7);
isonormals(sigma1, sigma2, tau12,vonMises,h2)
isocolors(sigma1, sigma2, tau12,tau12,h2)
h2.FaceColor = 'interp';
h2.EdgeColor = 'none';
colorbar

% xlabel('Stress Component 1 (\sigma_{11})');
xlabel('\sigma_{11}','Rotation',20);
ylabel('\sigma_{22}','Rotation',-25);
zlabel('\tau_{12}');
% title('3D Surface Plot of Hill48 Plasticity Model and von Mises Yield Criterion under Plane Stress Conditions');
axis equal;
grid on;
view(3);
view(gca,[-17.3126110111832 41.1484221007721]);

% Experimental results from the pure shear test
SH_sigma1 = 0; % Replace with your experimental value
SH_sigma2 = 0; % Replace with your experimental value
SH_tau12 = Tau; % Replace with your experimental value
% Experimental results from the 0° tension
T0_sigma1 = Sig00; 
T0_sigma2 = 0; 
T0_tau12 = 0; 
% Experimental results from the 90°
T90_sigma1 = 0; 
T90_sigma2 = Sig90; 
T90_tau12 = 0;
% Experimental results from the Biaxial
Tb_sigma1 = Sigb; 
Tb_sigma2 = Sigb; 
Tb_tau12 = 0;
% Plot the experimental point on the 3D surface
hold on;
% plot3(SH_sigma1, SH_sigma2, SH_tau12, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot3(T0_sigma1, T0_sigma2, T0_tau12, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot3(T90_sigma1, T90_sigma2, T90_tau12, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot3(Tb_sigma1, Tb_sigma2, Tb_tau12, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

set(gca,'xcolor','k','ycolor','k','zcolor','k','linewidth',1.5,'FontSize',14,'GridColor',...
    [0 0 1])
% legend('Hill48 Yield Surface', 'von Mises Yield Surface', 'Experimental Result');
l = legend({'Von Mises','Experimental'}...
    ,'FontSize',12,'location','northeast');
% hold off;
legend boxoff
% grid off
print(gcf,'-dtiffn','Mises_3D_full')
view(gca,[10.945382295558 25.1705137306616]);
print(gcf,'-dtiffn','Mises_3D_full_2')
view(gca,[0.289609607886099 90]);
xlim([-1.5 1.5])
xticks(-1.5:0.5:1.5)
ylim([-1.5 1.5])
yticks(-1.5:0.5:1.5)
l = legend({'Von Mises','Experimental'}...
    ,'FontSize',12,'location','northeastoutside');
% hold off;

print(gcf,'-dtiffn','Mises_2D_full')