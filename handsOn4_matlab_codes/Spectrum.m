clc; close all;clear all;

%% Geração do sinal cosenoidal
fsampling = 10; % kHz
tf = 200; % segundos
t = 0 : (1/fsampling) : tf;
fm = 0.04;
Am = 1;
% Sinal com frequencia 2x fm
m = Am*cos(2*pi*fm*t)+ Am*cos(2*pi*(2)*fm*t);
% Colocando ruido
m= m + randn(size(t));

%% Gráfico do coseno com ruído
subplot(2,1,1)
plot(t,m);
title('Sinal com ruido')
xlabel('Tempo');
ylabel('Amplitude');
grid on;
axis([0 2*(1/fm) -3 3])

%% Plot do sinal M(f): single-sided amplitude spectrum.
% Número de pontos do spectro
lspc = 1000;
% frequência de amostragem
fsampling = 10;
% Função spectrum normalizada
yspc = spectrum(m,lspc)/lspc;
% Definição do eixo das frequências unilateral
freq1 = [0 : fsampling/lspc : fsampling/2 - fsampling/lspc];
% fft unilateral
yspcuni = yspc(1:lspc/2); 
% plotagem do espectro M(f)
subplot(2,1,2)
% função do espectro de energia
stem(freq1,abs(yspcuni))
% configuração do gráfico
title('Espectro de energia')
xlabel('Frequencia (kHz)')
ylabel('Energia/frequencia')
% adiona o grid
grid on;
axis([ 0 0.1 0 0.2])
