%Marija Nedeljkovic 2020/0096  
clear all
clc
close all

vreme = [0 30];
Sp = 1e6; Ip = 100; Rp = 0;
yp = [Sp Ip Rp];
alpha = 2.65e-6
beta = 1;
q = [0.1,0.5,1];
options = odeset;


[t1,y1] = ode45(@SIRQ,vreme,yp,options,alpha,beta,q(1));
[t2,y2] = ode45(@SIRQ,vreme,yp,options,alpha,beta,q(2));
[t3,y3] = ode45(@SIRQ,vreme,yp,options,alpha,beta,q(3));

figure(1)
plot(t1,y1(:,1),'b',t1,y1(:,2),'r',t1,y1(:,3),'g')
title("S,I i R u zavisnosti od vremena za q=0.1")
xlabel('t (nedelja)')
ylabel('Broj jedinki')
legend('S','I','R','Location','Best')

figure(2)
plot(t2,y2(:,1),'b',t2,y2(:,2),'r',t2,y2(:,3),'g')
title("S,I i R u zavisnosti od vremena za q=0.5")
xlabel('t (nedelja)')
ylabel('Broj jedinki')
legend('S','I','R','Location','Best')

figure(3)
plot(t3,y3(:,1),'b',t3,y3(:,2),'r',t3,y3(:,3),'g')
title("S,I i R u zavisnosti od vremena za q=1")
xlabel('t (nedelja)')
ylabel('Broj jedinki')
legend('S','I','R','Location','Best')