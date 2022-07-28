function value = Musken_2Comp (t,y,p,c0)

    tot = 0.0;
    for j = 1:100
        tot = tot + ((-1) ^ j * exp(-j*j*p(2)*t));
    end
    

fc = (p(1) * (c0^p(5))) * (1 + 2*tot);
Btot = sum(y);

value = [ ((p(4) * (1 - Btot) - fc)) * y(1)
           (fc * y(1)) - (p(3) * y(2))
            p(3) * (y(2) - y(3))
            p(3) * y(3)]; 

end 