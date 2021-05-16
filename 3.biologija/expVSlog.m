%Marija Nedeljković 2020/0096
clear all
close all
clc

vreme = linspace(0,70,1000);
y = 50;
r = [0.1,0.2,0.3];
K = 500;
options = odeset;
tx = linspace(0,100,1000);

[t,resenje1] = ode45(@log_growth, vreme, y,options,r(1),K);
[t,resenje2] = ode45(@log_growth, vreme, y,options,r(2),K);
[t,resenje3] = ode45(@log_growth, vreme, y,options,r(3),K);

[t,resenje11] = ode45(@exp_growth, vreme, y,options,r(1));
[t,resenje22] = ode45(@exp_growth, vreme, y,options,r(2));
[t,resenje33] = ode45(@exp_growth, vreme, y,options,r(3));

figure
plot(t, resenje1(:,1)); 
hold all
plot(t, resenje2(:,1)); 
hold all
plot(t, resenje3(:,1)); 
hold all
plot(t, resenje11(:,1),'--','color',uint8([17 17 17])); 
hold all
plot(t, resenje22(:,1),'--','color',uint8([17 17 17])); 
hold all
plot(t, resenje33(:,1),'--','color',uint8([17 17 17])); 
hold all
plot(tx,K*ones(size(tx)),'--','color','r');
% line([0,100],[K,K],'color','r','LineStyle','--')
grid on
grid minor 
ylim([0 600]) % y ogranicenje 
xlabel('t');
ylabel('x [t]');
title('Poređenje exp i log rasta za različite vrednosti stope rasta r')
legend('r=0.1','r=0.2',"r=0.3");
