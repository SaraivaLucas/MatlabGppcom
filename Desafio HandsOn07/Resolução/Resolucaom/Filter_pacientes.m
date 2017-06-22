% Filter_pacientes.m
close all; clear all; clc;
%% Dados
load('Decode_pacientes.mat')
lfft=length(vet_dec_rec01);                                     % Comprimento da FFT
Recv01=fftshift(fft(vet_dec_rec01,lfft)/lfft);                  % Sinal 01 recuperado na frequência
Recv02=fftshift(fft(vet_dec_rec02,lfft)/lfft);                  % Sinal 02 recuperado na frequência
freq= -Fs/2:Fs/lfft: Fs/2-Fs/lfft;                              % Definição do eixo da frequência
N_samp = 10;                                                    % Número de amostras

%% Reconstrução via filtro passa baixa
% Parâmetros do filtro
BW=10;                                                          % Largura de banda de 10
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW:lfft/2+BW-1)=1;                                 % Define 1 na frequencia desejada
% Para Sinal_01
S_recv01=N_samp*Recv01'.*H_lpf;                                 % Filtragem ideal
s_recv01=real(ifft(fftshift(S_recv01)));                        % Reconstroi o sinal no tempo
s_recv01=s_recv01(1:lfft);                                      % Corrige número de elementos 
% Para Sinal_02
S_recv02=N_samp*Recv02'.*H_lpf;                                 % Filtragem ideal
s_recv02=real(ifft(fftshift(S_recv02)));                        % Reconstroi o sinal no tempo
s_recv02=s_recv02(1:lfft);                                      % Corrige número de elementos 


%% Plotting
% Para Sinal_01
subplot(2,1,1)
plot(t,s_recv01)
title('Sinal 01 na frequência')
subplot(2,1,2)
plot(freq,abs(S_recv01))
title('Sinal 01 no tempo')
axis([-10 10 -1 200])
figure()

% Para Sinal_02
subplot(2,1,1)
plot(t,s_recv02)
title('Sinal 02 na frequência')
subplot(2,1,2)
plot(freq,abs(S_recv02))
title('Sinal 02 no tempo')
axis([-10 10 -1 200])













