% CDF.m
clc;clear all; close all;
%% Parâmetros
mu=200;                                                 % Média
sigma =20;                                              % Desvio padrâo
T=0.001;                                                % Taxa de amostragem
x=120:T:280;                                            % Eixo x       
DistNorm=normpdf(x,mu,sigma);                           % Distribuição normal    
cdfplot(DistNorm);                                      % Plot da CDF