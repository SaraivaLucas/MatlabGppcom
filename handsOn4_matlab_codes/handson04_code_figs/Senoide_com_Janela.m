clc; close all;clear all;

%% Geração da janela
fsampling = 64;                         % Frequência de amostragem em kHz
tf = 2;                                 % Segundos
t = 0 : (1/fsampling) : tf;             % Determinação do eixo do tempo
fm = 8;                                 % Frequência do sinal
Am = 1;                                 % Amplitude do sinal
m1 = Am*cos(2*pi*fm*t);                 % Sinal senoidal puro
m2 = zeros(size(t));                    % Sinal zeros
m2(length(t)/3+1:length(t)*2/3)=1;      % Sinal zeros com "1" no intervalo de 1/3 do seu comprimento a 2/3
m=m1.*m2;                               % Sinal resultante

%% Janela do sinal na frequência
lfft = 600;                             % Número de pontos da fft
m1fft = fft(m1,lfft)/lfft;              % Cálculo da fft para a senoide
m2fft = fft(m2,lfft)/lfft;              % Cálculo da fft para a janela
mfft = fft(m,lfft)/lfft;                % Cálculo da fft para sinal com janela
% Definição do eixo das frequências unilateral
freq1 = [0 : fsampling/lfft : fsampling/2 - fsampling/lfft];
m1fftuni = m1fft(1:lfft/2);             % fft unilateral senoide
m2fftuni = m2fft(1:lfft/2);             % fft unilateral janela
mfftuni = mfft(1:lfft/2);               % fft unilateral senoide com janela

%% Plotting
% Senoide discreta no tempo
subplot (3,1,1)
stem(t,m1)
axis([0 2 -1.5 1.5])
% Janela Retangula no tempo
subplot (3,1,2)
stem(t,m2)
axis([0 2 -1.5 1.5])
% Senoide com janela no tempo
subplot (3,1,3)
stem(t,m)
axis([0 2 -1.5 1.5])

figure()

% Senoide discreta na frequência

subplot(3,1,1)
plot(freq1,abs(m1fftuni))
subplot(3,1,2)
plot(freq1,abs(m2fftuni))
subplot(3,1,3)
plot(freq1,abs(mfftuni))



