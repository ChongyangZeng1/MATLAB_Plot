clc
close all
clear 

% Load the data from a specific sheet and columns in an Excel file
filename = 'B-H340-Forces.xlsx';
sheetname = 'data';
range = 'A2:L1163'; % replace with the range for the x data
data = readtable(filename,'Sheet', sheetname, 'Range', range);

x=data{:,1}; % Extracts the first column of the table
y=data{:,2}; % Extracts the second column of the table

% Apply a moving average smoothing to the y data
smooth_y = smoothdata(y, 'movmean', 50);

% Compute the slope of the smoothed data
slope = diff(smooth_y)./diff(x);

% Plot the original and smoothed data on the left y-axis
figure
yyaxis left;
plot(x, y, 'k-','LineWidth',1.5);
hold on;
plot(x, smooth_y, 'r-','LineWidth',1.5);
ylabel('Strain, -');
set(gca,'ycolor','k')

% Plot the slope of the smoothed data on the right y-axis
yyaxis right;
plot(x(2:end), slope, 'b-','LineWidth',1.5);
ylim([0 0.4])
ylabel('Strain rate, 1/s');
set(gca,'ycolor','b')

% Add legend and axis labels
legend('Strain Original', 'Strain Smoothed', 'Strain rate','location','northwest');
set(gca,'linewidth',1.5,'FontSize',14)
legend boxoff 
xlabel('Time, s');
print(gcf,'-dtiffn','B1 strain rate')
