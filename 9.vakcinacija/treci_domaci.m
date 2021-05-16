%Marija Nedeljkovic 2020/0096
clear all
close all
clc

options = odeset;
vreme = [0 25];
Sp = 1000; Ip = 1; Rp = 0;

x = [Sp Ip Rp]
alpha = 0.002;
beta = 1;

[t1,resenje1] = ode45(@SIRV, vreme, x, options, alpha, beta);

vreme = linspace(0,25,200);
dt = vreme(2);
S = zeros(length(vreme),1);
I = zeros(length(vreme),1);
R = zeros(length(vreme),1);
S(1) = 1000; I(1) = 1; R(1) = 0;
for i = 1:1:(length(vreme)-1)
    v = 0;
    if (rem(vreme(i),4) < 2)
        v = 50*cos(0.5*3.14*vreme(i)-3.14/2);
    end
    S(i+1) = dt*(-alpha*S(i)*I(i)-v)+S(i);
    I(i+1) = dt*(alpha*S(i)*I(i) - beta*I(i))+I(i);
    R(i+1) = dt*(beta*I(i)+v)+R(i);
end

figure(1)
%plot(vreme,S,'b',vreme,I,'g',vreme,R,'r','LineWidth',1.5)
%hold on
plot(t1,resenje1(:,1),'c',t1,resenje1(:,2),'--m',t1,resenje1(:,3),':k','LineWidth',1.5)
title("S,I i R u zavisnosti od vremena ")
ylim([-200 1200])
xlabel('t (nedelja)')
ylabel('Broj jedinki')
legend('S - ode45','I - ode45','R - ode45','Location','Best')

[maks,t] = maksimumi(t1,resenje1(:,2));
k=0;
for i = 1:1:length(resenje1(:,2))
    if(resenje1(i,2)<=0.5 && k==0)
        trenutak = t1(i);
        r = resenje1(i,2);
        k=1;
    end
end    
   