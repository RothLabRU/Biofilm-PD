clear all; close all; clc;
i_v = 0.81;
data1 = xlsread ('TOB5_continuous_new.xlsx');
X1 = data1 (:,1);
Y1 = data1 (:,2);
%[t1,y1] = ode15s(@(t,y)Musken_Trial(t,y,p,5),X1,[i_v 0 0 0 0]);
p = [0.000548558104084461	0.102091303526455	0.389470749286536...
    0.0432364436087371	3.41318493596074];
p2 = [0.00727765009767025 0.422753649796983 0.537176243046993...
    1.07052755111490];
% p3 =  [1.5797    0.0103    0.0000    4.9983];
p3 =[0.0350913868917154  0.0199053655139966	2.75120751846016*(10^-05) ...
    3.43146405500493];
p4 = [0.00108764222596126 0.0814580232175882	0.437002854462677...
    3.28622292006417];
p5 = [0.00943696248344664  0.248013874182812	0.805311151011008...
    0.0288925310652223];
[t1,y1] = ode15s(@(t,y)Musken_Trial(t,y,p,5),X1,[i_v 0 0 0 0]);
[t2,y2] = ode15s(@(t,y)Musken_woB(t,y,p2,5),X1,[i_v 0 0 0 0]);
[t3,y3] = ode15s(@(t,y)Musken_0Comp(t,y,p3,5),X1,[i_v 0]);
[t4,y4] = ode15s(@(t,y)Musken_woU(t,y,p4,5),X1,[i_v 0 0 0 0]);
[t5,y5] = ode15s(@(t,y)Musken_woN(t,y,p5,5),X1,[i_v 0 0 0 0]);

%[t,y] = ode45(@(t,y)NeglectTransitComps(t,y,p,5),X,[0.94 0 0 0 0]);
%Musken_trial
subplot(3,5,1);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
title('Full Model', 'FontSize', 11)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 11) 
ax= gca; 
ax.FontSize = 11;
ylabel('\it\bf{BIOVOLUME for 5 \mug/mL}', 'FontSize', 11)
ylim([0 1])
hold on 
plot(t1,y1(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,2);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
title('\it\bf{Without \beta}', 'FontSize', 11, 'fontweight','bold')
ylim([0 1])
hold on 
plot(t2,y2(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,3);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
title('\it\bf{Without k_{t}}', 'FontSize', 11)
ylim([0 1])
hold on 
plot(t3,y3(:,2), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,4);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
title('\it\bf{Without \mu}', 'FontSize', 11)
ylim([0 1])
hold on 
plot(t4,y4(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,5);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
title('\it\bf{Without \gamma}', 'FontSize', 11)
ylim([0 1])
hold on 
plot(t5,y5(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

%% tob 20 
data1 = xlsread ('TOB20_continuous_new.xlsx');
X1 = data1 (:,1);
Y1 = data1 (:,2);

[t1,y1] = ode15s(@(t,y)Musken_Trial(t,y,p,20),X1,[i_v 0 0 0 0]);
[t2,y2] = ode15s(@(t,y)Musken_woB(t,y,p2,20),X1,[i_v 0 0 0 0]);
[t3,y3] = ode15s(@(t,y)Musken_0Comp(t,y,p3,20),X1,[i_v 0]);
[t4,y4] = ode15s(@(t,y)Musken_woU(t,y,p4,20),X1,[i_v 0 0 0 0]);
[t5,y5] = ode15s(@(t,y)Musken_woN(t,y,p5,20),X1,[i_v 0 0 0 0]);

%[t,y] = ode45(@(t,y)NeglectTransitComps(t,y,p,5),X,[0.94 0 0 0 0]);
%Musken_trial
subplot(3,5,6);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 11) 
ax= gca; 
ax.FontSize = 11;
ylabel('\it\bf{BIOVOLUME for 20 \mug/mL}', 'FontSize', 11)
ylim([0 1])
hold on 
plot(t1,y1(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,7);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t2,y2(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,8);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t3,y3(:,2), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,9);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t4,y4(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,10);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t5,y5(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)
%% tob 50 
data1 = xlsread ('TOB50_continuous_new.xlsx');
X1 = data1 (:,1);
Y1 = data1 (:,2);

[t1,y1] = ode15s(@(t,y)Musken_Trial(t,y,p,50),X1,[i_v 0 0 0 0]);
[t2,y2] = ode15s(@(t,y)Musken_woB(t,y,p2,50),X1,[i_v 0 0 0 0]);
[t3,y3] = ode15s(@(t,y)Musken_0Comp(t,y,p3,50),X1,[i_v 0]);
[t4,y4] = ode15s(@(t,y)Musken_woU(t,y,p4,50),X1,[i_v 0 0 0 0]);
[t5,y5] = ode15s(@(t,y)Musken_woN(t,y,p5,50),X1,[i_v 0 0 0 0]);

%[t,y] = ode45(@(t,y)NeglectTransitComps(t,y,p,5),X,[0.94 0 0 0 0]);
%Musken_trial
subplot(3,5,11);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 11) 
ax= gca; 
ax.FontSize = 11;
ylabel('\it\bf{BIOVOLUME for 50 \mug/mL}', 'FontSize', 11)
ylim([0 1])
hold on 
plot(t1,y1(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,12);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t2,y2(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,13);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t3,y3(:,2), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,14);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t4,y4(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)

subplot(3,5,15);
scatter(X1,Y1,'b','LineWidth',2.0)
hold on 
ylim([0 1])
hold on 
plot(t5,y5(:,5), 'r','LineWidth', 2.0)
legend ('Data', 'Model', 'FontSize', 16, 'Location', 'northwest')
set(gca,'FontSize',15)