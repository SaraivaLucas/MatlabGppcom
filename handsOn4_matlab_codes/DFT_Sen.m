clc; close all;clear all;
%% Geração do sinal cosenoidal
fsampling = 10; 
T =1/fsampling;                               % Periodo de amostragem
L = 2000;                                     % Número de amostras
t = 0 : (1/fsampling) : (L-1)*T;              % Eixo do tempo
fm = 0.04;                                    % Frequência da senoide
Am = 2;                                       % Amplitude
m = Am*cos(2*pi*fm*t);                        % Sinal senoidal

%% Montando a DFT
N=length(m);                                          % Comprimento do sinal m(t)
n=0:N-1;
k=0:N-1;                                              % Amostra de tempo
WN=exp(-j*2*pi/N);                                  
nn=n'*k;

WNnk=WN.^nn;                                          % Calcula a DFT Matriz
X=m*WNnk/L;

f = fsampling/2*linspace(0,1,(L/2)+1);  

figure;
stem(f,2*abs(X(1:L/2+1)));          
axis([ 0 0.1 0 2.2])
