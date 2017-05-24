clc; clear all; close all;
%% Determinando os parâmetros da onda
Ac = 2;                                                         % Amplitude da portadora
Mu = 0.7;                                                       % Índice de modulação
fc = 25000;                                                     % Frequência da portadora
fm = 2000;                                                      % Frequência do sinal
fs = 1/e-6;                                                     % Frequência de amostragem
t = [0:999]*1e-6;                                               % Definição do vetor tempo
x_am = Ac*(1+Mu*cos(2*pi*fm*t)).*cos(2*pi*fc*t);                % Onda Modulada          
%% Grafico do campo de simulaçao eletrico
lfft=30;
k = [-lfft:lfft];
Nx = length(x_am);                                              % Comprimento do vetor 'x'
Nk = length(k);                                                 % Comprimento do vetor 'k'
c = zeros(1,Nk);                                                % Define vetor da frequencia como um vetor zeros de comprimento k
Xk = fft(x_am)/Nx;                                              % Normalizando a FFT
%% Colocando a fft em 30 pontos
  for i = 1:Nk-1,
    kk = k(i);
    if (kk >= 0),
      c(i) = Xk(kk+1);
    else
      c(i) = Xk(Nx+1+kk);  
    end;  
  end;  
%% Plotting
stem(k,real(c))
title('Sinal na frequência')
xlabel('kHz')
figure 
plot (t,x_am)
xlabel('(s)')