clc; clear all; close all;
%% Parâmetros da onda
fs = 600;                                           % Frequencia de amostragem 
t = 0:1/fs:1-1/fs;                                  % Eixo do tempo
m_t = 1+0.7 * sin(2*pi*3*t) ;                       % Sinal m(t)
c_t =cos(2*pi*50*t);                                % Sinal portadora
s_t = m_t .* c_t;                                   % Sinal Modulado em AM-DSB-SC

%% Calcula a transformada de Hilbert 
z = hilbert(s_t);                                   % Forma analítica (real + imaginario)
inst_amplitude = abs(z);                            % Amplitude instantânea
inst_phase = angle(z);                              % Fase instantânea
inst_freq = diff(inst_phase)/(2*pi)*fs;             % Frequência instantânea                                            
regenerated_carrier = cos(inst_phase);              % Regenerando a portadora 

%% Plotting
% Plota o sinal AM e detector de envelope
subplot(2,1,1); 
plot(t,s_t);
hold on;
plot(t,inst_amplitude,'r');                           
title('Sinal modulado e extraido o envelope');
legend('Sinal recuperado','Sinal Modulado');
xlabel('t(s)'); 
ylabel('x(t) and |z(t)|');
% Plota portadora recuperada
subplot(2,1,2); 
plot(cos(inst_phase));
title('Portadora extraida do sinal'); 
xlabel('t(s)'); 
ylabel('cos[\omega(t)]');