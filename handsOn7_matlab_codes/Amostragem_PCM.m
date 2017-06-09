clear all;clc;close all;
%% Parâmetros
p= 0.1;                                                     % Taxa de amostragem original
N_samp= 200;                                                % Número de amostras original
Tf= p*(N_samp-1);                                           % Tempo final
t= 0:p:Tf;                                                  % Eixo do tempo
fm1= 0.4;                                                   % Frequecia senoide 1
fm2= 0.1;                                                   % Frequecia senoide 2
x= sin(2*pi*fm1*t)+sin(2*pi*fm2*t);                         % Sinal banda base

%% Amostragem
% Faremos saltos nas amostras pulando valores de forma que no final teremos
% apenas n amostras de x(t). Queremos amostrar um sinal com um número n de
% bits menor que o número original tal que  n < N_samp. Para isso, faremos 
% duas etapas: 
% Primeiro encontraremos o intervalo de bits entre uma amostra e outra, 
% sendo um número inteiro. Deve-se fazer o mesmo para o eixo do tempo.

n=50;                                                       % Número de amostras (sinal amostrado)
Ts_samp = ceil(length(x)/n);                                % Elementos "pulados" para ter 50 amostras
x_samp = x(1:Ts_samp:end);                                  % Sinal amostrado com intervalo de 4 elementos
t_samp = t(1:Ts_samp:end);                                  % Tempo amostrado com intervalo de 4 elementos
Ts = t_samp(2)-t_samp(1);                                   % Taxa de amostragem t(i)-t(i-1)

% Em seguida deve-se distribuir as amostras coletadas (50 amostras) em 200
% amostras. Processo de distribuição das amostras:
x_sampled_with_zeros = zeros(1,N_samp);                     % Cria vetor zeros para x(t) (200 amostras)
x_sampled_with_zeros(1:Ts_samp:end) = x(1:Ts_samp:end);     % Distribui as amostras coletadas no vetor sinal
% plot(x_sampled_with_zeros)                                % Observar como ficou x_sampled_with_zeros

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
lfft=length(x_sampled_with_zeros);
spec = fftshift(abs(fft(x_sampled_with_zeros,lfft)/lfft));
Fd = 1/Ts;
freq = [-Fd/2:Fd/lfft:Fd/2-Fd/lfft];
% Plot do sinal Amostrado
subplot(2,2,3);
plot(t,x_sampled_with_zeros);
title('Sinal amostrado');
xlabel('Tempo');
ylabel('Amplitude');
subplot(2,2,4)
plot(freq,spec);
title('Espectro do sinal amostrado');
xlabel('Frequência');
ylabel('Amplitude');