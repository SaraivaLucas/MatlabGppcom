clc; clear all; close all;
%% Determinando os parâmetros da onda
Ts=1e-4;                                                    % Período de amostragem
fs=1/Ts;                                                    % Frequencia de amostragem
t = [0:5e3]*Ts;                                             % Definição do vetor tempo
fc = 500;                                                   % Frequencia da portadora.
fm = 150;                                                   % Frequencia do sinal
Am=1;                                                       % Amplitude do sinal senoidal
Ac=1;                                                       % Amplitude da portadora
Mu = Am/Ac;                                                 % Indice de modulaçao.
carrierc = Ac*cos(2*pi*fc*t);                               % Sinal portadora cosseno
carriers = Ac*sin(2*pi*fc*t);                               % Sinal portadora seno
m1_t = Am*cos(2*pi*fm*t).*exp(-t*5);                        % Sinal mensagem
m2_t = Am*exp(-t*40);                                       % Sinal mensagem
B_m=150;                                                    % Banda para filtragem 
h=fir1(40,[B_m*Ts]);                                        % Janelamento Hamming da banda
lfft = length(t);                                           % FFT com o mesmo comprimento do sinal (t , m1_t e m2_t)
lfft = 2^ceil(log2(lfft)+1);                                % Comprimento da FFT em potência de 2
freqm = (-fs/2:fs/lfft:fs/2-fs/lfft);                       % Eixo da frequência 
M1 = fftshift(fft(m1_t,lfft)/lfft);                         % Sinal m1_t na frequência
M2 = fftshift(fft(m2_t,lfft)/lfft);                         % Sinal m2_t na frequência
%% Modulação QAM
% Modulação - Soma de duas DSB-SC ortogonais
x_qam = (m1_t).*(carrierc)+(m2_t).*(carriers);              % Sinal QAM no tempo
% Sinal na frequência 
lfft = length(t);                                           % FFT com o mesmo comprimento do sinal (t , m1_t e m2_t)
lfft = 2^ceil(log2(lfft)+1);                                % Comprimento da FFT em potência de 2
X_QAM=fftshift(fft(x_qam,lfft)/lfft);                       % Sinal QAM na frequência
freqm = (-fs/2:fs/lfft:fs/2-fs/lfft);                       % Eixo da frequência 

%% Demodulação
% Separando sinais
m1_dem = x_qam.*cos(2*pi*fc*t)*2;                           % Demodulando m1_t
m2_dem = x_qam.*sin(2*pi*fc*t)*2;                           % Demodulando m2_t
M1_dem = fftshift(fft(m1_dem,lfft)/lfft);                   % m1_t na frequência com portadora
M2_dem = fftshift(fft(m2_dem,lfft)/lfft);                   % m2_t na frequência com portadora

% Filtro passa baixa
m1_rec=filter(h,1,m1_dem);                                  % Filtrando m1_dem em Hamming
M1_rec=fftshift(fft(m1_rec,lfft)/lfft);                     % Calculando o sinal recebido m1_rec na frequência
m2_rec=filter(h,1,m2_dem);                                  % Filtrando m2_dem em Hamming
M2_rec=fftshift(fft(m2_rec,lfft)/lfft);                     % Calculando o sinal recebido m2_rec na frequência
m1_rec = (max(m1_t)/max(m1_rec))*m1_rec;                    % Amplificando o sinal m1_rec
m2_rec = (max(m1_t)/max(m2_rec))*m2_rec;                    % Amplificando o sinal m2_rec

%% Plotting
% Sinal m1_t e m2_t na frequência
subplot(3,2,[1,2])
plot(freqm,abs(X_QAM))
title('Sinal modulado na frequência')
axis([-1500 1500 0 0.03 ])

subplot(3,2,3)
plot(freqm,abs(M1))
title('m1 - Frequencia ')
axis([-1500 1500 0 0.03 ])

subplot(3,2,4)
plot(freqm,abs(M1_rec))
title('M1_rec - Frequencia ')
axis([-1500 1500 0 0.03 ])

subplot(3,2,5)
plot(freqm,abs(M2))
title('m2 - Frequencia ')
axis([-1500 1500 0 0.03 ])

subplot(3,2,6)
plot(freqm,abs(M2_rec))
title('M2_rec - Frequencia ')
axis([-1500 1500 0 0.03 ])

figure()
% Sinal m1_t e m2_t no tempo
subplot(3,1,1)
plot (t,x_qam)    
title('Sinal modulado no Tempo')
axis([0 0.08 -1.2 1.2 ])

subplot(3,1,2)
plot (t,m1_t,t,m1_rec)    
title('Sinal gerado sinal demodulado m1 - Tempo')
legend('m1(t) Gerado','m1(t) Demodulado');
axis([0 0.08 -1.2 1.2 ])

subplot(3,1,3)
plot (t,m2_t,t,m2_rec)    
title('Sinal gerado sinal demodulado m2 - Tempo')
legend('m2(t) Gerado','m2(t) Demodulado');
axis([0 0.08 -1.2 1.2 ])