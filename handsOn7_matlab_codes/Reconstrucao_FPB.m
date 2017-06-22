% Reconstrucao_FPB
clc; clear all; close all;
%% Parâmetros 
% Coletaremos todos os dados do processo de quantização e amostragem para 
% que o código não fique extenso. Todas as variáveis terão o mesmo nome.
% O arquivo .mat deve sempre está na pasta em que o script está.
load('Amostragem.mat')          

%% Reconstrução via filtro passa baixa
% Largura máxima de banda do filtro é dada por Bw = floor((lfft/N_samp)/2);
Fmax=1/(2*T);                                                   % Frequência máxima dada por Fs/2
BW=10;                                                          % Largura de banda de 10
% Filtro
H_lpf=zeros(1,lfft);                                            % Zera vetor filtro
H_lpf(lfft/2-BW:lfft/2+BW-1)=1;                                 % Define 1 na frequencia desejada
S_recv=N_samp*S_out.*H_lpf;                                     % Filtragem ideal
s_recv=real(ifft(fftshift(S_recv)));                            % Reconstroi o sinal no tempo
s_recv=s_recv(1:lfft);                                          % Corrige numero de elementos 
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
sfig2b=plot(t,m_t,'k-.',t,s_recv(1:lfft),'b');
legend('Sinal Original','Sinal Rreconstruido');
xlabel('Tempo (sec)');
title('Sinal Original x Sinal Reconstruido');
set(sfig2b,'Linewidth',2);
