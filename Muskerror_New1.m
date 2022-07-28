function error = Muskerror_New1(p)
clear y;

data = xlsread ('TOB20_continuous_new.xlsx');
X11 = data (:,1); %time 
Y1 = data (:,2); %data
% 
% i = 1;
% for j = 1: length(X11)
%     if X11(j) < 4
%         tspan11(j) = X11(j);
%         j = j + 1;
%     elseif X11(j) >= 4
%         tspan21(i) = X11(j);
%         j = j + 1;
%         i = i + 1;
%     end 
% 
% end 

output = ode45(@(t,y)Musken_New1(t,y,p,20),tspan11,[0.94 0 0 0 0]);
more_y = deval(output, tspan11);
%everything up to here is the drug being administered from hours 0-4
% new_var = more_y(1,:);
% a = new_var(end);
% k=find(new_var==a);
B = more_y (1, 10);
D1 = more_y (2,10); 
D2 = more_y (3,10);
D3 = more_y (4, 10);
X1 = more_y (5, 10);

output2 = ode45(@(t,y)Musken_Trial(t,y,p,0),tspan21,[B D1 D2 D3 X1]); 
another_y = deval (output2, tspan21);

all_y = [more_y another_y];
    
    value1 = ((all_y(:,5))- ((Y1'))).^ 2;
    
%     %---------------------------------------------------------------
%     
% data2 = xlsread ('TOB20_4hr_True.xlsx');
% X2 = data2 (:,1); %time 
% Y2 = data2 (:,2); %data
% 
% r = 1;
% for q = 1: length(X2)
%     if X2(q) < 4
%         tspan12(q) = X2(q);
%         q = q + 1;
%     elseif X2(q) >= 4
%         tspan22(r) = X2(q);
%         q = q + 1;
%         r = r + 1;
%     end 
% 
% end 
% 
% output3 = ode45(@(t,y)Musken_Trial(t,y,p,20),tspan12,[0.94 0 0 0 0]);
% more_y2 = deval(output3, tspan12);
% %everything up to here is the drug being administered from hours 0-4
% % new_var2 = more_y2(1,:);
% % c = new_var2(end);
% % e=find(new_var2==c);
% B1 = more_y2 (1, 10);
% D12 = more_y2 (2,10); 
% D22 = more_y2 (3,10);
% D33 = more_y2 (4, 10);
% X11 = more_y2 (5, 10);
% 
% output4 = ode45(@(t,y)Musken_Trial(t,y,p,0),tspan22,[B1 D12 D22 D33 X11]); 
% another_y2 = deval (output4, tspan22);
% 
% all_y2 = [more_y2 another_y2];
% value2 = ((all_y2(:,5))- ((Y2'))).^ 2;
% %----------------------------------------------------
% data3 = xlsread ('TOB50_4hr_True.xlsx');
% X3 = data3 (:,1); %time 
% Y3 = data3 (:,2); %data
% 
% o = 1;
% for l = 1: length(X3)
%     if X3(l) < 4
%         tspan13(l) = X3(l);
%         l = l + 1;
%     elseif X3(l) >= 4
%         tspan23(o) = X3(l);
%         l = l + 1;
%         o = o + 1;
%     end 
% 
% end 
% 
% output5 = ode45(@(t,y)Musken_Trial(t,y,p,50),tspan13,[0.94 0 0 0 0]);
% more_y3 = deval(output5, tspan13);
% %everything up to here is the drug being administered from hours 0-4
% % new_var3 = more_y3(1,:);
% % d = new_var3(end);
% % f=find(new_var3==d);
% B5 = more_y3 (1, 10);
% D5 = more_y3 (2,10); 
% D25 = more_y3 (3,10);
% D35 = more_y3 (4, 10);
% X5 = more_y3 (5, 10);
% 
% output6=ode45(@(t,y)Musken_Trial(t,y,p,0),tspan23,[B5 D5 D25 D35 X5]); 
% another_y3 = deval (output6, tspan23);
% 
% all_y3 = [more_y3 another_y3];
% value3 = ((all_y3(:,5))- ((Y3'))).^ 2;
%     
 error1 = sum(value1,'all');
% error2 = sum(value2,'all');
% error3 = sum(value3,'all');

error = error1; %+ error2 + error3;

end 
