% Quantizacao.m
close all; clear all; clc;
%% Parâmetros
T=0.002;                                                % Taxa de amostragem (500kHz)
Tf=1;                                                   % Tempo final em segundos
t=0:T:Tf-T;                                             % Definição do eixo do tempo      
fm1=3;                                                  % Frequência senoide 1      
fm2=1;                                                  % Frequência senoide 2
m_t=sin(2*pi*fm2*t)-sin(2*pi*fm1*t);                    % Sinal mensagem m(t)
ts=0.02;                                                % Nova taxa de amostragem
N_samp=10;                                              % Número de elementos 
L=16;                                                   % Níveis de quantização
% T/ts deve ter resto = 0, caso contrário, não funcionará.

%% Amostragem 
s_out=downsample(m_t,N_samp);                           % Pula N_samp=10 amostras do vetor s_out     
s_out=upsample(s_out,N_samp);                           % Retorna vetor amostrado com o numero inicial de elementos

%% Quantização
sig_max=max(s_out);                                     % Encontra pico máximo
sig_min=min(s_out);                                     % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                              % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;          % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=s_out-sig_min;                                     % Joga sinal pra cima
sigp=sigp*(1/Delta);                                    % Dá ganho de 1/Delta no sinal
sigp=sigp+1/2;                                          % Tira elementos do zero 
% Agora nenhum valor do sinal agora é zero nem negativo

qindex=round(sigp);                                     % Encontra inteiro mais proximo para cada elemento
qindex=min(qindex,L);                                   % Remove o excedente de qindex (Ex: nível 17)
q_out=q_level(qindex);                                  % Distribui nos níveis cada elemento

%% Espectro
lfft=length(m_t);                                       % Comprimento da fft
M_f=fftshift(fft(m_t,lfft)/lfft);                       % Sinal m_t na frequência 
S_out=fftshift(fft(s_out,lfft)/lfft);                   % Sinal s_out na frequência
Fs=1/T;
freq=-Fs/2:Fs/lfft:Fs/2-Fs/lfft;
%% Plotting
% Plot do sinal no tempo
subplot(2,2,[1 2])
plot(t,q_out)
hold on
plot(t,m_t)
title('Sinal Amostrado e quantizado');
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

