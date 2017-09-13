clc; close all;clear all;

%% Parâmetros do sinal 
N=1000;                                 % Número de amostras
f1=10;                                  % Frequência do seno (kHz)
FS=2000;                                % Frequência de amostragem (kHz)
n=0:N-1;                                % Números de índice de amostra
Am=5;                                   % Determina a amplitude
x=Am*sin(2*pi*f1*n/FS);                 % Gera o sinal x(n)
t=[1:N]*(1/FS);                         % Definiçao do eixo do tempo
Rxx=xcorr(x,'biased');                  % Estima / normaliza a autocorrelaçao de x(n)
f=[-0.5*FS:FS/N:0.5*FS-FS/N];           % Eixo da frequência

%% Plotting
% Plota x(n)
subplot(2,1,1);                         % Coloca o plot em cima
plot(t,x);                              % Plot o sinal x(n)
title('Frequência de seno de 10kHz');
xlabel('Tempo, [s]');
ylabel('Amplitude');
grid;
% Plota Autocorrelação
subplot(2,1,2);                         % Coloca o plot em baixo 
plot(Rxx);                              % Plota a autocorrelaçao
title('Autocorrelação');
xlabel('Atrasos');
ylabel('Autocorrelação');
grid;