% Paciente_04
clc;  clear all; close all;
%% Dados 
Tf=10;                                                      % Segundos
Fs=200;                                                     % Frequência de amostragem
T=1/Fs;                                                     % Período de amostragem
t=0:T:Tf-T;                                                 % Eixo do tempo
Banda04 = 0.5;                                              % Frequencia do sinal
sinal_04 =  sin(2*pi*Banda04*t)+sin(2*pi*Banda04*0.6*t+0.91)+cos(2*pi*Banda04*0.1*t+0.2) % Sinal Paciente 4   
sinal_04 = sinal_04/max(abs(sinal_04));                     % Ajusta o ganho para amplitude maxima =1
plot (t,sinal_04)                                           % Plota sinal

%% Eixo da frequência - Só pra ter certeza que a frequência não irá extrapolar
% lfft=length(t);
% freq=-Fs/2:Fs/lfft:Fs/2-1/lfft;
% XX=fftshift(fft(sinal_04,lfft)/lfft);
% plot(freq,abs(XX))

%% Save
varlist={'t', 'T', 'Tf'};
clear (varlist{:})
clear varlist
save('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_04.mat')
