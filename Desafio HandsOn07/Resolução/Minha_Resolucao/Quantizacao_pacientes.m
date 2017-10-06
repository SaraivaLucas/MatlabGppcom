% Quantizacao_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Amostragem.mat')
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
qindex01=round(sigp);                                         % Encontra inteiro mais proximo para cada elemento
qindex01=min(qindex01,L);                                     % Remove o excedente de qindex (Ex: nível 17)
q_out01=q_level(qindex01);                                    % Distribui nos níveis cada elemento

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
qindex02=round(sigp);                                         % Encontra inteiro mais proximo para cada elemento
qindex02=min(qindex02,L);                                     % Remove o excedente de qindex (Ex: nível 17)
q_out02=q_level(qindex02);                                    % Distribui nos níveis cada elemento

% Quantização para sinal 03 ----------------------------------------------
sig_max=max(s_out03);                                         % Encontra pico máximo
sig_min=min(s_out03);                                         % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                                    % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;                % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=s_out03-sig_min;                                         % Joga sinal pra cima
sigp=sigp*(1/Delta);                                          % Dá ganho de 1/Delta no sinal
sigp=sigp+1/2;                                                % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex03=round(sigp);                                         % Encontra inteiro mais proximo para cada elemento
qindex03=min(qindex03,L);                                     % Remove o excedente de qindex (Ex: nível 17)
q_out03=q_level(qindex03);                                    % Distribui nos níveis cada elemento


% Quantização para sinal 04 ----------------------------------------------
sig_max=max(s_out04);                                         % Encontra pico máximo
sig_min=min(s_out04);                                         % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                                    % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;                % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=s_out04-sig_min;                                         % Joga sinal pra cima
sigp=sigp*(1/Delta);                                          % Dá ganho de 1/Delta no sinal
sigp=sigp+1/2;                                                % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex04=round(sigp);                                         % Encontra inteiro mais proximo para cada elemento
qindex04=min(qindex04,L);                                     % Remove o excedente de qindex (Ex: nível 17)
q_out04=q_level(qindex04);                                    % Distribui nos níveis cada elemento

% Quantização para sinal 05 ----------------------------------------------
sig_max=max(s_out05);                                         % Encontra pico máximo
sig_min=min(s_out05);                                         % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                                    % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;                % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=s_out05-sig_min;                                         % Joga sinal pra cima
sigp=sigp*(1/Delta);                                          % Dá ganho de 1/Delta no sinal
sigp=sigp+1/2;                                                % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex05=round(sigp);                                         % Encontra inteiro mais proximo para cada elemento
qindex05=min(qindex05,L);                                     % Remove o excedente de qindex (Ex: nível 17)
q_out05=q_level(qindex05);                                    % Distribui nos níveis cada elemento

%% Plotting
subplot(2,3,1)
plot(q_out01)
hold on
plot(sinal_01)
title('Sinal 01 Quantizado')

subplot(2,3,2)
plot(q_out02)
hold on
plot(sinal_02)
title('Sinal 02 Quantizado')

subplot(2,3,3)
plot(q_out03)
hold on
plot(sinal_03)
title('Sinal 03 Quantizado')

subplot(2,3,4)
plot(q_out04)
hold on
plot(sinal_04)
title('Sinal 04 Quantizado')

subplot(2,3,5)
plot(q_out05)
hold on
plot(sinal_05)
title('Sinal 05 Quantizado')

%% Save
save('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Quantizacao.mat')





