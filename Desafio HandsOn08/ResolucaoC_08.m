% ResolucaoC_08.m
clc;close all;clear all;
%% Parâmetros
load('DesafioC_08.mat')

%% Resolução 1
L=length(y);                                            % Comprimento do sinal
t=0:1/fs:1/fs*L-1/fs;                                   % Eixo do tempo
x= Amr*cos(2*pi*fmr*t)+Ami*cos(2*pi*fmi*t);             % Reconstrução do sinal x(t)
Noise1 = y-x;                                           % Isola o ruido
potx1=sum(abs(x.^2))/L;                                 % Potência do sinal x(t)
potN1=sum(abs(Noise1.^2))/L;                            % Potência do sinal ruido
SNR1=potx1/potN1;                                       % Estimação da SNR
SNR1=10*log10(SNR1)                                     % Converte para dB