clear all;close all;clc;
%p = [p(1) = alpha, p(2) = beta, p(3) = Kt, p(4) = Ub, p(5) = n];
%p = [0.002    0.3216    0.3184         0.0023    1.9776];
p =[0.00816551254247466	0.398601403024194	1.89235295534918...
    0.000108781940764469	4.43130421089859];
p1 =[0.00816551254247466	0.7	1.89235295534918...
    0.000108781940764469	4.43130421089859];

%% 2.5 
data = xlsread ('CST2.5_4hr.xlsx');
X = data (:,1);
Y = data (:,2);

i = 1;
for j = 1: length(X)
    if X(j) < 4
        tspan(j) = X(j);
    elseif X(j) >= 4
        tspan2(i) = X(j);
        i = i + 1;
    end 

end 

[t,y] = ode15s(@(t,y)CST_OneComp(t,y,p1,2.5),X,[0.89 0 0]);

subplot(1,3,1)
scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('CST 2.5 \mug/mL 4 hr.', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
ylim([0 1])
hold on 
plot(t,y(:,3),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
legend('Location', 'southeast')

% output = ode15s(@(t,y)CST_OneComp(t,y,p1,2.5),[0 4],[0.81 0 0]);
% more_y = deval(output, tspan);
% single_array = more_y(1,:);
% sz = size(single_array);
% k = sz(2);
% %everything up to here is the drug being administered from hours 0-4
% B = more_y (1, k);
% D1 = more_y (2,k); 
% D2 = more_y (3,k);
% timep = tspan2 - 4;
% output2=ode15s(@(t2,y1)CST_OneComp(t2,y1,p1,2.5),[0 20],[B D1 D2]); 
% another_y = deval (output2, timep);
% 
% all_t = [tspan tspan2];
% all_y = [more_y another_y];
% 
% subplot(1,3,1);
% scatter(X,Y,'b','LineWidth',2.0)
% hold on 
% title('CST 2.5 \mug 4 hr Plot', 'FontSize', 13)
% xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
% ax= gca; 
% ax.FontSize = 13;
% ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
% hold on 
% ylim([0 1])
% hold on 
% plot(all_t,all_y(3,:),'r','LineWidth',2.0)
% legend ('Data', 'Model', 'FontSize', 10)

%% 10
data = xlsread ('CST10_4hr.xlsx');
X = data (:,1);
Y = data (:,2);

i = 1;
for j = 1: length(X)
    if X(j) < 4
        tspan(j) = X(j);
    elseif X(j) >= 4
        tspan2(i) = X(j);
        i = i + 1;
    end 

end 
[t,y] = ode15s(@(t,y)CST_OneComp(t,y,p,10),X,[0.89 0 0]);
output = ode45(@(t,y)CST_OneComp(t,y,p,10),[0 4],[0.89 0 0]);
more_y = deval(output, tspan);
single_array = more_y(1,:);
sz = size(single_array);
k = sz(2);
%everything up to here is the drug being administered from hours 0-4
B = more_y (1, k);
D1 = more_y (2,k); 
D2 = more_y (3,k);
timep = tspan2 - 4;
output2=ode45(@(t2,y1)CST_OneComp(t2,y1,p,0),[0 20],[B D1 D2]); 
another_y = deval (output2, timep);

all_t = [tspan tspan2];
all_y = [more_y another_y];

subplot(1,3,2);
scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('CST 10 \mug/mL 4 hr.', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
ylim([0 1])
hold on 
plot(t,y(:,3),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
legend('Location', 'southeast')

%% 25 
data = xlsread ('CST25_4hr.xlsx');
X = data (:,1);
Y = data (:,2);

i = 1;
for j = 1: length(X)
    if X(j) < 4
        tspan(j) = X(j);
    elseif X(j) >= 4
        tspan2(i) = X(j);
        i = i + 1;
    end 

end 

output = ode45(@(t,y)CST_OneComp(t,y,p,25),[0 4],[0.89 0 0]);
more_y = deval(output, tspan);
single_array = more_y(1,:);
sz = size(single_array);
k = sz(2);
%everything up to here is the drug being administered from hours 0-4
B = more_y (1, k);
D1 = more_y (2,k); 
D2 = more_y (3,k);
timep = tspan2 - 4;
output2=ode45(@(t2,y1)CST_OneComp(t2,y1,p,0),[0 20],[B D1 D2]); 
another_y = deval (output2, timep);

all_t = [tspan tspan2];
all_y = [more_y another_y];

subplot(1,3,3);
scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('CST 25 \mug/mL 4 hr.', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
ylim([0 1])
hold on 
plot(all_t,all_y(3,:),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)
legend('Location', 'southeast')

