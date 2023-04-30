clear all 
clc
close all

A3_L = 58;% mm
v3 = 5172; % m/s
t3 = 2*A3_L/v3; %
f3 = 1/t3;
gamma3 = 2*f3*pi;

v2 = 1034; % m/s
A2_L = 37;
t2 = A2_L/v2; %
f2 = 1/t2;
gamma2 = 2*f2*pi;

figure
%%
A3=25;
A2=6.5;
A4=7.5;
alpha1=10;
alpha2=10;
n1=alpha1*A3/A2;
n2=alpha2*A3/A4;
f1=(1-n1)/(1+n1);
f2=(1-n2)/(1+n2);
% fr=0.1274;
for i=1:1:38
    if i==1
        x = 0:0.0001:0.02;
        y(1:numel(x)) = 1;
        % 0.02 ms stress wave in Beam 1
        plot(x,y,'k','LineWidth',1.5), grid on  
        hold on
    else
        if i==2
            fr=0.1319;
            x = 0.02:0.0001:0.0504;
            y(1:numel(x)) = fr;
        plot(x,y,'r','LineWidth',1.5), grid on  
        hold on
        fr=0.1274;
        end
    end
    if i>=3
        x = (i-3)*t3/2+0.0056+0.0448:0.0001:i*t3/2+0.0448;
        y = fr*sin(gamma3*x);
         if rem(i,2)==0
            fr=-f1*fr;
         else
            fr=-f2*fr;
         end
        plot(x,y,'g','LineWidth',1.5), grid on  
        hold on
    end 
end
plot([0.02 0.02], [1 0.1319],'k--','LineWidth',1.5)
hold on 
%%
xlabel('Time, ms')
xticks(0:0.1:0.5)
xlim([0 0.5])
ylabel('Normalized stress wave')
yticks(-1:0.2:1)
ylim([-1.1 1.1])
legend off
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
hold on
annotation('textarrow',[0.244642857142857 0.178571428571428],...
    [0.838095238095238 0.875190476190478],'String',...
    {['Stress wave amplitude in Beam 1']},'FontSize',13);
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14,...
    'GridLineStyle','none')
annotation('textarrow',[0.273214285714285 0.194642857142856],...
    [0.666666666666668 0.608523809523814],'Color',[1 0 0],'String',...
    {'Stress wave amplitude in Beam 2'},...
    'FontSize',13);
annotation('textarrow',[0.283928571428571 0.237499999999998],...
    [0.380952380952381 0.449000000000005],'Color',[0 1 0],'String',...
    {'Stress wave in Beam 3'},...
    'FontSize',13);
annotation('textbox',...
    [0.715285714285713 0.185714285714287 0.152571428571429 0.0761904761904794],...
    'String','@ H340',...
    'FontSize',13,...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
print(gcf,'-dtiffn','Stress_wave_new')