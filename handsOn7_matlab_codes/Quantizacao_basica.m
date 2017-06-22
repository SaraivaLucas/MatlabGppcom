clc; clear all;close all;
%% Parâmetros
fs=8000;                                            % Frequência de amostragem
Ts=1/fs;                                            % Período de amostragem
fm=20;                                              % Frequência da onda
Tm=1/fm;                                            % Período de amostragem
t=0:Ts:Tm-Ts;                                       % Eixo do tempo
x=sin(2*pi*20*t);                                   % Sinal x(t)
L=16;                                               % Níveis de quantização
nbits=log2(L);                                      % Pode-se representar com 4 bits

%% Quantização com round()
sig_max=max(x);                                     % Encontra pico máximo
sig_min=min(x);                                     % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                          % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;      % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=x-sig_min;                                     % Joga sinal pra cima
sigp=sigp*(1/Delta);                                % Dá ganho de 1/Delta no sinal (elementos >= 0)
sigp=sigp+1/2;                                      % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex=round(sigp);                                 % Encontra inteiro mais proximo para cada elemento
qindex=min(qindex,L);                               % Trunca o excedente de qindex (Ex: nível 17)
q_out=q_level(qindex);                              % Distribui nos níveis cada elemento

%% Plotting
plot (t,q_out,t,x)