% Amostragem_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Paciente_01.mat')
load('/home/labsim/python-gppcom/Desafio HandsOn07/Paciente_02.mat')

%% Amostragem
% Amostragem para sinal 01
s_out01=downsample(sinal_01,10);                             % Pula N_samp=10 amostras do vetor s_out     
s_out01=upsample(s_out01,10);                                % Retorna vetor amostrado com o numero inicial de elementos

% Amostragem para sinal 02
s_out02=downsample(sinal_02,10);                             % Pula N_samp=10 amostras do vetor s_out     
s_out02=upsample(s_out02,10);                                % Retorna vetor amostrado com o numero inicial de elementos

%% Plotting
subplot(2,1,1)
plot (t,s_out01);
title('Sinal 01 Amostrado')
subplot(2,1,2)
plot (t,s_out02);
title('Sinal 02 Amostrado')

%% Save
filename = 'Amostragem.mat';
save(filename)