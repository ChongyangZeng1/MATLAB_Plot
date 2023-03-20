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
Tau = 330;


Sig45 =Sig45/Sig00;
Sig90 =Sig90/Sig00;
Sigb =Sigb/Sig00;
Tau = Tau/Sig00;
Sig00 = 1;
% Range of stress components
sigma1_range = linspace(0, 2, 100);
sigma2_range = linspace(-2, 2, 100);
tau12_range = linspace(0, 2, 100);

% Create a meshgrid for stress components
[x, y, tau12] = meshgrid(sigma1_range, sigma2_range, tau12_range);

% Calculate the Hill48 yield function value for plane stress conditions (sigma3 = 0)
m=2;
c=Sigb/Tau;
a = 0.25*((2*Sigb/Sig90)^m-(2*Sigb/Sig00)^m);
b = 0.5*((2*Sigb/Sig00)^m+(2*Sigb/Sig90)^m)-(2*Sigb/Sig45)^m;

hill90=(x+y).^m+((c).^m).*(x-y).^m+((x.^2+y.^2).^(0.5*m-1)).*(-2.*a.*(x.^2-y.^2)+b.*(x-y).^2);

% Find the surface where Hill48 yield function equals 1
isosurface_threshold = 1;

% Create a 3D surface plot
figure;
isosurface(sigma1, sigma2, tau12, hill90, isosurface_threshold);
xlabel('Stress Component 1 (\sigma_1)');
ylabel('Stress Component 2 (\sigma_2)');
zlabel('Shear Stress (\tau_{12})');
title('3D Surface Plot of Hill90 Plasticity Model under Plane Stress Conditions');
axis equal;
grid on;
view(3);