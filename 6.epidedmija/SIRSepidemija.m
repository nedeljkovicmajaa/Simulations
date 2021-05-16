%Marija Nedeljkovic 2020/0096  
clear all
clc
close all

vreme = [0 30];
Sp = 1e6; Ip = 100; Rp = 0;
yp = [Sp Ip Rp];
alpha = 2.65e-6
beta = 1;
gama = 0.35;
options = odeset;


[t1,y1] = ode45(@SIRS,vreme,yp,options,alpha,beta,gama);

figure(1)
plot(t1,y1(:,1),'b',t1,y1(:,2),'r',t1,y1(:,3),'g')
title("S,I i R u zavisnosti od vremena ")
xlabel('t (nedelja)')
ylabel('Broj jedinki')

legend('S','I','R','Location','Best')




niz = y1(:,2);

Index=0;
for i= 1:length(niz)-1
    if(niz(i)-0.0001 <niz(i+1) && niz(i+1)<niz(i)+0.0001)
        Index=i;
        break;
    end
end
vreme_max_I = t1(Index);

