clearvars; close all; clc;
load temp
% PARA LA SEÑAL QUE NOS DAN - NO CORRELACIONADA
subplot(3,1,1)
plot(x)
grid on
subplot(3,1,2)
plot(periodogram(x))
grid on
xlim([0 25])
subplot(3,1,3)
plot(autocorr(x))
grid on
figure
% PARA LA SEÑAL CORRELACIONADA
subplot(3,1,1)
H = ([num], [den]);
x = filter(H,x); % ver bien que filtro usar en OKAWA http://sim.okawa-denshi.jp/en/CRtool.php
plot(x)
grid on
subplot(3,1,2)
plot(periodogram(x))
grid on
xlim([0 25])
subplot(3,1,3)
plot(autocorr(x))
grid on