clear all;close all;clc;
%p = [p(1) = alpha, p(2) = beta, p(3) = Kt, p(4) = Ub, p(5) = n];
%p = [0.002    0.3216    0.3184         0.0023    1.9776];
p = [0.000548558104084461	0.102091303526455	0.389470749286536...
    0.0432364436087371	3.41318493596074];
p1 = [0.000548558104084461	0.102091303526455	0.389470749286536...
    0.0432364436087371	2.41318493596074];

data = xlsread ('TOB5_4hr_True.xlsx');
X = data (:,1); %time 
Y = data (:,2); %data

i = 1;
for j = 1: length(X)
    if X(j) < 4
        tspan(j) = X(j);
    elseif X(j) >= 4
        tspan2(i) = X(j);
        i = i + 1;
    end 

end 

output = ode45(@(t,y)Musken_Trial(t,y,p1,5),[0 4],[0.81 0 0 0 0]);
more_y = deval(output, tspan);
single_array = more_y(1,:);
sz = size(single_array);
k = sz(2);
%everything up to here is the drug being administered from hours 0-4
B = more_y (1, k);
D1 = more_y (2,k); 
D2 = more_y (3,k);
D3 = more_y (4, k);
X1 = more_y (5, k);

%this is the part after 4 hours 
timep = tspan2 - 4;
output2=ode45(@(t2,y1)Musken_wKs_after4(t2,y1,p1,5),[0 20],[B D1 D2 D3 X1]); 
another_y = deval (output2, timep);

all_t = [tspan tspan2];
all_y = [more_y another_y];

subplot(1,3,1);
scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('TOB 5 \mug/mL 4 hr.', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
ylim([0 1])
hold on 
plot(all_t,all_y(5,:),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)

%% TOB 20
data = xlsread ('TOB20_4hr_True.xlsx');
X = data (:,1); %time 
Y = data (:,2); %data

i = 1;
for j = 1: length(X)
    if X(j) < 4
        tspan(j) = X(j);
    elseif X(j) >= 4
        tspan2(i) = X(j);
        i = i + 1;
    end 

end 

output = ode45(@(t,y)Musken_Trial(t,y,p,20),[0 4],[0.81 0 0 0 0]);
more_y = deval(output, tspan);
single_array = more_y(1,:);
sz = size(single_array);
k = sz(2);
%everything up to here is the drug being administered from hours 0-4
B = more_y (1, k);
D1 = more_y (2,k); 
D2 = more_y (3,k);
D3 = more_y (4, k);
X1 = more_y (5, k);

%this is the part after 4 hours 
timep = tspan2 - 4;
output2=ode45(@(t2,y1)Musken_wKs_after4(t2,y1,p,20),[0 20],[B D1 D2 D3 X1]); 
another_y = deval (output2, timep);

all_t = [tspan tspan2];
all_y = [more_y another_y];

subplot(1,3,2);
scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('TOB 20 \mug/mL 4 hr.', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
ylim([0 1])
hold on 
plot(all_t,all_y(5,:),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)

%% TOB 50
data = xlsread ('TOB50_4hr_True.xlsx');
X = data (:,1); %time 
Y = data (:,2); %data

i = 1;
for j = 1: length(X)
    if X(j) < 4
        tspan(j) = X(j);
    elseif X(j) >= 4
        tspan2(i) = X(j);
        i = i + 1;
    end 

end 

output = ode45(@(t,y)Musken_Trial(t,y,p,50),[0 4],[0.81 0 0 0 0]);
more_y = deval(output, tspan);
single_array = more_y(1,:);
sz = size(single_array);
k = sz(2);
%everything up to here is the drug being administered from hours 0-4
B = more_y (1, k);
D1 = more_y (2,k); 
D2 = more_y (3,k);
D3 = more_y (4, k);
X1 = more_y (5, k);

%this is the part after 4 hours 
timep = tspan2 - 4;
output2=ode45(@(t2,y1)Musken_wKs_after4(t2,y1,p,50),[0 20],[B D1 D2 D3 X1]); 
another_y = deval (output2, timep);

all_t = [tspan tspan2];
all_y = [more_y another_y];

subplot(1,3,3);
scatter(X,Y,'b','LineWidth',2.0)
hold on 
title('TOB 50 \mug/mL 4 hr.', 'FontSize', 13)
xlabel('\it\bf{TIME (HOURS)}', 'FontSize', 13) 
ax= gca; 
ax.FontSize = 13;
ylabel('\it\bf{RELATIVE BIOVOLUME}', 'FontSize', 13)
hold on 
ylim([0 1])
hold on 
plot(all_t,all_y(5,:),'r','LineWidth',2.0)
legend ('Data', 'Model', 'FontSize', 18)
set(gca,'FontSize',16)