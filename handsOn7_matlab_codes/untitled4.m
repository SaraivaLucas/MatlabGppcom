clear all;clc;close all;
%% Parâmetros
p= 0.1;                                                     % Taxa de amostragem original
N_samp=1000;                                                % Número de amostras original
Tf= p*(N_samp-1);                                           % Tempo final
t= 0:p:Tf;                                                  % Eixo do tempo
fm1= 0.4;                                                   % Frequecia senoide 1
fm2= 0.1;                                                   % Frequecia senoide 2
x= sin(2*pi*fm1*t)+sin(2*pi*fm2*t);                         % Sinal banda base
n=20;
%% Amostragem
% Faremos saltos nas amostras pulando valores de forma que no final teremos
% apenas n amostras de x(t). Queremos amostrar um sinal com um número n de
% bits menor que o número original tal que  n < N_samp. Para isso, faremos 
% duas etapas: 
% Primeiro encontraremos o intervalo de bits entre uma amostra e outra, 
% sendo um número inteiro. Deve-se fazer o mesmo para o eixo do tempo.
s_out=downsample(x,n);    
s_out=upsample(s_out,n);                           % Retorna vetor amostrado com o numero inicial de elementos

%% Espectro do sinal amostrado
% Cálculo da frequencia do sinal original
lfft=length(t);
spec=fftshift(abs(fft(x,lfft)/lfft));
Fg = 1/p;
freq = [-Fg/2:Fg/lfft:Fg/2-Fg/lfft];
% Plot do sinal original
subplot(2,2,1);
plot(t,x);
title('Sinal original');
xlabel('Tempo');
ylabel('Amplitude');
subplot(2,2,2)
plot(freq,spec);
title('Espectro do sinal original');
xlabel('Frequência');
ylabel('Amplitude');

% Cálculo da frequência do sinal amostrado
lfft=length(s_out);
spec1 = fftshift(abs(fft(s_out,lfft)/lfft));
Fd = 1/p;
freq = [-Fd/2:Fd/lfft:Fd/2-Fd/lfft];
% Plot do sinal Amostrado
subplot(2,2,3);
plot(t,s_out);
title('Sinal amostrado');
xlabel('Tempo');
ylabel('Amplitude');
subplot(2,2,4)
plot(freq,spec1);
title('Espectro do sinal amostrado');
xlabel('Frequência');
ylabel('Amplitude');