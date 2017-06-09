close all; clear all; clc;
%% Parâmetros
% Nessa simulação faremos 
% 1- Fs = 2*Fm - Sinal amostrado na frequencia mínima
% 2- Fs > 2*Fm - Sinal Sub-amostrado
% 3- Fs < 2*Fm - Sinal Sobre-amostrado
% Amostragem
Tf=2;                                                   % Tempo final em segundos
% Eixo do tempo 1
Fs1=500;                                                % Frequência de amostragem   -- 1
t1=0:1/Fs1:Tf-1/Fs1;                                    % Definição do eixo do tempo -- 1
% Eixo do tempo 2
Fs2=200;                                                % Frequência de amostragem   -- 2
t2=0:1/Fs2:Tf-1/Fs2;                                    % Definição do eixo do tempo -- 2
% Eixo do tempo 3
Fs3=1000;                                               % Frequência de amostragem   -- 3
t3=0:1/Fs3:Tf-1/Fs3;                                    % Definição do eixo do tempo -- 3
% Senoide
fm=25;                                                  % Frequência senoide
m_t1=cos(2*pi*fm*t1);                                   % Sinal mensagem m1(t)
m_t2=cos(2*pi*fm*t2);                                   % Sinal mensagem m2(t)
m_t3=cos(2*pi*fm*t3);                                   % Sinal mensagem m3(t)
n=10;                                                   % Número de elementos pulados
% T/ts deve ter resto = 0, caso contrário, não funcionará.

%% Amostragem 
% Amostragem 1
s_out1=downsample(m_t1,n);                              % Pula N_samp=10 amostras do vetor s_out    
s_out1=upsample(s_out1,n);                              % Retorna vetor amostrado com o numero inicial de elementos
%s_out=min(m_t,t1);
% Amostragem 2
s_out2=downsample(m_t2,n);                              % Pula N_samp=10 amostras do vetor s_out    
s_out2=upsample(s_out2,n);                              % Retorna vetor amostrado com o numero inicial de elementos
% Amostragem 1
s_out3=downsample(m_t3,n);                              % Pula N_samp=10 amostras do vetor s_out    
s_out3=upsample(s_out3,n);                              % Retorna vetor amostrado com o numero inicial de elementos

%% Espectro da frequência
% Eixo da frequência 1
lfft1=length(m_t1);                                     % Comprimento da fft
M_f1=fftshift(fft(m_t1,lfft1)/lfft1);                   % Sinal m_t na frequência 
S_out1=fftshift(fft(s_out1,lfft1)/lfft1);               % Sinal s_out na frequência
freq1=-Fs1/2:Fs1/lfft1:Fs1/2-Fs1/lfft1;                 % Eixo da Frequência
% Eixo da frequência 2
lfft2=length(m_t2);                                     % Comprimento da fft
M_f2=fftshift(fft(m_t2,lfft2)/lfft2);                   % Sinal m_t na frequência 
S_out2=fftshift(fft(s_out2,lfft2)/lfft2);               % Sinal s_out na frequência
freq2=-Fs2/2:Fs2/lfft2:Fs2/2-Fs2/lfft2;                 % Eixo da Frequência
% Eixo da frequência 3
lfft3=length(m_t3);                                     % Comprimento da fft
M_f3=fftshift(fft(m_t3,lfft3)/lfft3);                   % Sinal m_t na frequência 
S_out3=fftshift(fft(s_out3,lfft3)/lfft3);               % Sinal s_out na frequência
freq3=-Fs3/2:Fs3/lfft3:Fs3/2-Fs3/lfft3;                 % Eixo da Frequência


%% Plotting
% Plot do sinal no tempo 3
subplot(2,2,[1 2])
stem(t3,s_out3)
axis([0 0.2 -1.2 1.2])
hold on
plot(t3,m_t3)
title('Sinal Sobre-amostrado');
xlabel('Tempo (s)');
ylabel('Amplitude V ');

% Plot dos sinais na frequência
subplot(2,2,3)
plot(freq3,abs(S_out3))
title('Espectro saida');
axis([-120 120 0 0.12])
subplot(2,2,4)
plot(freq3,abs(M_f3))
title('Espectro m(t)');
axis([-120 120 0 0.6])
figure
% -------------------------------------

% Plot do sinal no tempo 2 -Sub-amostrado
subplot(2,2,[1 2])
stem(t2,s_out2)
axis([0 0.2 -1.2 1.2])
hold on
plot(t2,m_t2)
title('Sinal Sub-amostrado');
xlabel('Tempo (s)');
ylabel('Amplitude V ');

% Plot dos sinais na frequência
subplot(2,2,3)
plot(freq2,abs(S_out2))
title('Espectro saida');
axis([-120 120 0 0.12])
subplot(2,2,4)
plot(freq2,abs(M_f2))
title('Espectro m(t)');
axis([-120 120 0 0.6])
figure

% -------------------------------------

% Plot do sinal no tempo 1
subplot(2,2,[1 2])
stem(t1,s_out1)
axis([0 0.2 -1.2 1.2])
hold on
plot(t1,m_t1)
title('Sinal Amostrado Fs=2*Fm');
xlabel('Tempo (s)');
ylabel('Amplitude V ');

% Plot dos sinais na frequência
subplot(2,2,3)
plot(freq1,abs(S_out1))
title('Espectro saida');
axis([-120 120 0 0.12])
subplot(2,2,4)
plot(freq1,abs(M_f1))
title('Espectro m(t)1');
axis([-120 120 0 0.6])
