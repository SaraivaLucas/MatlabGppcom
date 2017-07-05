% DesafioR_08.m
clc; clear all;close all;
%% Parâmetros
SNR_dB= 15;                                         % Determina o valor da SNR em dB
fs=1/0.0001;                                        % Frequência de amostragem
t=0:0.0001:0.5;                                     % Eixo do tempo
Am= 2;                                              % Amplitude
fm =10;                                             % Frequência do sinal x(t)
x=Am*cos(2*pi*10*t);                                % Sinal qualquer x(t)

%% Montagem do vetor Ruído
L=length(x);                                        % Calcula o comprimento de x
Potencia_sinal = sum(abs(x).^2)/L;                  % Calcula a potência do sinal
SNR= 10^(SNR_dB/10);                                % Calcula a SNR linear
D=Potencia_sinal/SNR;                               % Calcula a densidade espectral do ruído
noiseSigma = sqrt(D);                               % Derivação padrao para ruído AWGN real
n = noiseSigma* randn(1,L);                         % Ruido real calculado 
y = x + n ;                                         % Sinal ruidoso

%% Plotting
subplot(3,1,1)
plot(t,x);
title('Sinal original')
subplot(3,1,2)
plot(t,y);
title('Sinal Com Ruido AWGN')
subplot(3,1,3)
plot(t,n);
title('Sinal Ruido AWGN')
clear D L noiseSigma SNR SNR_dB Potencia_sinal x n t

filename = 'DesafioR_08.mat';
save(filename)