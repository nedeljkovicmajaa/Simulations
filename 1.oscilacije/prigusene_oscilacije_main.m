%Marija Nedeljković 2020/0096
clear all
close all
clc

tpoc = 0;
tkraj = 60;
num = 1000;
vreme = linspace(tpoc, tkraj, num);

x0 = 10;
v0 = 20;
pUslov = [x0, v0];

omega = [1];
alpha = [1, 0.1, 15, 0]

options = odeset;

m = 1;
k = (omega(1)^2)*m

figure(1)

for n=1:1:4
       
[t,resenje] = ode45(@prigusene_oscilacije, vreme, pUslov, options, omega(1), alpha(n));

%subplot(1, 4, n)
%plot(t, resenje(:,1)); 
%xlabel('vreme (s)')
%ylabel('x(t)')
%grid on

%subplot(1, 4, n)
%plot(resenje(:,1), resenje(:,2));
%xlabel('x')
%ylabel('v')
%grid on

if n == 2
Ek = 0.5*m*resenje(:,2).^2; 
Ep = 0.5*k*resenje(:,1).^2;
%plot(t,Ek);
%hold all
%plot(t,Ep);
%legend('Ek','Ep');
%title('Ek i Ep u funkciji vremena');
%xlabel('vreme');
%ylabel('Ek i Ep');
E = Ep + Ek;
plot(t,E);
hold all
title('Ukupna energija sistema')
xlabel('vreme'),
ylabel('Ek + Ep');


end

end







