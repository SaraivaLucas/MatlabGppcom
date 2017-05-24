clc; close all;clear all;
%% Geração do sinal cosenoidal
% Taxa de amostragem
fsampling = 10; % kHz
% Escala temporal 
tf = 200; % segundos
t = 0 : (1/fsampling) : tf;
% Frequência do sinal m(t)
fm = 0.04;
% Amplitude do sinal m(t)
Am = 2;
% Geração de amostras do sinal m(t)
m = Am*cos(2*pi*fm*t);

%% Visualização do sinal cosenoidal
% Gráfico do coseno com linha de espessura igual a 2
plot(t,m,'linewidth',2);
% Definição do texto do eixo X
xlabel('Tempo');
% Definição do texto do eixo Y
ylabel('Amplitude');
% Para acionar o grid do gráfico
grid on;
% para o zoom em dois períodos da onda
axis([0 2*(1/fm) -2 2])