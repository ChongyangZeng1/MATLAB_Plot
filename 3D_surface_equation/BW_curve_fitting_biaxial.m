clc
close all
clear all
%%
c1=1.98;
c2=0.51;
c3=1.71;
c4=0.51;
c5=1.49;
c6=0.92;

%exp
x_data2 = xlsread('Failure_strain2','stress_states','A2:C7');
Triaxiality = rmmissing(x_data2(:,1));
Lode_angle = rmmissing(x_data2(:,2));
Failure_strain = rmmissing(x_data2(:,3));

[x,y]= meshgrid(-0.3:0.001:1,-1:0.001:1);
z = ((c1.*(exp(-c2.*x))+c5.*(exp(-c6.*x)))./2-c3.*(exp(-c4.*x))).*y.^2+...
    ((c1.*(exp(-c2.*x))-c5.*(exp(-c6.*x)))/2).*y + c3.*exp(-c4.*x);

figure
% surf(x,y,z);
surf(x,y,z,'EdgeColor','none');
colormap('jet');


x1 = xlabel('Stress Triaxiality, -');
y1 = ylabel('Lode angle para., - ');
zlabel('Effective plastic strain, -')

set(x1,'Rotation',-7);
set(y1,'Rotation',40);

xlim([0 1])
ylim([-1 1])
zlim([0.5 2.5])

xticks(0:0.2:1)
yticks(-1:0.4:1)
zticks(0:0.5:2.5)

hold on
set(gca,'ColorScale','log','xcolor','k','ycolor','k','zcolor','k','linewidth',1,'FontSize',14)
hold on
% Failure_strain(2)=1.02*Failure_strain(2);
% Failure_strain(4)=1.1*Failure_strain(4);
for i=1:1:6
plot3(Triaxiality(i),Lode_angle(i),Failure_strain(i),'MarkerFaceColor','k',...
    'Color','k','MarkerSize',6,...
    'Marker','diamond',...
    'LineStyle','none');
end
view(gca,[28.6502507647699 35.8403363446238]);
print(gcf,'-dtiffn','B-W-biaxial.tif')
