clc; close all;clear all;

%% Geração do sinal cosenoidal
fsampling = 10; % kHz
tf = 200; % segundos
t = 0 : (1/fsampling) : tf;
fm = 0.04;
Am = 2;
m = Am*cos(2*pi*fm*t);


%% Visualizando a amplitude do espectro com um tamanho arbitrário para a fft
% Novo LFFT
lfft = 1000;
% Taxa de amostragem
fsampling = 10; % kHz
% Plot do sinal M(f): single-sided amplitude spectrum.
% Abrir nova figure
figure;
% Cálculo da fft
yfft = fft(m,lfft)/lfft;
% Definição do eixo das frequências unilateral
freq1 = [0 : fsampling/lfft : fsampling/2 - fsampling/lfft];
% fft unilateral
yfftuni = yfft(1:lfft/2); 


%% Plotando o eixo da frequência com stem() e plot():


% Colocando a frequência em stem() no lado direito; 
subplot(1,2,1)
% Plotando a freqência em stem()
stem(freq1,abs(yfftuni))
grid on;
title('Função stem()')
axis([ 0 0.1 0 1.2])


% Colocando a frequência em plot() no lado esquerdo;
subplot(1,2,2)
% Plotando a freqência em plot()
plot(freq1,abs(yfftuni))
grid on;
title('Função plot()')
axis([ 0 0.1 0 1.2])
