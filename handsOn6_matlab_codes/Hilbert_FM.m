clc;clear all;close all;
%% Parâmetros da onda
fc = 6000;                                              % Frequência da portadora
fm = 10;                                                % Frequência do sinal
Am = 1;                                                 % Amplitude do sinal 
Theta = pi/4;                                           % Fase do sinal
Beta = pi/5;                                            % Fase da portadora
Fs = 8*fc;                                              % Frequência de amostragem
duration = 0.5;                                         % Tempo final
t = 0:1/Fs:1-1/Fs;                                      % Eixo do tempo
 
m_t = Am*sin(2*pi*fm*t)+Am*sin(2*pi*0.4*fm*t);                                % Sinal em banda base
kf=160*pi;                                              % Sensibilidade de frequencia 
m_intg=kf*1/Fs*cumsum(m_t);                             % Somatório com Kf
x = cos(2*pi*fc*t +m_intg );                            % Sinal modulado

%% Hilbert
z= hilbert(x);                                          % Forma analítica (real + imaginario)
inst_phase = unwrap(angle(z));                          % Fase instantânea com ajuste para variaçoes bruscas de angulo
p = polyfit(t,inst_phase,1);                            % Ajustar linearmente a fase instantânea
% Reavaliar o termo de compensação usando os valores ajustados
estimated = polyval(p,t);                               
demodulated = inst_phase - estimated;
demodulated=diff([demodulated(1) demodulated])/(1/Fs*kf);
%% plotting
plot(t,m_t,t,demodulated) 
axis([0 1 -5 5])
title('Modulating signal'); xlabel('t'); ylabel('m(t)')
legend('m_t','demodulated')



