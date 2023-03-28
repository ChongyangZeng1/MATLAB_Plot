% This script is supposed to take two datasets with the same time base but
% different time increments and synchronize them, so that the coarser time
% dataset will be interpolated to match the finer one.

% Fine dataset (force_export)
x1 = Grad20230315A50QP11800001ps.Prfzeit; % Time basis for the first dataset
y1 = Grad20230315A50QP11800001ps.Standardkraft; % Data values for the first dataset

% Coarse dataset (aramis_export)
x2 = ps0GradRDQP1180.Zeits; % Time basis for the second dataset
y2{1} = ps0GradRDQP1180.Extensometer0001LYmm; % Data values for the second dataset
y2{2} = ps0GradRDQP1180.Flchenkomponente1epsXavgWahreDehnung;
y2{3} = ps0GradRDQP1180.Flchenkomponente1epsYavgWahreDehnung;
y2{4} = ps0GradRDQP1180.Flchenkomponente1epsYmaxWahreDehnung;

% Interpolate the second dataset onto the first dataset's time basis
y2_interp{1} = interp1(x2, y2{1}, x1, 'linear');
y2_interp{2} = interp1(x2, y2{2}, x1, 'linear');
y2_interp{3} = interp1(x2, y2{3}, x1, 'linear');
y2_interp{4} = interp1(x2, y2{4}, x1, 'linear');

% Create a comparison plot
figure;
hold on;

% Plot the first dataset
% plot(x1, y1, 'b-o', 'DisplayName', 'Dataset 1');

% Plot the second dataset (original)
plot(x2, y2{1}, 'r-o', 'DisplayName', 'Dataset 2-1 (Original)');
plot(x2, y2{2}, 'r-o', 'DisplayName', 'Dataset 2-2 (Original)');
plot(x2, y2{3}, 'r-o', 'DisplayName', 'Dataset 2-3 (Original)');
plot(x2, y2{4}, 'r-o', 'DisplayName', 'Dataset 2-4 (Original)');

% Plot the second dataset (interpolated)
plot(x1, y2_interp{1}, 'g-o', 'DisplayName', 'Dataset 2-1 (Interpolated)');
plot(x1, y2_interp{2}, 'g-o', 'DisplayName', 'Dataset 2-2 (Interpolated)');
plot(x1, y2_interp{3}, 'g-o', 'DisplayName', 'Dataset 2-3 (Interpolated)');
plot(x1, y2_interp{4}, 'g-o', 'DisplayName', 'Dataset 2-4 (Interpolated)');

% Customize the plot
xlabel('Time');
ylabel('Data Values');
title('Comparison of Original and Interpolated Datasets');
legend('show');
grid on;

hold off;

writematrix([x1,y2_interp{1},y2_interp{2},y2_interp{3},y2_interp{4}],'01_0Grad.csv')
