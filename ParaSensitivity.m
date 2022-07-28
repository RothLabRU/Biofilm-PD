clear all; close all; clc;
Alpha = 0.000548558104084461;
Beta = 0.102091303526455;
Kt = 0.389470749286536;
U = 0.0432364436087371;	
N = 3.41318493596074;
p = [1.3714e-04   Beta    Kt    U    N];
p2 =[2.7428e-04    Beta    Kt    U    N];
p3 =[Alpha    Beta    Kt    U    N];
p4 =[0.0011    Beta    Kt    U    N];
p5 =[0.0022    Beta    Kt    U    N];
data2 = xlsread ('TOB20_continuous_new.xlsx');
X1 = data2 (:,1);
Y1 = data2 (:,2);

[t,y] = ode45(@(t,y)Musken_Trial(t,y,p,20),X1,[0.81 0 0 0 0]);
[t2,y2] = ode45(@(t,y)Musken_Trial(t,y,p2,20),X1,[0.81 0 0 0 0]);
[t3,y3] = ode45(@(t,y)Musken_Trial(t,y,p3,20),X1,[0.81 0 0 0 0]);
[t4,y4] = ode45(@(t,y)Musken_Trial(t,y,p4,20),X1,[0.81 0 0 0 0]);
[t5,y5] = ode45(@(t,y)Musken_Trial(t,y,p5,20),X1,[0.81 0 0 0 0]);

subplot (3,2,1)

hold on
plot(t,y(:,5), 'g','LineWidth', 2.0)
hold on
plot(t2,y2(:,5), 'b','LineWidth', 2.0)
plot(t3,y3(:,5), 'k','LineWidth', 2.0)
plot(t5,y5(:,5), 'r','LineWidth', 2.0)
plot(t4,y4(:,5), 'color', [ 0.9100 0.4900 0.9700],'LineWidth', 2.0)
title('\alpha Sensitivity', 'FontSize', 13) 
xlabel ('\it\bf{TIME (HOURS)}', 'FontSize', 13)
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 1])
ax= gca; 
ax.FontSize = 13;
legend('\alpha = 1.37e-04', '\alpha = 2.74e-04', '\alpha = \alpha',...
'\alpha = 0.001','\alpha = 0.002', 'FontSize', 15)
legend('Location','northwest')
set(gca,'FontSize',15)
%-----------------------------------------------------
bp1 =[Alpha    0.0255    Kt    U    N];
bp2 =[Alpha    0.0510    Kt    U    N];
bp3 =[Alpha    Beta    Kt    U    N];
bp4 =[Alpha    0.2042    Kt    U    N];
bp5 =[Alpha    0.4084    Kt    U    N];

[bt,by] = ode45(@(t,y)Musken_Trial(t,y,bp1,20),X1,[0.81 0 0 0 0]);
[bt2,by2] = ode45(@(t,y)Musken_Trial(t,y,bp2,20),X1,[0.81 0 0 0 0]);
[bt3,by3] = ode45(@(t,y)Musken_Trial(t,y,bp3,20),X1,[0.81 0 0 0 0]);
[bt4,by4] = ode45(@(t,y)Musken_Trial(t,y,bp4,20),X1,[0.81 0 0 0 0]);
[bt5,by5] = ode45(@(t,y)Musken_Trial(t,y,bp5,20),X1,[0.81 0 0 0 0]);

subplot (3,2,2)
hold on
plot(bt,by(:,5), 'g','LineWidth', 2.0)
hold on
plot(bt2,by2(:,5), 'b','LineWidth', 2.0)
plot(bt3,by3(:,5), 'k','LineWidth', 2.0)
plot(bt4,by4(:,5), 'color', [ 0.9100 0.4900 0.9700],'LineWidth', 2.0)
plot(bt5,by5(:,5), 'r','LineWidth', 2.0)
title('\beta Sensitivity', 'FontSize', 13) 
xlabel ('\it\bf{TIME (HOURS)}', 'FontSize', 13)
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 1]);
ax= gca; 
ax.FontSize = 13;
legend ('\beta = 0.03','\beta = 0.05','\beta = \beta',...
    '\beta = 0.20','\beta = 0.41', 'FontSize', 15)
legend('Location','northwest')
set(gca,'FontSize',15)
%------------------------------------
ktp1 =[Alpha    Beta    0.0974    U    N];
ktp2 =[Alpha    Beta    0.1947    U    N];
ktp3 =[Alpha    Beta    Kt    U    N];
ktp4 =[Alpha    Beta    0.7789    U    N];
ktp5 =[Alpha    Beta    1.5578   U    N];

[ktt,kty] = ode45(@(t,y)Musken_Trial(t,y,ktp1,20),X1,[0.81 0 0 0 0]);
[ktt2,kty2] = ode45(@(t,y)Musken_Trial(t,y,ktp2,20),X1,[0.81 0 0 0 0]);
[ktt3,kty3] = ode45(@(t,y)Musken_Trial(t,y,ktp3,20),X1,[0.81 0 0 0 0]);
[ktt4,kty4] = ode45(@(t,y)Musken_Trial(t,y,ktp4,20),X1,[0.81 0 0 0 0]);
[ktt5,kty5] = ode45(@(t,y)Musken_Trial(t,y,ktp5,20),X1,[0.81 0 0 0 0]);

subplot (3,2,[5.5,5.6])

hold on
plot(ktt,kty(:,5), 'g','LineWidth', 2.0)
hold on
plot(ktt2,kty2(:,5), 'b','LineWidth', 2.0)
plot(ktt3,kty3(:,5), 'k','LineWidth', 2.0)
plot(ktt4,kty4(:,5), 'color', [ 0.9100 0.4900 0.9700],'LineWidth', 2.0)
plot(ktt5,kty5(:,5), 'r','LineWidth', 2.0)
title('k_{t} Sensitivity', 'FontSize', 13) 
xlabel ('\it\bf{TIME (HOURS)}', 'FontSize', 13)
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 0.9]);
ylim([0 1])
ax= gca; 
ax.FontSize = 13;
legend ('k_{t}  = 0.09','k_{t}  = 0.19','k_{t}  = k_{t}',...
    'k_{t}  = 0.78','k_{t}  = 1.56', 'FontSize', 15)
legend('Location','northwest')
set(gca,'FontSize',15)
%------------------------------------------
up1 =[Alpha    Beta    Kt    0.0108    N];
up2 =[Alpha    Beta    Kt    0.0216    N];
up3 =[Alpha    Beta    Kt    U    N];
up4 =[Alpha    Beta    Kt    0.0865    N];
up5 =[Alpha    Beta    Kt   0.1730    N];

[ut,uy] = ode45(@(t,y)Musken_Trial(t,y,up1,20),X1,[0.81 0 0 0 0]);
[ut2,uy2] = ode45(@(t,y)Musken_Trial(t,y,up2,20),X1,[0.81 0 0 0 0]);
[ut3,uy3] = ode45(@(t,y)Musken_Trial(t,y,up3,20),X1,[0.81 0 0 0 0]);
[ut4,uy4] = ode45(@(t,y)Musken_Trial(t,y,up4,20),X1,[0.81 0 0 0 0]);
[ut5,uy5] = ode45(@(t,y)Musken_Trial(t,y,up5,20),X1,[0.81 0 0 0 0]);

subplot (3,2,4)

hold on
plot(ut,uy(:,5), 'g','LineWidth', 2.0)
hold on
plot(ut2,uy2(:,5), 'b','LineWidth', 2.0)
plot(ut3,uy3(:,5), 'k','LineWidth', 2.0)
plot(ut4,uy4(:,5), 'color', [ 0.9100 0.4900 0.9700],'LineWidth', 2.0)
plot(ut5,uy5(:,5), 'r','LineWidth', 2.0)
title('\mu Sensitivity', 'FontSize', 13) 
xlabel ('\it\bf{TIME (HOURS)}', 'FontSize', 13)
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 1])
ax= gca; 
ax.FontSize = 13;
legend ('\mu = 0.01','\mu = 0.02','\mu = \mu','\mu = 0.09',...
    '\mu = 0.17', 'FontSize', 15)
legend('Location','northwest')
set(gca,'FontSize',15)
%-------------------------------------------
np1 =[Alpha    Beta    Kt    U    0.8533];
np2 =[Alpha    Beta    Kt    U    1.7066];
np3 =[Alpha    Beta    Kt    U    N];
np4 =[Alpha    Beta    Kt    U    6.8264];
np5 =[Alpha    Beta    Kt    U    13.6528];

[nt,ny] = ode45(@(t,y)Musken_Trial(t,y,np1,20),X1,[0.81 0 0 0 0]);
[nt2,ny2] = ode45(@(t,y)Musken_Trial(t,y,np2,20),X1,[0.81 0 0 0 0]);
[nt3,ny3] = ode45(@(t,y)Musken_Trial(t,y,np3,20),X1,[0.81 0 0 0 0]);
[nt4,ny4] = ode45(@(t,y)Musken_Trial(t,y,np4,20),X1,[0.81 0 0 0 0]);
[nt5,ny5] = ode15s(@(t,y)Musken_Trial(t,y,np5,20),X1,[0.81 0 0 0 0]);

subplot (3,2,3)

hold on
plot(nt,ny(:,5), 'g','LineWidth', 2.0)
hold on
plot(nt2,ny2(:,5), 'b','LineWidth', 2.0)
plot(nt3,ny3(:,5), 'k','LineWidth', 2.0)
plot(nt4,ny4(:,5), 'color', [ 0.9100 0.4900 0.9700],'LineWidth', 2.0)
plot(nt5,ny5(:,5), 'r','LineWidth', 2.0)
title('\gamma Sensitivity', 'FontSize', 13) 
xlabel ('\it\bf{TIME (HOURS)}', 'FontSize', 13)
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 1])
ax= gca; 
ax.FontSize = 13;
legend ('\gamma = 0.85','\gamma = 1.71','\gamma = \gamma',...
'\gamma = 6.83','\gamma = 13.65', 'FontSize', 15)
legend('Location','northwest')
set(gca,'FontSize',15)