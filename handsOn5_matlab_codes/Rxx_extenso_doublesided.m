clc; close all;clear all;

%% Parâmetros do sinal 
N=1000;                                 % Número de amostras
f1=20;                                  % Frequência do seno (kHz)
FS=2000;                                % Frequência de amostragem (kHz)
n=0:N-1;                                % Números de índice de amostra
Am=5;                                   % Determina a amplitude
x=Am*sin(2*pi*f1*n/FS);                 % Gera o sinal x(n)
t=[1:N]*(1/FS);                         % Definiçao do eixo do tempo
f=[-0.5*FS:FS/N:0.5*FS-FS/N];           % Eixo da frequência
%% Cálculo da Autocorrelação

Rxx=zeros(1,2*N);
    for m=1: N+1
        for n=1: N-m+1
            Rxx(m)=Rxx(m)+x(n)*x(n+m-1);
        end;
    end;
    Rxx=Rxx/N;
    for i= 1:N
        Rxx(N+i)= Rxx(N-i+1);
    end
    Rxx1=fftshift(Rxx);      
    Rxx2=xcorr(x);
    Rxx2(1,2*N)=0;
  
%% Plotting
% Plot do sinal
subplot(2,1,1);                         % Coloca o plot em cima
plot(t,x);                              % Plot o sinal x(n)
title('Frequência de seno de 10kHz');
xlabel('Tempo, [s]');
ylabel('Amplitude');
grid;
% Plot da autocorrelação
subplot(2,1,2);                         % Coloca o plot em baixo 
plot(Rxx1);                              % Plota a autocorrelação
title('Autocorrelação');
xlabel('Atrasos');
ylabel('Autocorrelação');
grid;