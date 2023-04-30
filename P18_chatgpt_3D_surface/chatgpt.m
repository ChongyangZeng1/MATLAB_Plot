clc 
close all
clear
% Define the range of x and y values
[x,y] = meshgrid(-5:0.1:5,-5:0.1:5);

% Calculate the corresponding z values
z = sin(sqrt(x.^2 + y.^2))./sqrt(x.^2 + y.^2);

% Plot the 3D surface
surf(x,y,z,'FaceColor','interp','EdgeColor','none');
colormap('jet');
colorbar;

% Set the labels for the x, y, and z axes
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z');
set(gca,'xcolor','black','ycolor','black');

% Add a title to the plot
title('3D Surface Plot of z = sin(sqrt(x^2 + y^2))/sqrt(x^2 + y^2)');

% Add a legend
legend('FLB');
set(legend,...
    'Position',[0.353539203364994 0.860714287062487 0.412499990420682 0.0547619034137045]);

print(gcf,'-dtiffn','FLB')
