%Marija Nedeljković 2020/0096
clear all
close all
clc

sunflower_data = csvread('sunflower_data.csv',1,0);

tmin = min(sunflower_data(:,1));
tmax = max(sunflower_data(:,1));
options = odeset;

vreme = linspace(tmin,tmax,200);
tx = linspace(0,100,200);
K = max(sunflower_data(:,2));
r = 0.1;
[t,resenje1] = ode45(@log_growth, vreme, min(sunflower_data(:,2)),options,r,K);
[t,resenje11] = ode45(@exp_growth, vreme, min(sunflower_data(:,2)),options,r);


figure
scatter(sunflower_data(:,1), sunflower_data(:,2),20,'k','filled');
hold all
plot(t, resenje1(:,1),'color','b'); 
hold all
plot(t, resenje11(:,1)); 
hold all
plot(tx,K*ones(size(tx)),'--','color','r');
% line([0,100],[K,K],'color','r','LineStyle','--')
grid on
grid minor 
ylim([0 280]) % y ogranicenje 
xlabel('Age [days]');
ylabel('Height [cm]');
title('Sunflower growth');
legend('experimental data','logistic model','exponential model','Location',"best");




