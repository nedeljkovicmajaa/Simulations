%Marija Nedeljković 2020/0096
clear all
close all
clc

a = 40; b = 2; c = 5; d = 3; m = 0.5; n = -1;

options = odeset;
y1 = [12, 1];
options = odeset;
vreme = linspace(0,20,1000);
[t,resenje1] = ode45(@ocekivanja_cene, vreme,y1,options, a,b,c,d,m,n);

figure(1)
subplot(1, 2, 1)
plot(t, resenje1(:,1)); 
xlabel('vreme (s)')
ylabel('P(t)')
grid on

subplot(1, 2, 2)
plot(resenje1(:,1), resenje1(:,2)); 
xlabel('P')
ylabel('dP/dt')
grid on

