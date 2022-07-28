function value = Musken_0Comp (t,y,p,c0)

    tot = 0.0;
    for j = 1:100
        tot = tot + ((-1) ^ j * exp(-j*j*p(2)*t));
    end
    

fc = (p(1) * (c0^p(4))) * (1 + 2*tot);
Btot = sum(y);

value = [ ((p(3) * (1 - Btot) - fc)) * y(1)
           (fc * y(1))]; 

end 