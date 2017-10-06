% Amostragem_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_01.mat')
load('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_02.mat')
load('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_03.mat')
load('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_04.mat')
load('/home/labsim/python-gppcom/Desafio HandsOn07/Pacientes/Paciente_05.mat')
t=0:1/Fs:length(sinal_01)/Fs-1/Fs;

%% Amostragem
% Amostragem para sinal 01
s_out01=downsample(sinal_01,10);                             % Pula N_samp=10 amostras do vetor s_out     
s_out01=upsample(s_out01,10);                                % Retorna vetor amostrado com o numero inicial de elementos

% Amostragem para sinal 02
s_out02=downsample(sinal_02,10);                             % Pula N_samp=10 amostras do vetor s_out     
s_out02=upsample(s_out02,10);                                % Retorna vetor amostrado com o numero inicial de elementos

% Amostragem para sinal 03
s_out03=downsample(sinal_03,10);                             % Pula N_samp=10 amostras do vetor s_out     
s_out03=upsample(s_out03,10);                                % Retorna vetor amostrado com o numero inicial de elementos

% Amostragem para sinal 04
s_out04=downsample(sinal_04,10);                             % Pula N_samp=10 amostras do vetor s_out     
s_out04=upsample(s_out04,10);                                % Retorna vetor amostrado com o numero inicial de elementos

% Amostragem para sinal 05
s_out05=downsample(sinal_05,10);                             % Pula N_samp=10 amostras do vetor s_out     
s_out05=upsample(s_out05,10);                                % Retorna vetor amostrado com o numero inicial de elementos


%% Plotting
subplot(2,3,1)
plot (t,s_out01);
title('Sinal 01 Amostrado')
subplot(2,3,2)
plot (t,s_out02);
title('Sinal 02 Amostrado')
subplot(2,3,3)
plot (t,s_out03);
title('Sinal 03 Amostrado')
subplot(2,3,4)
plot (t,s_out04);
title('Sinal 04 Amostrado')
subplot(2,3,5)
plot (t,s_out05);
title('Sinal 05 Amostrado')

%% Save
varlist={'s_out01', 's_out02', 's_out03', 's_out04', 's_out05','sinal_01', 'sinal_02','sinal_03', 'sinal_04', 'sinal_05',};
save('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Amostragem.mat')