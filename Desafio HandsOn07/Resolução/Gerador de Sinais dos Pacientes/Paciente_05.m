% Paciente_05
clc;  clear all; 
%% Dados 
Tf=10;                                                      % Segundos
Fs=200;                                                     % Frequência de amostragem
T=1/Fs;                                                     % Período de amostragem
t=0:T:Tf-T;                                                 % Eixo do tempo
Banda05=0.7;                                                % Frequencia do sinal
sinal_05 = sin(2*pi*Banda05*t)+sin(2*pi*Banda05*0.4*t+0.91)+cos(2*pi*Banda05*0.9*t+0.2)      % Sinal Paciente 5            
sinal_05 = sinal_05/max(abs(sinal_05));                     % Ajusta o ganho para amplitude maxima =1
figure
plot (t,sinal_05)                                           % Plota sinal

%% Eixo da frequência - Só pra ter certeza que a frequência não irá extrapolar
% lfft=length(t);
% freq=-Fs/2:Fs/lfft:Fs/2-1/lfft;
% XX=fftshift(fft(sinal_05,lfft)/lfft);
% plot(freq,abs(XX))

%% Save
varlist={'t', 'T', 'Tf'};
clear (varlist{:})
clear varlist
save('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_05.mat')