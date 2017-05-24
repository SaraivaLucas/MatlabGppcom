clc; clear all; close all;
%% Parâmetros do sinal mensagem e portadora 
load('/home/labsim/Lucas_Saraiva/Livros GPPCOM/SigSys/Interactive_Demos/Chapter11/am_demo1.mat')
ts=t(2)-t(1);                       % Calcula o período de tempo T=t(i)-t(i-1)
fs=1/ts;                            % Frequência de amostragem
s= carrier.*msg;                    % Sinal AM-DSB-SC (portadora com amplitude 1)
%% Cálculo da FFT
lfft=length(s)*10;                  % Comprimento da fft (Arbitrário)
freqm=(-fs/2:fs/lfft:fs/2-fs/lfft); % Definindo o eixo da frequencia para a DSB no domínio da frequência
Mfft=fft(s,lfft)/lfft;
M_sig=fftshift(Mfft);   % 
%% Plotting
% Plotando a AM-DSB-SC e a mensagem na frequencia
subplot(2,1,1)
plot (t,s,t,msg)
title('AM-DSB-SC no tempo')
ylabel('Amplitude');
xlabel('t (ms)');
% Plotando a AM-DSB-SC e a mensagem na frequencia 
subplot(2,1,2)
plot (freqm,abs(M_sig))             
title('AM-DSB-SC na frequencia ')
axis([-50 50 0 0.01])
