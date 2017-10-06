% Paciente_01
clc; clear all; close all;
%% Dados 
Tf=10;                                                      % Segundos
Fs=200;                                                     % Frequência de amostragem
T=1/Fs;                                                     % Período de amostragem
t=0:T:Tf-T;                                                 % Eixo do tempo
Banda01=0.6;                                                % Frequencia do sinal
sinal_01 = cos(2*pi*Banda01*t);                             % Sinal Paciente 1
sinal_01 = sinal_01/max(abs(sinal_01));                     % Ajusta o ganho para amplitude maxima =1
plot (t,sinal_01)                                           % Plota sinal

%% Eixo da frequência - Só pra ter certeza que a frequência não irá extrapolar
% lfft=length(t);
% freq=-Fs/2:Fs/lfft:Fs/2-1/lfft;
% XX=fftshift(fft(sinal_01,lfft)/lfft);
% plot(freq,abs(XX))

%% Save
varlist={'t', 'T', 'Tf'};
clear (varlist{:})
clear varlist
save('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_01.mat')
