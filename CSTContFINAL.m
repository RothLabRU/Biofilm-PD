clear all; close all; clc;
%%%%%%%%%%%%%%
 %p = [p(1) = alpha, p(2) = beta, p(3) = Kt, p(4) = Ub, p(5) = n];
p =[ 0.00816551254247466	0.398601403024194	1.89235295534918...
    0.000108781940764469	4.43130421089859];
%p = [0.0119    0.5401    1.5136    0.0000    3.6271];

data = xlsread ('CST10_Cont.xlsx');
X = data (:,1);
Y = data (:,2);

tspan1 = 0.161073830000000:0.01:10.2;
[t,y] = ode15s(@(t,y)CST_OneComp(t,y,p,10),tspan1,[0.89 0 0]);


subplot(1,2,1);
scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('CST 10 \mug/mL Continuous Treatment', 'FontSize', 15)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 15) 
ax= gca;
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 15)
hold on 
plot(t,y(:,3),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',20)
ylim([0 1])


subplot(1,2,2)
plot(t,y(:,1),'c','LineWidth',2.0)
hold on
plot(t,y(:,2),'k','LineWidth',2.0)
plot(t,y(:,3),'r','LineWidth',2.0)
title('All Compartments', 'FontSize', 15)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 15)
ax= gca;
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 15)
legend ('Biofilm*', 'D1*', 'X*', 'FontSize', 18)
set(gca,'FontSize',20)
ylim([0 1])


