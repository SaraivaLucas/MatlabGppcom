clc; close all;clear all;

%% Geração da janela
fsampling = 60;                 % Frequência de amostragem em kHz
tf = 2;                         % Segundos
t = 0 : (1/fsampling) : tf;     % Determinação do eixo do tempo
fm = 10;                        % Frequência do sinal
Am = 1;                         % Amplitude do sinal
m = Am*cos(2*pi*fm*t);          % Sinal senoidal puro

%% Gráfico da senoide 
stem(t,m);                      % Plot em Stem do sinal
grid on;                        % Adciona grid
axis([ 0 .8 -1.5 1.5])          % Definição de zoom

%% Janela do sinal na frequência
figure;                         % Nova figura
lfft = 300;                     % Número de pontos da fft
fsampling = 80;                 % Frequencia de amostragem em kHz
yfft = fft(m,lfft)/lfft;        % Cálculo da fft
% Definição do eixo das frequências unilateral
freq1 = [0 : fsampling/lfft : fsampling/2 - fsampling/lfft];
yfftuni = yfft(1:lfft/2);       % fft unilateral
stem(freq1,abs(yfftuni))        % Plotagem do espectro M(f)
grid on;                        % Adiona o grid

