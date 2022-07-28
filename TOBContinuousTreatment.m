clear all; close all; clc;
p = [0.000233746024352377	0.208841073242835	0.542390776209201...
    0.0321211446037937	3.53300315046790];
data1 = xlsread ('TOB5_continuous_new.xlsx');
X1 = data1 (:,1);
Y1 = data1 (:,2);
scatter (X1,Y1)
[t1,y1] = ode45(@(t,y)Musken_5Comp(t,y,p,5),X1,[0.81 0 0 0 0 0 0]);
subplot(1,3,1);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
title('TOB 5 \mug/mL Continuous Treatment', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 1])
hold on 
plot(t1,y1(:,7), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)

%%
p1 = [0.000233746024352377	0.208841073242835	0.542390776209201...
    0.0321211446037937	3.53300315046790];
data2 = xlsread ('TOB20_continuous_new.xlsx');
X2 = data2 (:,1);
Y2 = data2 (:,2);
scatter (X2,Y2)
[t2,y2] = ode45(@(t,y)Musken_5Comp(t,y,p1,20),X2,[0.81 0 0 0 0 0 0]);
subplot(1,3,2);
scatter(X2,Y2,'b','LineWidth',2.0)
hold on 
title('TOB 20 \mug/mL Continuous Treatment', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 1])
hold on 
plot(t2,y2(:,7), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)

%%
p2 = [0.000233746024352377	0.208841073242835	0.542390776209201...
    0.0321211446037937	3.53300315046790];
data3 = xlsread ('TOB50_continuous_new.xlsx');
X3 = data3 (:,1);
Y3 = data3 (:,2);
scatter (X3,Y3)
[t3,y3] = ode45(@(t,y)Musken_5Comp(t,y,p2,4.12),X3,[0.81 0 0 0 0 0 0]);
subplot(1,3,3);
hold on 
title('TOB 5 \mug/mL Continuous Treatment', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
ylim([0 1])
hold on 
plot(t3,y3(:,7), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
 

