% Paciente_02
clc; clear all; close all;
%% Dados 
Tf=10;                                                          % Segundos
Fs=200;                                                         % Frequência de amostragem
T=1/Fs;                                                         % Período de amostragem
t=0:T:Tf-T;                                                     % Eixo do tempo
Banda02=0.4;                                                    % Frequencia do sinal
sinal_02 = cos(2*pi*Banda02*t)+ 0.6*cos(2*pi*Banda02*(0.5)*t);  % Sinal Paciente 2
sinal_02 = sinal_02/max(abs(sinal_02));                         % Ajusta o ganho para amplitude maxima =1
plot (t,sinal_02)                                               % Plota sinal

%% Eixo da frequência - Só pra ter certeza que a frequência não irá extrapolar
% lfft=length(t);
% freq=-Fs/2:Fs/lfft:Fs/2-1/lfft;
% XX=fftshift(fft(sinal_02,lfft)/lfft);
% plot(freq,abs(XX))

%% Save
varlist={'t', 'T', 'Tf'};
clear (varlist{:})
clear varlist
save('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_02.mat')
