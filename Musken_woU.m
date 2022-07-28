function value = Musken_woU (t,y,p,c0)
% y(1) = Biofilm*
% y(2) = D1*
% y(3) = D2*
% y(4) = D3* 
% p(1) = alpha 
% p(2) = beta
% p(3) = Kt
%p(4) = n

    tot = 0.0;
    for j = 1:100
        tot = tot + ((-1) ^ j * exp(-j*j*p(2)*t));
    end

fc = (p(1) * (c0^p(4))) * (1 + 2*tot);
%Btot = sum(y);

value = [ - fc * y(1)
           (fc * y(1)) - (p(3) * y(2))
            p(3) * (y(2) - y(3))
            p(3) * (y(3) - y(4))
            p(3) * y(4)]; 

end 
