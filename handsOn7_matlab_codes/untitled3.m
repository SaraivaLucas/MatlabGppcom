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

%% Amostragem 
% Amostragem 1
s_out1=downsample(m_t1,n);                              % Pula N_samp=10 amostras do vetor s_out    
s_out1=upsample(s_out1,n);                              % Retorna vetor amostrado com o numero inicial de elementos
% Amostragem 2
s_out2=downsample(m_t2,n);                              % Pula N_samp=10 amostras do vetor s_out    
s_out2=upsample(s_out2,n);                              % Retorna vetor amostrado com o numero inicial de elementos
% Amostragem 1
s_out3=downsample(m_t3,n);                              % Pula N_samp=10 amostras do vetor s_out    
s_out3=upsample(s_out3,n);                              % Retorna vetor amostrado com o numero inicial de elementos

%% Quantização
% Quantização 1

% Quantização 2

% Quantização 3

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
