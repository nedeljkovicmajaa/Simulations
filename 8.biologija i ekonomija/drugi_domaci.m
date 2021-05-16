%Marija Nedeljkoviæ 2020/0096
clear all
close all
clc

k = [-3,0,3];
figure
koordinate = zero_finder(k(1),-2,2);
koordinate = zero_finder(k(2),-2,2);
koordinate = zero_finder(k(3),-2,2);
plot(linspace(-2,2,1000),zeros(1000,1),'--')
legend('k = -3','k = 0','k = 3');
xlabel('x')
ylabel('dx/dt')
title('fazni dijagram')
grid on

options = odeset;
vreme = linspace(0,100,2000);
x = [-0.00001,0.00001];
[t1,resenje1] = ode45(@histerezis, vreme, x(1), options, k(2));
[t2,resenje2] = ode45(@histerezis, vreme, x(2), options, k(2));

% figure
% 
% subplot(1, 2, 1)
% plot(t1, resenje1(:,1)); 
% xlabel('vreme (s)')
% ylabel('x(t)')
% title('x(0)= -0.00001')
% grid on
% 
% subplot(1, 2, 2)
% plot(t2, resenje2(:,1)); 
% xlabel('vreme (s)')
% ylabel('x(t)')
% title('x(0)= 0.00001')
% grid on

vreme = linspace(0,100,2000);
dt = vreme(2);
obicno_x1 = zeros(length(vreme),1);
izvod_x1 = zeros(length(vreme),1);
obicno_x1(1) = -0.00001;
obicno_x2 = zeros(length(vreme),1);
izvod_x2 = zeros(length(vreme),1);
obicno_x2(1) = 0.00001;
izvod_x1(1) = -obicno_x1(1)*obicno_x1(1)*obicno_x1(1)+obicno_x1(1)+k(2);
izvod_x2(1) = -obicno_x2(1)*obicno_x2(1)*obicno_x2(1)+obicno_x2(1)+k(2);

for i = 2:length(vreme)
   izvod_x1(i-1) = -obicno_x1(i-1)*obicno_x1(i-1)*obicno_x1(i-1)+obicno_x1(i-1)+k(2);
   obicno_x1(i) = obicno_x1(i-1) + izvod_x1(i-1)*dt;
   
   izvod_x2(i-1) = -obicno_x2(i-1)*obicno_x2(i-1)*obicno_x2(i-1)+obicno_x2(i-1)+k(2);
   obicno_x2(i) = obicno_x2(i-1) + izvod_x2(i-1)*dt;
end  
% figure
% 
% subplot(1, 2, 1)
% plot(t1, resenje1(:,1)); 
% hold on
% plot(vreme, obicno_x1(:,1)); 
% xlabel('vreme (s)')
% ylabel('x(t)')
% ylim([-1.2 0])
% legend('Histerezis','FDM');
% title('x(0) = -0.00001')
% grid on
% 
% subplot(1, 2, 2)
% plot(t2, resenje2(:,1)); 
% hold on
% plot(vreme, obicno_x2(:,1));
% xlabel('vreme (s)')
% ylabel('x(t)')
% ylim([0 1.2])
% legend('Histerezis','FDM');
% title('x(0) = 0.00001')
% grid on

k = linspace(-3,3,200);
uslov = [-4,4];
x1 = zeros(200,1);
x2 = zeros(200,1);

for i = 1:1:200
    [t1,resenje1] = ode45(@histerezis, vreme, uslov(1), options, k(i));
    x1(i) = resenje1(199);
    [t2,resenje2] = ode45(@histerezis, vreme, uslov(2), options, k(i));
    x2(i) = resenje2(199);
end

figure
plot(k, x1(:,1),'-');
hold on
plot(k, x2(:,1),'--');
xlabel('k')
ylabel('Stacionarne vrednosti za razlièitu vrednost k')
legend('x1(k)','x2(k)')
title('Zavisnost rešenja za poèetne uslove x(0)=-4 i x(0)=4')
grid on





