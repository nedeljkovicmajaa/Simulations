%Marija Nedeljkovic 2020/0096  
clear all
clc
close all

vreme = [0 15];
Sp = 1e6; Ip = 100; Rp = 0;
yp = [Sp Ip Rp];
R01 = 3;
R02 = 6;
R03 = 15;
beta = 1;
options = odeset;


alpha1 = R01*beta/Sp;
alpha2 = R02*beta/Sp;
alpha3 = R03*beta/Sp;

[t1,y1] = ode45(@SIR,vreme,yp,options,alpha1,beta);
[t2,y2] = ode45(@SIR,vreme,yp,options,alpha2,beta);
[t3,y3] = ode45(@SIR,vreme,yp,options,alpha3,beta);

figure(1)
plot(t1,y1(:,1),'b',t1,y1(:,2),'r',t1,y1(:,3),'g')
title("S,I i R u zavisnosti od vremena, R0=3 ")
xlabel('t (nedelja)')
ylabel('Broj jedinki')

legend('S','I','R','Location','Best')

figure(2)
plot(t2,y2(:,1),'b',t2,y2(:,2),'r',t2,y2(:,3),'g')
title("S,I i R u zavisnosti od vremena, R0=6")
xlabel('t (nedelja)')
ylabel('Broj jedinki')
legend('S','I','R','Location','Best')


figure(3)
plot(t3,y3(:,1),'b',t3,y3(:,2),'r',t3,y3(:,3),'g')
title("S,I i R u zavisnosti od vremena, R0=15")
xlabel('t (nedelja)')
ylabel('Broj jedinki')
legend('S','I','R','Location','Best')

[max_I1,ind_I1] = max(y1(:,2));
[max_I2,ind_I2] = max(y2(:,2));
[max_I3,ind_I3] = max(y3(:,2));
