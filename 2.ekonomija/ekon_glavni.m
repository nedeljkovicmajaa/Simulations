%Marija Nedeljković 2020/0096
clear all
close all
clc

P = linspace(0,-10,2000);
a = 22; b = 2; c = 5; d = -5;
gama = 0.1;

%anonimne fujnkcije gde se P prosledjuje kao parametar
Qd = @(P)a - b*P;
Qs = @(P)-c + d*P;
f = @(P)Qd(P) - Qs(P);

figure(1)
plot(P, Qd(P));
hold all
plot(P, Qs(P));
legend('Qd', 'Qs');
xlabel('cena');
ylabel('Qd i Qs')
grid on

% figure(2)
% plot(P,f(P));
% xlabel('cena')
% ylabel('f = Qd - Qs')
% grid on

znaci = sign(f(P));
razlike = diff(znaci);
zero_crossings = find(razlike);

for brojac = 1:length(zero_crossings)
    Peq(brojac) = fzero(f,P(zero_crossings(brojac)));
end
disp(Peq)


options = odeset;
y = [Peq, Peq*2, Peq/2];

vreme = linspace(0,-10,1000);
[t,resenje1] = ode45(@dinamicki_model, vreme,y(1),options, a,b,c,d,gama);
[t,resenje2] = ode45(@dinamicki_model, vreme,y(2),options, a,b,c,d,gama);
[t,resenje3] = ode45(@dinamicki_model, vreme,y(3),options, a,b,c,d,gama);

figure(3)
plot(t, resenje1);
hold all
plot(t, resenje2);
hold all
plot(t, resenje3);
legend("Puslov = Peq","Puslov = Peq*2","Puslov = Peq/2");
xlabel('vreme (s)');
ylabel('P(t)');
grid on




