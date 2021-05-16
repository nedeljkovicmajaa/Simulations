%Marija Nedeljkovic 2020/0096

function dydt = SIRV(t,y,alpha,beta)

dydt = zeros(3,1);
v = 0;
if (rem(t,4) < 2)
    v = 50*cos(0.5*3.14*t-3.14/2);
end

S = y(1); I = y(2); R = y(3); 
dydt(1) = -alpha*S*I-v;
dydt(2) = alpha*S*I - beta*I;
dydt(3) = beta*I+v;

end