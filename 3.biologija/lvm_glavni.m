%Marija Nedeljković 2020/0096
clear all
close all
clc

lvm_data = csvread('lvm_data.csv',1,0);
r_prey = 0.4807;
a = 0.02482;
r_predator = 0.9272;
b = 0.02756;
tx = linspace(0,100,200);

tmin = min(lvm_data(:,1));
tmax = max(lvm_data(:,1));
options = odeset;
vreme = linspace(tmin,tmax,200);

tx = linspace(0,100,200);
n = zeros(2,1);
n(1) = 30;
n(2) = min(lvm_data(:,3));

[t,resenje1] = ode45(@lv_model, vreme, n,options,r_prey,r_predator,a,b);

% figure
% plot(t, resenje1(:,1)); 
% 
% hold all
% plot(t, resenje1(:,2)); 
% 
% hold all
% grid on
% grid minor 
% ylim([0 80])
% xlabel('godina');
% ylabel('zecevi i lisice(*1000)');
% title('Lotka-Volterra model');
% legend('zecevi','lisice','Location',"best");

figure
plot(resenje1(:,1), resenje1(:,2)); 
hold all
plot(tx,(r_predator/b)*ones(size(tx)),'--','color','r');
hold all
plot((r_prey/a)*ones(size(tx)),tx,'--','color','r');
hold all
grid on
grid minor 
ylim([0 60])
xlabel('zecevi(*1000)');
ylabel('lisice(*1000)');
title('Lotka-Volterra model fazni dijagram');




