%Marija Nedeljkovic 2020/0096
clear all
clc
close all

vreme = [0 25];
Sp = 1e6; Ip = 100; Rp = 0;
yp = [Sp Ip Rp];
alpha = 2.65e-6;
beta = 1;
options = odeset;
[t,y] = ode45(@SIR,vreme,yp,options,alpha,beta);

figure(1)
plot(t,y(:,1),'b',t,y(:,2),'r',t,y(:,3),'g')
title("S,I i R u zavisnosti od vremena")
xlabel('t (nedelja)')
ylabel('Broj jedinki')
legend('S','I','R','Location','Best')

[max_I,ind_I] = max(y(:,2));
niz = y(:,2);
vreme_max_I = t(ind_I);
pop = 0.5*(Sp+Ip)/100;
Index=0;
for i= 1:length(niz)
    if(niz(i)<pop && i>ind_I)
        Index=i;
        break;
    end
end
vreme_max_I = t(Index);
