clc; close all;clear all;

%% Parâmetros do sinal 
N=1024;                 % Número de amostras
f1=1;                   % Frequência do seno
FS=200;                 % Frequência de amostragem
n=0:N-1;                % Números de índice de amostra
x=sin(2*pi*f1*n/FS);    % Gera o sinal x(n)
t=[1:N]*(1/FS);         % Definiçao do eixo do tempo
Rxx=xcorr(x);           % Estima a autocorrelaçao de x(n)

%% Plot do sinal M(f): single-sided amplitude spectrum via PSD.
subplot(2,1,1);  
% Número de pontos do spectro
lspc = 1000;
% Função spectrum normalizada
yspc = psd(x,lspc)/lspc;
% Definição do eixo das frequências unilateral
freq1 = [1/lspc : FS/lspc : FS/2 ];
% fft unilateral
yspcuni = yspc(1:lspc/2); 
% plotagem do espectro M(f)
% função do espectro de energia
stem(freq1,abs(yspcuni))
% configuração do gráfico
title('Espectro da energia via PSD')
xlabel('Frequência (kHz)')
ylabel('Energia/frequencia')    
% adiona o grid
grid on;
axis([ 0 2 0 0.2])

%% Plot do sinal M(f): single-sided amplitude spectrum.
subplot(2,1,2);  
% Número de pontos do spectro
lspc = 1000;
% Função spectrum normalizada
yspc = fft(Rxx,lspc)/lspc;
% Definição do eixo das frequências unilateral
freq2 = [1/lspc : FS/lspc : FS/2 ];
% fft unilateral
yspcuni = yspc(1:lspc/2); 
% plotagem do espectro M(f)
% função do espectro de energia
stem(freq2,abs(yspcuni))
% configuração do gráfico
title('Espectro da energia via FFT(Rxx)')
xlabel('Frequência (kHz)')
ylabel('Energia/frequencia')
% adiona o grid
grid on;
axis([0 2 0 160])