% tutorial sobre geração e visualização de sinais com o Matlab
% Autor: Prof. Vicente Angelo de Sousa Junior
% Data: 17/04/2013
% GppCom/DCO/UFRN, Natal/RN
% Limpa tela, fechar todos os gráficos, limpa todas as variáveis
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
 
whos