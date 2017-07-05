% AWGN_Complexo.m
clc;clear all;close all;
%% Parâmetros
SNR_dB= 10;                                         % Determina o valor da SNR em dB
t=0:0.0001:0.5;                                     % Eixo do tempo
x=2*cos(2*pi*10*t)+i*0.2*cos(2*pi*10*t);            % Sinal qualquer x(t)

%% Montagem do vetor Ruído
L=length(x);                                        % Calcula o comprimento de x
Es= sum(abs(x).^2)/L;                               % Calcula a potência do sinal
SNR= 10^(SNR_dB/10);                                % Calcula a SNR linear
D=Es/SNR;                                           % Calcula a densidade espectral do ruído
noiseSigma= sqrt(D/2);                              % Derivação padrao para ruído AWGN complexo
n = noiseSigma*(randn(1,L)+1i* randn(1,L));         % Ruido complexo calculado 
y =x+n; %received signal

%% Plotting
subplot(3,1,1)
plot(t,x);
title('Sinal original')
subplot(3,1,2)
plot(t,y);
title('Sinal Com Ruido AWGN')
subplot(3,1,3)
plot(t,n);
title('Sinal Com Ruido AWGN')
