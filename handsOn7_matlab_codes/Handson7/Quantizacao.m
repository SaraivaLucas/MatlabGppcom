% Quantizacao.m
close all; clear all; clc;
%% Parâmetros
% Coletaremos todos os dados do processo de amostragem para que o código
% não fique extenso. Todas as variáveis terão o mesmo nome. O arquivo .mat
% deve sempre está na pasta em que o script está.
load('Amostragem.mat')

%% Quantização
sig_max=max(s_out);                                         % Encontra pico máximo
sig_min=min(s_out);                                         % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                                  % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;              % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=s_out-sig_min;                                         % Joga sinal pra cima
sigp=sigp*(1/Delta);                                        % Dá ganho de 1/Delta no sinal
sigp=sigp+1/2;                                              % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex=round(sigp);                                         % Encontra inteiro mais proximo para cada elemento
qindex=min(qindex,L);                                       % Remove o excedente de qindex (Ex: nível 17)
q_out=q_level(qindex);                                      % Distribui nos níveis cada elemento

%% Espectro
lfft=length(q_out);                                         % Comprimento da fft
Q_out=fftshift(fft(q_out,lfft)/lfft);                       % Sinal s_out na frequência
%Freq ja vem no load

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
plot(freq,abs(Q_out))
title('Espectro saida');
axis([-120 120 0 0.06])
subplot(2,2,4)
plot(freq,abs(M_f))
title('Espectro m(t)');
axis([-50 50 0 0.56])
filename = 'Quantizacao.mat';
save(filename)