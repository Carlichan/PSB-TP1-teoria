clearvars; close all; clc;
load('Ensamble_QRS.mat')

hold on
for ii = 1:2
   plot(ecgshift(:,ii))
end
figure
c = xcorr(ecgshift(:,1),ecgshift(:,2));
plot(c)