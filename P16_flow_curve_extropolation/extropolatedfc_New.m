clear all
close all
clc

%% Fixed Parameters 0° H340
A = 714;
e = 0.0157;
n = 0.17077;
k = 358.7;
Q = 195.2;
b = 12.3;
a = 1;
%% Fixed Parameters 0° DP1000
A0 = 1734;
e0 = 0.000034;
n0 = 0.151;
k0 = 500;
Q0 = 591.3;
b0 = 151.9;
a0 = 0.6;
%% Flow curve H340
p_strain = 0:0.01:1;
flow_curve=zeros(size(p_strain,2),1);
for i = 1:size(p_strain,2)
    flow_curve(i)=a*A*(e+p_strain(i))^n+...
        (1-a)*(k+Q*(1-exp(-b*p_strain(i))));
end
%% Flow curve DP1000
p_strain0 = 0:0.01:1;
flow_curve0=zeros(size(p_strain,2),1);
for i = 1:size(p_strain,2)
    flow_curve0(i)=a0*A0*(e0+p_strain(i))^n0+...
        (1-a0)*(k0+Q0*(1-exp(-b0*p_strain0(i))));
end
%%
data = xlsread('test','HSV_00_a1','A3:B221');
m_1 = rmmissing(data(:,1:2)); %NaN entfernen
X_e1 = m_1(:,1);
Y_e1 = m_1(:,2);
range1 = 0.000001:0.00001:0.167;
i_e1=interp1(X_e1,Y_e1,range1);
y1 = (i_e1);

data = xlsread('DP1000_QS_aniso','HSV_00','A3:B380');
m_2 = rmmissing(data(:,1:2)); %NaN entfernen
X_e2 = m_2(:,1);
Y_e2 = m_2(:,2);
range2 = 0.000001:0.00001:0.09043;
i_e2=interp1(X_e2,Y_e2,range2);
y2 = (i_e2);
%% plot
figure('Name','Experimental and extrapolated flow curves')

plot(range1(10:1000:16700),y1(10:1000:16700),'b.','MarkerSize',10)
hold on
plot(p_strain,flow_curve,'b-','linewidth',1.5)
hold on
plot(range2(2:600:9000),y2(2:600:9000),'r.','MarkerSize',10)
hold on
plot(p_strain0,flow_curve0,'r-','linewidth',1.5)
hold on
annotation('textarrow',[0.349999999999999 0.314285714285714],...
    [0.661904761904763 0.726190476190478],'String',{'DP1000'},'FontSize',14);
xlabel('True plastic strain, -')
xlim([0 1])
xticks(0:0.2:1)
annotation('textarrow',[0.349999999999999 0.314285714285714],...
    [0.661904761904763 0.726190476190478],'String',{'DP1000'},'FontSize',14);
annotation('textarrow',[0.360714285714284 0.324999999999999],...
    [0.319047619047622 0.383333333333337],'String',{'H340'},'FontSize',14);
ylim([0 1600])
ylabel('True stress, MPa')
yticks(0:200:1600)
set(gca,'xcolor','k','ycolor','k','linewidth',1.5,'FontSize',14)
legend({'Exp.','Fit'},'location','southeast');
legend boxoff
print(gcf,'-dtiffn','Experimental and extrapolated flow curves')
%%