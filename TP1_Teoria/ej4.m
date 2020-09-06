clearvars; close all; clc;
load BWs
% item a
autocorr(x)
figure
autocorr(y)
figure
% compararlas

% item b
periodogram(x);
figure
periodogram(y);
% Que relacion encuentra entre el ancho de banda y el ancho de la funcion de autocorrelacion?

% item c
z = x+y;
figure
plot(z)
% se quisiera eliminar de z el componente de banda angosta (senal x) mediante 
% un filtro Wiener adaptativo. Que configuracion elegir?a?

% item d: El filtro del item anterior, corresponde a un sistema lti? Justifique.