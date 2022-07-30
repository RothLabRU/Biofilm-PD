function value = CombineCST_TOB_New (t,y,Ct,Cc)
u = 0.04;
%everything having to do with TOB
beta_TOB = 0.208841073242835; 
alpha_TOB = 0.000233746024352377;
nt = 3.53300315046790; %this is the n value for TOB
Ktt = 0.542390776209201; %Kt for TOB
    tot = 0.0;
    for j = 1:100
        tot = tot + ((-1) ^ j * exp(-j*j*beta_TOB*t));
    end
fct = (alpha_TOB * (Ct^nt)) * (1 + 2*tot); %this is the "Kst"

%everything having to do with CST
beta_CST = 0.398601403024194; 
alpha_CST = 0.00816551254247466;
nc = 4.43130421089859; %this is the n value for TOB
Ktc = 1.89235295534918; %Kt for CST
    tot1 = 0.0;
    for i = 1:100
        tot1 = tot1 + ((-1) ^ i * exp(-i*i*beta_CST*t));
    end
fcc = (alpha_CST * (Cc^nc)) * (1 + 2*tot1); 


Btot = sum(y);

value=[((u * (1-Btot) - fct - fcc))*y(1)
         (fct * y(1)) - (Ktt * y(2)) - (fcc * y(2))
         (Ktt * (y(2)-y(3))) - (fcc*y(3))
         (Ktt * (y(3)-y(4))) - (fcc *y(4)) 
         (Ktt * (y(4)-y(5))) - (fcc *y(5))
         (Ktt * (y(5)-y(6))) - (fcc *y(6))
         (fcc * y(1)) - (Ktc * y(7)) + (fcc * (y(2)+y(3)+y(4)+y(5)+y(6)))
         (Ktt * y(6)) + (Ktc *y(7))];

end 
