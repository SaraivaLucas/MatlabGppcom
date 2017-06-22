clc; close all;clear all;

%% Parâmetros do sinal 
N=1000;                                 % Número de amostras
f1=100;                                 % Frequência do seno
FS=2000;                                % Frequência de amostragem
n=0:N-1;                                % Números de índice de amostra
x=sin(2*pi*f1*n/FS);                    % Gera o sinal x(n)
t=[1:N]*(1/FS);                         % Definiçao do eixo do tempo
Rxx=xcorr(x);                           % Estima a autocorrelaçao de x(n)
f=[-0.5*FS:FS/N:0.5*FS-FS/N];           % Eixo da frequência

%% FFT do sinal
subplot(1,2,1)                          % Plot superior
Xfft=fft(x,N);                          % Encontra a FFT
Xg=fftshift(Xfft);                      % Coloca o centro do espectro em zero
Sxx=abs(Xg)/N;                         % Encontra o Módulo da PSD
stem (f,Sxx)                            % Plota a PSD
%axis([-500 500 0 3e5])
title('PSD - FFT do sinal')
%% FFT da autocorrelação
subplot(1,2,2)                          % Plot Inferior
Sxcor=xcorr(x,'biased');                    % Calcula a Autocorrelação
Xfft2=fft(Sxcor,N);                     % Calcula a FFT da autocorrelação
Xshift=fftshift(Xfft2);                 % Coloca o centro do espectro em zero
Sxx2=abs(Xshift)/N;                       % Encontra o Módulo da PSD
stem (f,Sxx2);                          % Plota o gráfico da PSD
%%axis([-500 500 0 1.4e5])
title('PSD - FFT da Autocorrelção')