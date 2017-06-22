% Quantizacao_pacientes.m
close all; clear all; clc;
%% Dados
load('Amostragem.mat')
L=16;                                                         % Número de Níveis

%% Quantização
% Quantização para sinal 01 ----------------------------------------------
sig_max=max(s_out01);                                         % Encontra pico máximo
sig_min=min(s_out01);                                         % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                                    % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;                % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=s_out01-sig_min;                                         % Joga sinal pra cima
sigp=sigp*(1/Delta);                                          % Dá ganho de 1/Delta no sinal
sigp=sigp+1/2;                                                % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex=round(sigp);                                           % Encontra inteiro mais proximo para cada elemento
qindex=min(qindex,L);                                         % Remove o excedente de qindex (Ex: nível 17)
q_out01=q_level(qindex);                                      % Distribui nos níveis cada elemento


% Quantização para sinal 02 ----------------------------------------------
sig_max=max(s_out02);                                         % Encontra pico máximo
sig_min=min(s_out02);                                         % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                                    % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;                % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=s_out02-sig_min;                                         % Joga sinal pra cima
sigp=sigp*(1/Delta);                                          % Dá ganho de 1/Delta no sinal
sigp=sigp+1/2;                                                % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex=round(sigp);                                           % Encontra inteiro mais proximo para cada elemento
qindex=min(qindex,L);                                         % Remove o excedente de qindex (Ex: nível 17)
q_out02=q_level(qindex);                                      % Distribui nos níveis cada elemento

%% Plotting
subplot(2,1,1)
plot(q_out01)
hold on
plot(sinal_01)
title('Sinal 01 Quantizado')
subplot(2,1,2)
plot(q_out02)
hold on
plot(sinal_02)
title('Sinal 02 Quantizado')

%% Save
filename = 'Quantizacao.mat';
save(filename)





