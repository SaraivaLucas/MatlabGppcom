% Paciente_02
clc; clear all; close all;
%% Dados 
Tf=10;                                                      % Segundos
Fs=200;                                                     % Frequência de amostragem
T=1/Fs;                                                     % Período de amostragem
t=0:T:Tf-T;                                                 % Eixo do tempo
fm2=0.4;                                                    % Frequencia do sinal
sinal_02 = cos(2*pi*fm2*t)+ 0.6*cos(2*pi*fm2*(0.5)*t);      % Sinal Paciente 2
sinal_02 = sinal_02/max(abs(sinal_02));                     % Ajusta o ganho para amplitude maxima =1
plot (t,sinal_02)                                           % Plota sinal

%% Save
filename = 'Paciente_02.mat';
save(filename)
