clc; clear all; close all;
%% Dados 
Tf=10;                                                      % Segundos
Fs=200;                                                     % Frequência de amostragem
T=1/Fs;                                                     % Período de amostragem
t=0:T:Tf-T;                                                 % Eixo do tempo
% Paciente 01
fm1=0.6;                                                    % Frequencia do sinal
sinal_01 = cos(2*pi*fm1*t);                                 % Sinal Paciente 1
sinal_01 = sinal_01/max(abs(sinal_01));                     % Ajusta o ganho para amplitude maxima =1
plot (t,sinal_01)                                           % Plota sinal
hold on
% Paciente 01
fm2=0.4;                                                    % Frequencia do sinal
sinal_02 = cos(2*pi*fm2*t)+ 0.6*cos(2*pi*fm2*(0.5)*t);      % Sinal Paciente 2
sinal_02 = sinal_02/max(abs(sinal_02));                     % Ajusta o ganho para amplitude maxima =1
plot (t,sinal_02)                                           % Plota sinal
