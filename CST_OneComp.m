function value = CST_OneComp (t,y,p,c0)
% y(1) = Biofilm*
% y(2) = D1*
% y(3) = D2*
% p(1) = alpha 
% p(2) = beta
% p(3) = Kt
%p(4) = Ub
%p(5) = n

    tot = 0.0;
    for j = 1:100
        tot = tot + ((-1) ^ j * exp(-j*j*p(2)*t));
    end
    

fc = (p(1) * (c0^p(5))) * (1 + 2*tot);
Btot = sum(y);

value = [ ((p(4) * (1 - Btot) - fc)) * y(1)
           (fc * y(1)) - (p(3) * y(2))
            p(3) * y(2)]; 

end 
