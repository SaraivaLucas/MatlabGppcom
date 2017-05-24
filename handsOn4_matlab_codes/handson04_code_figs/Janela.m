clc; close all;clear all;

%% Geração da janela
fsampling = 60;                     % Frequência de amostragem em kHz
tf = 2;                             % segundos
t = 0 : (1/fsampling) : tf;         % Determinação do eixo do tempo
m = zeros(size(t));                 % Criando sinal zeros
m(length(m)*2/6:length(m)*4/6)=1;   % Acrescentando intervalo de "1"

%% Gráfico da janela 
stem(t,m);                          % Plot em Stem do sinal
grid on;                            % Adciona grid
axis([ 0 2 0 1.2])                  % Definição de zoom

%% Janela na frequência
figure;                         % Nova figura
lfft = 300;                     % Número de pontos da fft
fsampling = 80;                 % Frequencia de amostragem em kHz
yfft = fft(m,lfft)/lfft;        % Cálculo da fft
% Definição do eixo das frequências unilateral
freq1 = [0 : fsampling/lfft : fsampling/2 - fsampling/lfft];
yfftuni = yfft(1:lfft/2);       % fft unilateral
plot(freq1,abs(yfftuni))        % Plotagem do espectro M(f)
grid on;                        % Adiona o grid

