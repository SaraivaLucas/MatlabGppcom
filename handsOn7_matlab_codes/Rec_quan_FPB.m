% Rec_quan_FPB.m
clc; clear all; close all;
%% Parâmetros
load('Quantizacao.mat')                       % Recupera dados de Quantização.mat

%% Reconstrução via filtro passa baixa
% Largura máxima de banda do filtro é dada por Bw = floor((lfft/N_samp)/2);
Fmax=1/(2*T);                                                   % Frequência máxima dada por Fs/2
BW=5;                                                           % Largura de banda
% Filtro
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW:lfft/2+BW-1)=1;                                 % Define 1 na frequencia desejada
S_recv=N_samp*Q_out.*H_lpf;                                     % Filtragem ideal
s_recv=real(ifft(fftshift(S_recv)));                            % Reconstroi o sinal no tempo
s_recv=s_recv(1:lfft);                                          % Corrige número de elementos 
s_recv=s_recv-s_recv(1)                                         % Remove quaisquer componente DC
s_recv=s_recv*(max(m_t)/max(s_recv));                           % Dá ganho pro sinal reconstruido

%% Plotting
% Plota o sinal reconstruído por um filtro passa baixa ideal no domínio da frequência
% Plota sinal recuperado na frequência
subplot(2, 1, 1);
sfig2a=plot(freq,abs(S_recv));
xlabel('Frequência (Hz)');
axis([-150 150 0 .6]);
title('Espectro do sinal reconstruido');

% Plota sinal recuperado no tempo
subplot(2, 1, 2);
plot(t,m_t,'k.',t,s_recv(1:lfft),'b');
legend('Sinal Original','Sinal Rreconstruido');
xlabel('Tempo (sec)');
title('Sinal Original x Sinal Reconstruido');