clc; close all;clear all;
%% Geração do sinal cosenoidal
% Taxa de amostragem
fsampling = 10; % kHz
% Escala temporal 
tf = 200; % segundos
t = 0 : (1/fsampling) : tf;
% frequência do sinal m(t)
fm = 0.04;
% amplitude do sinal m(t)
Am = 2;
% geração de amostras do sinal m(t)
m = Am*cos(2*pi*fm*t);
% Gráfico do coseno com linha de espessura igual a 2
plot(t,m,'linewidth',2);
% Definição do texto do eixo X
xlabel('Tempo');
% Definição do texto do eixo Y
ylabel('Amplitude');
% Para acionar o grid do gráfico
grid on;
% Para o zoom em dois períodos da onda
axis([0 2*(1/fm) -2 2])


%% Visualizando a amplitude do espectro com um tamanho arbitrário para a fft
lfft = 512;
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
% Plotagem do espectro M(f)
stem(freq1,abs(yfftuni))
% Configuração do gráfico
title('Amplitude unilateral do Espectro de m(t)')
xlabel('Frequencia (kHz)')
ylabel('|M(f)|')
% Adiona o grid
grid on;
axis([ 0 0.1 0 1.2])