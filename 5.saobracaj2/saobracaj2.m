%Marija Nededljkovic 2020/0096
clear all,
close all,
clc

data = csvread('traffic_data.csv',1,0);
x = data(:,1)/1.609;
y = data(:,2)*1.609;

figure
plot(x,y,'ro');
grid on
grid minor
xlabel('gustina vozila[1/km]');
ylabel('brzina[km/h]');
title('zavisnost');


ft = fittype('a*(1-(x/b))');
f1 = fit(x,y,ft,'start',[10 50]);
koeficijenti = coeffvalues(f1);

p1 = f1.a;
p2 = f1.b;

figure
plot(x,y,'ro');
hold on
plot(f1,'b');
xlabel('gustina vozila[1/km]');
ylabel('brzina[km/h]');
title('zavisnost');
legend('experiment','fit','location','best');
grid on
grid minor

l = 2.4;
t = 0.05;
dx = 0.05;
dt = 0.1/3600;
br_t = t/dt;
br_x = l/dx;

tt = linspace(0,t,br_t);
xx = linspace(0,l,br_x);

rom = 103.5711;
vm = 57.8983;

ro = zeros(length(xx),length(tt));

for i = 1:1:br_t
    ro(1,i) = 0.3*rom;
end

for i = 2:1:br_x
    for j = 1:(br_t-1)
        c = -2*(vm/rom)*ro(i,j) + vm;
        ro(i,j+1) = ro(i,j)-c*dt/dx*(ro(i,j)-ro(i-1,j));
    end
end

figure
plot(xx,ro(:,1000),'g');
hold on
plot(xx,ro(:,1200),'b');
hold on
plot(xx,ro(:,1600),'c');
hold on
xlabel('put');
ylabel('ro');
title('zavisnost');
legend('t=100','t=120','t=160');

figure
mesh(tt,xx,ro);
xlabel('vreme[h]');
zlabel('gustina vozila[1/km]');
ylabel('brzina[km/h]');

