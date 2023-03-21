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
Tau = 340;
Tau = Tau/Sig00;
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

% Range of stress components
sigma1_range = linspace(0, 2, 100);
sigma2_range = linspace(-2, 2, 100);
tau12_range = linspace(0, 2, 100);

% Create a meshgrid for stress components
[sigma1, sigma2, tau12] = meshgrid(sigma1_range, sigma2_range, tau12_range);

% Calculate the Hill48 yield function value for plane stress conditions (sigma3 = 0)
hill48 = (G1  * (sigma1.^2) + F1  * (sigma2.^2) +  H1 * (sigma1 - sigma2).^2)/2 + N1*(tau12.^2);

% Calculate the von Mises yield criterion value for plane stress conditions (sigma3 = 0)
vonMises = sqrt(.5*((sigma1 - sigma2).^2 + sigma2.^2 + sigma1.^2) + 3 * tau12.^2);

% Create a 3D surface plot
figure;
h1 = patch(isosurface(sigma1, sigma2, tau12, hill48, isosurface_threshold));
set(h1, 'FaceColor', 'b', 'EdgeColor', 'none', 'FaceAlpha', 0.3);
hold on;
h2 = patch(isosurface(sigma1, sigma2, tau12, vonMises, isosurface_threshold));
set(h2, 'FaceColor', 'r', 'EdgeColor', 'none', 'FaceAlpha', 0.3);

xlabel('Stress Component 1 (\sigma_1)');
ylabel('Stress Component 2 (\sigma_2)');
zlabel('Shear Stress (\tau_{12})');
title('3D Surface Plot of Hill48 Plasticity Model and von Mises Yield Criterion under Plane Stress Conditions');
axis equal;
grid on;
view(3);

% Experimental results from the pure shear test
experimental_sigma1 = 0; % Replace with your experimental value
experimental_sigma2 = 0; % Replace with your experimental value
experimental_tau12 = Tau; % Replace with your experimental value

% Plot the experimental point on the 3D surface
hold on;
plot3(experimental_sigma1, experimental_sigma2, experimental_tau12, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
legend('Hill48 Yield Surface', 'von Mises Yield Surface', 'Experimental Result');hold off;