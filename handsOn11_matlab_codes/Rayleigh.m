% Rayleigh.m
clc; clear all;close all;
%% Parâmetros
N=20000;                                    % Número de amostras
x=0:0.1:5;                                  % Eixo x
sigma=1;                                    % parâmetro Rayleigh
u=rand(1,N);                                % Amostras aleatórias
r=sigma*sqrt(-2*log(u));                    % Dados aleatorios da distribuição Rayleigh
r_ac= x/(sigma^2).*exp(-(x/sigma).^2/2);    % Rayleigh PDF

%% plotting
subplot(2,1,1)
hist(r,x)
title('Histograma para N=20000 amostras')
axis([0 5 0 1500])
subplot(2,1,2)
plot(x,r_ac)
title('Rayleigh PDF')