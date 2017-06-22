clc; clear all; close all;
%% Determinando os parâmetros da onda
t = [0:999]*1e-6;                                               % Definição do vetor tempo
ts=1e-4;                                                        % Definiçao do periodo de amostragem
lfft=length(t);                                                 % Comprimento do vetor t
lfft=2^ceil(log2(lfft));                                        % Transforma o comprimento em potência de 2
m_sig=cos(2*pi*2000*t);                                         % Sinal no tempo
M_freq =fftshift(fft(m_sig,lfft));                              % Sinal na frequência
freqm=(-lfft/2:lfft/2-1)/(lfft*ts);                             % Eixo da frequência
B_m=100;                                                        % largura de banda 100 lateral
h=fir1(80,[B_m*ts]);                                            % Janelamento Hamming

%% Modulação
% Montando o sinal FM no tempo
kf=160*pi;                                                      % Sensibilidade de frequencia 
m_intg=kf*ts*cumsum(m_sig);                                     % Sinal mensagem com Kf
s_fm=cos(2*pi*30000*t+m_intg);                                  % Sinal portadora com m(t)
% Visualizando o sinal na freuqência
lfft=length(t);                                                 % Compriemnto da FFT
lfft=2^ceil(log2(lfft)+1);                                      % Lfft na potencia mais proxima de 2
S_fm=fftshift(fft(s_fm,lfft));                                  % FFT do sinal
freq=(-lfft/2:lfft/2-1)/(lfft*ts);                              % Eixo da frequência

%% Demodulação

s_fmdem=diff([s_fm(1) s_fm])/(ts*kf);                           % Diferenciador repetindo o primeiro elemento do vetor s_fm
s_fmrec=s_fmdem.*(s_fmdem>0);                                   % Parte positiva
s_dec=filter(h,1,s_fmrec);                                      % Filtro passa baixa em 200Hz de banda
subplot(2, 1, 1)
plot(freq,abs(S_fm))
axis([-1000 1000 0 300])

subplot(2 ,1, 2)
plot(t,m_sig,t,s_dec)