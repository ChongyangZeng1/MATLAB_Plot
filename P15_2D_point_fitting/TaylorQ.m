clear all
close all
clc

%% Load and clean data
data_t = xlsread('TaylorQ','heat','A2:B6');
x = data_t(:,1);
y = data_t(:,2);

%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( '0.9/2*(1+tanh(a*log10(x/b)))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [1 0];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

figure('defaultAxesColorOrder',[0 0 0; 0 0 1; 0 0 1; 0 0 1;])
x_p1=0.000001:0.000001:0.00001;
x_p2=0.00001:0.00001:0.0001;
x_p3=0.0001:0.0001:0.001;
x_p4=0.001:0.001:0.01;
x_p5=0.01:0.01:0.1;
x_p6=0.1:0.1:1;
x_p7=1:1:10;
x_p8=10:10:100;
x_p9=100:100:1000;
x_p10=1000:1000:10000;
x_p=[x_p1 x_p2 x_p3 x_p4 x_p5 x_p6 x_p7 x_p8 x_p9 x_p10];

set(gca,'XScale','log')

% x_p = 0.00001:1:1000;
y_p=(0.9/2*(1+tanh(fitresult.a*log10(x_p/fitresult.b))));
semilogx(x_p,y_p,'b','LineWidth',1.5)
hold on
plot(x,y,'.','MarkerEdgeColor','r','MarkerSize',25)

% xlim([0.00001 1000])
xlim([1e-05 10000]);
% xticks(0.00001:10:1000)
ylim([0 1])
yticks(0:0.2:1)
set(gca, 'XMinorTick', 'Off')
xlabel ('Strain rate,s^{-1}','FontSize',14,'Color','k')
ylabel('Taylor-Quinney coeffcient $\beta$,-','Interpreter','latex','FontSize',14,'Color','k')


legend({'Fit','Input'},'location','southeast');
legend boxoff

set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',13)
print(gcf,'-dtiffn','Taylor')

