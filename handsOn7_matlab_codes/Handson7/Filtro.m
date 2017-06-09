% Filtro.m
clear all;clc;close all;
%% Parâmetros da Sinc
B=100;                                                      % Banda do filtro
Ts=1/(200*pi*B);                                            % Taxa de geração (Passo no tempo)
Fs=1/Ts;                                                    % Frequência de amostragem
N=10000;                                                    % Número de amostras
tf=N*Ts;                                                    % Tempo final
t=-tf:Ts:tf;                                                % Eixo do tempo
Am=2*Ts*B;                                                  % Amplitude do sinal
s= Am*sinc(2*B*t);                                          % Sinc 
m=cos(2*pi*200*t)+cos(2*pi*80*t);                           % Sinal m(t)

%% Convolução
c=conv(s,m);                                                % Calcula a convolução
c=c(1,(length(t)-1)/2:3*(length(t)-1)/2);                   % Ajusta o tamanho do vetor (/2)
    
%% Espectros de frequência
lfft=length(s);                                             % Comprimento da FFT
S=fftshift(fft(s,lfft)/lfft);                               % Sinc S(f)
M=fftshift(fft(m,lfft)/lfft);                               % Sinal M(f) 
C=fftshift(fft(c,lfft)/lfft);                               % Sinal M(f) 
freq= -Fs/2:Fs/lfft:Fs/2-Fs/lfft;                           % Eixo da frequência


%% Plotting 
% Plot do Sinal no tempo
subplot(3,2,1)                                      
plot(t,m)                  
axis([-0.15 0.15 -2 2])
% Plot do Sinal na frequência                   
subplot(3,2,2)                                      
plot(freq,abs(M))        
axis([-800 800 0 0.5])
%------------------------------------
% Plot do Sinc no tempo
subplot(3,2,3)                                      
plot(t,s)    
axis([-0.08 0.08 -1e-3 4e-3])
% Plot do Sinc na frequência                   
subplot(3,2,4)                                      
plot(freq,abs(S))       
axis([-400 400 0 6e-5])
%------------------------------------
% Plot da convolução no tempo                                
subplot(3,2,5)
plot(t,c)      
axis([-0.15 0.15 -2 2])
% Plot da convolução na frequência   
subplot(3,2,6)
plot(freq,abs(C))
axis([-800 800 0 0.5])