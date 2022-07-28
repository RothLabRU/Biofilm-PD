function value = Musken_wKs_after4 (t2,y1,p,c0)
% y(1) = Biofilm*
% y(2) = D1*
% y(3) = D2*
% y(4) = D3* 
% p(1) = alpha 
% p(2) = beta
% p(3) = Kt
%p(4) = Ub
%p(5) = n

k = 1:1:100;
g = 1;
for i = 1:100
    m(g) = (2*k(i)) -1;
 
    sum_tot = 0; 
        for n = 1:100
 func=sin((n-m(g)/2)*pi)/(n-m(g)/2)- sin((n+m(g)/2)*pi)/(n+(m(g)/2));          
        sum_tot = sum_tot + ((-1)^n)/n * exp(-n^2 * pi^2 * 0.130) * func;
        end 

    Dm(g) = 2/(pi^2) * (4/(m(g)^2) * sin (m(g)*pi/2) + sum_tot);

    g = g+1;

end 

 Theta2 = 0;
    for r = 1:100
        Theta = m(r) * Dm(r) * exp (-m(r)^2*p(2)*t2/4);
        Theta2 = Theta2 + Theta;
    end 

Ks = p(1) * pi/2 * Theta2 * c0^p(5);

Btot = sum(y1);

value = [ ((p(4) * (1 - Btot) - Ks)) * y1(1)
           (Ks * y1(1)) - (p(3) * y1(2))
            p(3) * (y1(2) - y1(3))
            p(3) * (y1(3) - y1(4))
            p(3) * y1(4)]; 

end 
