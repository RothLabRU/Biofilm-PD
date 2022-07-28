clear all; close all; clc;
data = xlsread ('TOB5_CST10.xlsx');
X = data (:,1); %time 
Y = data (:,2); %data

tstart = 0.0; 
tend  = 18; %hours
loop = 50;
tspan = [0 tend];
t = zeros (1,loop);
    for i = 1:loop
        t(i) = (tend * i)/loop;
    end 
[t,y1] = ode15s(@(t,y)CombineCST_TOB_New(t,y,5,10),X,[0.89 0 0 0 0 0]);

subplot(1,4,1);

scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('TOB 5 and CST 10 \mug/mL', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
ylim([0 1])
plot(t, y1(:,6),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
pbaspect([1 2 1])
legend('Location','southeast')
%% 
data1 = xlsread ('TOB5_CST25.xlsx');
X1 = data1 (:,1); %time 
Y1 = data1 (:,2); %data

tstart = 0.0; 
tend  = 18; %hours
loop = 50;
tspan = [0 tend];
t = zeros (1,loop);
    for i = 1:loop
        t(i) = (tend * i)/loop;
    end 
[t,y2] = ode15s(@(t,y)CombineCST_TOB_New(t,y,5,25),X1,[0.89 0 0 0 0 0]);

subplot(1,4,2);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
title('TOB 5 and CST 25 \mug/mL', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
plot(t, y2(:,6),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
ylim ([0 1])
pbaspect([1 2 1])
legend('Location','southeast')
%% 
data2 = xlsread ('TOB50_CST2.5.xlsx');
X2 = data2 (:,1); %time 
Y2 = data2 (:,2); %data

tstart = 0.0; 
tend  = 18; %hours
loop = 50;
tspan = [0 tend];
t = zeros (1,loop);
    for i = 1:loop
        t(i) = (tend * i)/loop;
    end 
    tspan2 = 0.57751938:0.01:16.3294574;
[t,y3]=ode15s(@(t,y)CombineCST_TOB_New(t,y,50,2.5),tspan2,[0.89 0 0 0 0 0]);

subplot(1,4,3);
scatter(X2,Y2,'b','LineWidth',2.0)
hold on 
title('TOB 50 and CST 2.5 \mug/mL', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca;
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
plot(t, y3(:,6),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
ylim ([0 1])
pbaspect([1 2 1])
legend('Location','southeast')
%% 
data3 = xlsread ('TOB50_CST10.xlsx');
X3 = data3 (:,1); %time 
Y3 = data3 (:,2); %data

tstart = 0.0; 
tend  = 18; %hours
loop = 50;
tspan = [0 tend];
t = zeros (1,loop);
    for i = 1:loop
        t(i) = (tend * i)/loop;
    end 
[t,y4]=ode15s(@(t,y)CombineCST_TOB_New(t,y,50,10),X3,[0.89 0 0 0 0 0]);

subplot(1,4,4);
scatter(X3,Y3,'b','LineWidth',2.0)
hold on 
title('TOB 50 and CST 10 \mug/mL', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca;
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
plot(t, y4(:,6),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
ylim ([0 1])
pbaspect([1 2 1])
legend('Location','southeast')

