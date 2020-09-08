clearvars; close all; clc;
load('Ensamble_QRS.mat')

%hold on
%for ii = 1:2
%   plot(ecgshift(:,ii))
%end
%figure
%c = xcorr(ecgshift(:,1),ecgshift(:,2));
%plot(c)
fs= 0.48; %latidos por segundo
ts = 1/fs;
ts = ts/length(ecgshift);
fs = 1/ts;
t = 0 : ts: length(ecgshift)*ts-ts;
x = ecgshift(1,:);
subplot(2,1,1)
for ii = 1:100
    plot(t,ecgshift(ii,:))
    hold on
end
%hacemos el corrimiento

for j=2:1:100
    y = ecgshift(j,:);
    [rxy, lags] = xcorr(x,y); %fcion de la correlacion cruzada
    [maxrxy, maxlag] = max(rxy);
    maxlagsegs = lags(maxlag)/fs;
    ycorrida = [];
    if(maxlag < length(y))
        desplazamiento = length(y)-maxlag;
        for i=1:length(y)
            if i+desplazamiento < length(y)
                ycorrida(i) = y(i+desplazamiento);
            else
                ycorrida(i) = 0;
            end
        end
    else
        desplazamiento = maxlag- length(y);
           for i=1:length(y)
            if i-desplazamiento > 0
                ycorrida(i) = y(i-desplazamiento);
            else
                ycorrida(i) = 0;
            end
        end
    end
    ecgshift(j,:) = ycorrida;
    subplot(2,1,2)
    plot(t,ycorrida,t,x)
    hold on
end
