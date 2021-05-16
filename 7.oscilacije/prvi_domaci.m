%Marija Nedeljkoviæ 2020/0096
clear all
close all
clc

vreme = linspace(0, 30, 1000);

pUslov = [0.5, 0];

mi = [0.1, 2, 5, 10];

options = odeset;
       
[t1,resenje1] = ode45(@vanderpol, vreme, pUslov, options, mi(1));
[t2,resenje2] = ode45(@vanderpol, vreme, pUslov, options, mi(2));
[t3,resenje3] = ode45(@vanderpol, vreme, pUslov, options, mi(3));
[t4,resenje4] = ode45(@vanderpol, vreme, pUslov, options, mi(4));

% figure
% 
% subplot(2, 2, 1)
% plot(t1, resenje1(:,1)); 
% xlabel('vreme (s)')
% ylabel('x(t)')
% title('mi = 0.1')
% grid on
% 
% subplot(2, 2, 2)
% plot(t2, resenje2(:,1));
% xlabel('vreme (s)')
% ylabel('x(t)')
% title('mi = 2')
% grid on
% 
% subplot(2, 2, 3)
% plot(t3, resenje3(:,1)); 
% xlabel('vreme (s)')
% ylabel('x(t)')
% title('mi = 5')
% grid on
% 
% subplot(2, 2, 4)
% plot(t4, resenje4(:,1));
% xlabel('vreme (s)')
% ylabel('x(t)')
% title('mi = 10')
% grid on
% 
% figure
% 
% subplot(2, 2, 1)
% plot(resenje1(:,1), resenje1(:,2)); 
% hold on
% plot(resenje1(1,1), resenje1(1,2),'r.')
% xlabel('x')
% ylabel('dx/dt')
% title('mi = 0.1')
% grid on
% 
% subplot(2, 2, 2)
% plot(resenje2(:,1), resenje2(:,2));
% hold on
% plot(resenje2(1,1), resenje2(1,2),'r.')
% xlabel('x')
% ylabel('dx/dt')
% title('mi = 2')
% grid on
% 
% subplot(2, 2, 3)
% plot(resenje3(:,1), resenje3(:,2));
% hold on
% plot(resenje3(1,1), resenje3(1,2),'r.')
% xlabel('x')
% ylabel('dx/dt')
% title('mi = 5')
% grid on
% 
% subplot(2, 2, 4)
% plot(resenje4(:,1), resenje4(:,2));
% hold on
% plot(resenje4(1,1), resenje4(1,2),'r.')
% xlabel('x')
% ylabel('dx/dt')
% title('mi = 10')
% grid on

[res1, vreme1] = maksimumi(resenje1,t1);
[res2, vreme2] = maksimumi(resenje2,t2);
[res3, vreme3] = maksimumi(resenje3,t3);
[res4, vreme4] = maksimumi(resenje4,t4);
razlike1 = diff(vreme1);
razlike2 = diff(vreme2);
razlike3 = diff(vreme3);
razlike4 = diff(vreme4);
d1 = mean(razlike1);
d2 = mean(razlike2);
d3 = mean(razlike3);
d4 = mean(razlike4);

vreme = linspace(0, 60, 1000);
period = zeros(20,1);
mi1 = linspace(0.1, 15, 20);
for i = 1:1:20
    [t11,resenje11] = ode45(@vanderpol, vreme, pUslov, options, mi1(i));
    [res11, vreme11] = maksimumi(resenje11,t11);
    razlike11 = diff(vreme11);
    period(i) = mean(razlike11);
end
figure
scatter(mi1, period, 'filled')
lsline
hl = lsline;
B = [ones(size(hl.XData(:))), hl.XData(:)]\hl.YData(:);
Slope = B(2)
Intercept = B(1)
xlabel('mi')
ylabel('T')
title('Grafik zavisnosti perioda oscilacija T od parametra mi')
grid on

vreme = linspace(0, 30, 1000);
dt = vreme(2);
obicno_x1 = zeros(length(vreme),1);
izvod_x1 = zeros(length(vreme),1);
obicno_x1(1) = 0.5;
obicno_x2 = zeros(length(vreme),1);
izvod_x2 = zeros(length(vreme),1);
obicno_x2(1) = 0.5;
obicno_x3 = zeros(length(vreme),1);
izvod_x3 = zeros(length(vreme),1);
obicno_x3(1) = 0.5;
obicno_x4 = zeros(length(vreme),1);
izvod_x4 = zeros(length(vreme),1);
obicno_x4(1) = 0.5;
for i = 2:length(vreme)
   obicno_x1(i) = obicno_x1(i-1) + izvod_x1(i-1)*dt;
   izvod_x1(i) = izvod_x1(i-1) + dt*(-mi(1)*(obicno_x1(i-1)^2-1)*izvod_x1(i-1)-obicno_x1(i-1));
   
   obicno_x2(i) = obicno_x2(i-1) + izvod_x2(i-1)*dt;
   izvod_x2(i) = izvod_x2(i-1) + dt*(-mi(2)*(obicno_x2(i-1)^2-1)*izvod_x2(i-1)-obicno_x2(i-1));
   
   obicno_x3(i) = obicno_x3(i-1) + izvod_x3(i-1)*dt;
   izvod_x3(i) = izvod_x3(i-1) + dt*(-mi(3)*(obicno_x3(i-1)^2-1)*izvod_x3(i-1)-obicno_x3(i-1));
   
   obicno_x4(i) = obicno_x4(i-1) + izvod_x4(i-1)*dt;
   izvod_x4(i) = izvod_x4(i-1) + dt*(-mi(4)*(obicno_x4(i-1)^2-1)*izvod_x4(i-1)-obicno_x4(i-1));
end    

figure

subplot(2, 2, 1)
plot(t1, resenje1(:,1)); 
hold on
plot(t1, obicno_x1(:,1)); 
legend('Ugradjena funkcija','FDM');
xlabel('vreme (s)')
ylabel('x(t)')
title('mi = 0.1')
grid on

subplot(2, 2, 2)
plot(t2, resenje2(:,1)); 
hold on
plot(t2, obicno_x2(:,1));
legend('Ugradjena funkcija','FDM');
xlabel('vreme (s)')
ylabel('x(t)')
title('mi = 2')
grid on

subplot(2, 2, 3)
plot(t3, resenje3(:,1)); 
hold on
plot(t3, obicno_x3(:,1)); 
legend('Ugradjena funkcija','FDM');
xlabel('vreme (s)')
ylabel('x(t)')
title('mi = 5')
grid on

subplot(2, 2, 4)
plot(t4, resenje4(:,1)); 
hold on
plot(t4, obicno_x4(:,1));
legend('Ugradjena funkcija','FDM');
xlabel('vreme (s)')
ylabel('x(t)')
title('mi = 10')
grid on

% figure
% 
% subplot(2, 2, 1)
% plot(resenje1(:,1), resenje1(:,2)); 
% hold on
% plot(obicno_x1(:,1), izvod_x1(:,1)); 
% legend('Ugradjena funkcija','FDM');
% xlabel('x')
% ylabel('dx/dt')
% title('mi = 0.1')
% grid on
% 
% subplot(2, 2, 2)
% plot(resenje2(:,1), resenje2(:,2)); 
% hold on
% plot(obicno_x2(:,1), izvod_x2(:,1));
% legend('Ugradjena funkcija','FDM');
% xlabel('vreme (s)')
% ylabel('x(t)')
% title('mi = 2')
% grid on
% 
% subplot(2, 2, 3)
% plot(resenje3(:,1), resenje3(:,2)); 
% hold on
% plot(obicno_x3(:,1), izvod_x3(:,1)); 
% legend('Ugradjena funkcija','FDM');
% xlabel('x')
% ylabel('dx/dt')
% title('mi = 5')
% grid on
% 
% subplot(2, 2, 4)
% plot(resenje4(:,1), resenje4(:,2)); 
% hold on
% plot(obicno_x4(:,1), izvod_x4(:,1));
% legend('Ugradjena funkcija','FDM');
% xlabel('x')
% ylabel('dx/dt')
% title('mi = 10')
% grid on   
    