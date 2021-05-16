%Marija Nedeljkovic 2020/0096

function dydt = SIRS(t,y,alpha,beta,gama)

dydt = zeros(3,1);

S = y(1); I = y(2); R = y(3);
dydt(1) = -alpha*S*I+gama*R;
dydt(2) = alpha*S*I - beta*I;
dydt(3) = beta*I-gama*R;
end