% Amostragem.m
close all; clear all; clc;
%% Parâmetros
T=0.002;                                                % Taxa de amostragem (500kHz)
Tf=1;                                                   % Tempo final em segundos
t=0:T:Tf-T;                                             % Definição do eixo do tempo      
fm1=3;                                                  % Frequência senoide 1      
fm2=1;                                                  % Frequência senoide 2
m_t=sin(2*pi*fm2*t)-sin(2*pi*fm1*t);                    % Sinal mensagem m(t)
ts=0.02;                                                % Nova taxa de amostragem
N_samp=round(ts/T);                                     % Número de elementos pulados
L=16;                                                   % Níveis de quantização
% T/ts deve ter resto = 0, caso contrário, não funcionará.

%% Amostragem 
s_out=downsample(m_t,N_samp);                           % Pula N_samp=10 amostras do vetor s_out     
s_out=upsample(s_out,N_samp);                           % Retorna vetor amostrado com o numero inicial de elementos

%% Espectro
lfft=length(m_t);                                       % Comprimento da fft
M_f=fftshift(fft(m_t,lfft)/lfft);                       % Sinal m_t na frequência 
S_out=fftshift(fft(s_out,lfft)/lfft);                   % Sinal s_out na frequência
Fs=1/T;                                                 % Frequência de amostragem
freq=-Fs/2:Fs/lfft:Fs/2-Fs/lfft;                        % Eixo da frequência

%% Plotting
% Plot do sinal no tempo
subplot(2,2,[1 2])
plot(t,s_out)
hold on
plot(t,m_t)
title('Sinal Amostrado');
xlabel('Tempo (s)');
ylabel('Amplitude V ');

% Plot do sinal na frequência
subplot(2,2,3)
plot(freq,abs(S_out))
title('Espectro saida');
axis([-120 120 0 0.06])
subplot(2,2,4)
plot(freq,abs(M_f))
title('Espectro m(t)');
axis([-50 50 0 0.56])
filename = 'Amostragem.mat';
save(filename)
