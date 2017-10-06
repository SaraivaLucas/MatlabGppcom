% Filter_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Decode_pacientes.mat')
lfft=length(vet_dec_rec01);                                     % Comprimento da FFT
Recv01=fftshift(fft(vet_dec_rec01,lfft)/lfft);                  % Sinal 01 recuperado na frequência
Recv02=fftshift(fft(vet_dec_rec02,lfft)/lfft);                  % Sinal 02 recuperado na frequência
Recv03=fftshift(fft(vet_dec_rec03,lfft)/lfft);                  % Sinal 03 recuperado na frequência
Recv04=fftshift(fft(vet_dec_rec04,lfft)/lfft);                  % Sinal 04 recuperado na frequência
Recv05=fftshift(fft(vet_dec_rec05,lfft)/lfft);                  % Sinal 05 recuperado na frequência
freq= -Fs/2:Fs/lfft: Fs/2-Fs/lfft;                              % Definição do eixo da frequência
N_samp = 10;                                                    % Número de amostras

%% Reconstrução via filtro passa baixa

% Para Sinal_01
BW1 = floor(Banda01*1.5/(Fs/lfft));
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW1:lfft/2+BW1)=1;                                 % Define 1 na frequencia desejada
S_recv01=N_samp*Recv01'.*H_lpf;                                 % Filtragem ideal
s_recv01=real(ifft(fftshift(S_recv01)));                        % Reconstroi o sinal no tempo
s_recv01=s_recv01(1:lfft);                                      % Corrige número de elementos 

% Para Sinal_02
BW2 = floor(Banda02*1.5/(Fs/lfft));
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW2:lfft/2+BW2)=1;                                 % Define 1 na frequencia desejada
S_recv02=N_samp*Recv02'.*H_lpf;                                 % Filtragem ideal
s_recv02=real(ifft(fftshift(S_recv02)));                        % Reconstroi o sinal no tempo
s_recv02=s_recv02(1:lfft);                                      % Corrige número de elementos 

% Para Sinal_03
BW3 = floor(Banda03*1.5/(Fs/lfft));
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW3:lfft/2+BW3)=1;                                 % Define 1 na frequencia desejada
S_recv03=N_samp*Recv03'.*H_lpf;                                 % Filtragem ideal
s_recv03=real(ifft(fftshift(S_recv03)));                        % Reconstroi o sinal no tempo
s_recv03=s_recv03(1:lfft);                                      % Corrige número de elementos 

% Para Sinal_04
BW4 = floor(Banda02*1.5/(Fs/lfft));
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW4:lfft/2+BW4)=1;                                 % Define 1 na frequencia desejada
S_recv04=N_samp*Recv04'.*H_lpf;                                 % Filtragem ideal
s_recv04=real(ifft(fftshift(S_recv04)));                        % Reconstroi o sinal no tempo
s_recv04=s_recv04(1:lfft);                                      % Corrige número de elementos 

% Para Sinal_05
BW5 = floor(Banda02*1.5/(Fs/lfft));
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW5:lfft/2+BW5)=1;                                 % Define 1 na frequencia desejada
S_recv05=N_samp*Recv05'.*H_lpf;                                 % Filtragem ideal
s_recv05=real(ifft(fftshift(S_recv05)));                        % Reconstroi o sinal no tempo
s_recv05=s_recv05(1:lfft);                                      % Corrige número de elementos 

%% Plotting
% Para Sinal_01
subplot(2,1,1)
plot(t,s_recv01)
title('Sinal 01 na frequência')
subplot(2,1,2)
plot(-t,sinal_01)
title('Sinal 01 no tempo')
figure()

% Para Sinal_02
subplot(2,1,1)
plot(t,s_recv02)
title('Sinal 02 na frequência')
subplot(2,1,2)
plot(-t,sinal_02)
title('Sinal 02 no tempo')
figure()

% Para Sinal_03
subplot(2,1,1)
plot(t,s_recv03)
title('Sinal 03 na frequência')
subplot(2,1,2)
plot(-t,sinal_03)
title('Sinal 03 no tempo')
figure

% Para Sinal_04
subplot(2,1,1)
plot(t,s_recv04)
title('Sinal 04 na frequência')
subplot(2,1,2)
plot(-t,sinal_04)
title('Sinal 04 no tempo')
figure

% Para Sinal_05
subplot(2,1,1)
plot(t,s_recv05)
title('Sinal 05 na frequência')
subplot(2,1,2)
plot(-t,sinal_05)
title('Sinal 05 no tempo')