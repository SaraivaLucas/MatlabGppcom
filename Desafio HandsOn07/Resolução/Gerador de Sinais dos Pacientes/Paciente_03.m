% Paciente_03
clc; clear all;  close all;
%% Dados 
Tf=10;                                                      % Segundos
Fs=200;                                                     % Frequência de amostragem
T=1/Fs;                                                     % Período de amostragem
t=0:T:Tf-T;                                                 % Eixo do tempo
Banda03=0.7;                                                % Banda do sinal
sinal_03 = sin(2*pi*Banda03*t)+sin(2*pi*Banda03*.9*t)+cos(2*pi*Banda03*0.5*t+0.2)                              % Sinal Paciente 3
sinal_03 = sinal_03/max(abs(sinal_03));                     % Ajusta o ganho para amplitude maxima =1
plot (t,sinal_03)                                           % Plota sinal

%% Eixo da frequência - Só pra ter certeza que a frequência não irá extrapolar
% lfft=length(t);
% freq=-Fs/2:Fs/lfft:Fs/2-1/lfft;
% XX=fftshift(fft(sinal_03,lfft)/lfft);
% plot(freq,abs(XX))

%% Save
varlist={'t', 'T', 'Tf'};
clear (varlist{:})
clear varlist
save('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_03.mat')
