% ResolucaoR_08.m
clc;close all;clear all;
%% Parâmetros
load('DesafioR_08.mat')

%% Resolução 1
L=length(y);                                            % Comprimento do sinal
t=0:1/fs:1/fs*L-1/fs;                                   % Eixo do tempo
x= Am*cos(2*pi*fm*t);                                   % Reconstrução do sinal x(t)
Noise1 = y-x;                                           % Isola o ruido
potx1=sum(abs(x.^2))/L;                                 % Potência do sinal x(t)
potN1=sum(abs(Noise1.^2))/L;                            % Potência do sinal ruido
SNR1=potx1/potN1;                                       % Estimação da SNR
SNR1=10*log10(SNR1)                                     % Converte para dB

%% Resolução 2
L=length(y);                                            % Comprimento do sinal
x= Am*cos(2*pi*fm*t);                                   % Reconstrução do sinal x(t)
Noise2 = y-x;                                           % Isola o ruido
potx2=Am^2/2;                                           % Potência do sinal x(t)
potN2=sum(abs(Noise2.^2))/L;                            % Potência do sinal ruido
SNR2=potx2/potN2;                                       % Estimação da SNR
SNR2=10*log10(SNR2)                                     % Converte para dB

%% Resolução 3 (Não deve ser feita)
SNR3= snr(y)                                            % Função SNR