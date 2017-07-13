% Distnorm.m
clc;clear all; close all;
%% Parâmetros
mu=0;                                                   % Média
sigma =0.5;                                             % Desvio padrâo
T=0.001;                                                % Taxa de amostragem
x=-2:T:2;                                               % Eixo x       
DistNorm=normpdf(x,mu,sigma);                           % Distribuição normal    
indices = (max(find(x<-sigma)):min(find(x>sigma)));     % Encontra o local que se deseja estimar
prob1=sum(DistNorm(indices))*T*100                      % Probabilidade de um evento ocorrer no intervalo
plot(x,DistNorm);                                       
hold on
area(x(indices),DistNorm(indices))                      % Probabilidade 