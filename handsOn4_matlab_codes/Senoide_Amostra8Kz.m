clc; close all;clear all;
%% Geração do sinal cosenoidal
% Taxa de amostragem
fsampling = 10; % kHz
% Escala temporal 
tf = 200; % segundos
t = 0 : (1/fsampling) : tf;
% frequência do sinal m(t)
fm = 0.04;
% amplitude do sinal m(t)
Am = 2;
% geração de amostras do sinal m(t)
m = Am*cos(2*pi*fm*t);
% A função 'whos' é responsável por especificar todas as variáveis que foram
% definidas no seu workspace, citando suas principais caracteristicas.


%% Gráfico do coseno com linha de espessura igual a 2
plot(t,m,'linewidth',2);
% Definição do texto do eixo X
xlabel('Tempo');
% Definição do texto do eixo Y
ylabel('Amplitude');
% Para acionar o grid do gráfico
grid on;
% para o zoom em dois períodos da onda
axis([0 2*(1/fm) -2 2])


%% Definição de nova taxa de amostragem = 0.08
% Comando para plotar linhas no mesmo gráfico
hold on;
% Taxa de amostragem
fsampling = 0.08; % kHz
t2 = 0 : (1/fsampling) : tf;
% Geração de amostras do sinal m(t) com nova taxa de amostragem
m2 = Am*cos(2*pi*fm*t2);
%% Visualização do sinal cosenoidal
% Gráfico do coseno com linha de espessura igual a 2 e cor vermelha e
% Marcador diamante
plot(t2,m2,'r-s','linewidth',2); 