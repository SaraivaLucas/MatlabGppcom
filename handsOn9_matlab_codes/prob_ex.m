% prob_ex.m
clc;clear all; close all;
%% Parâmetros
mu=5000;                                                % Média
sigma =40;                                              % Desvio padrâo
T=0.001;                                                % Taxa de amostragem
x=4800:T:5200;                                          % Eixo x       
DistNorm=normpdf(x,mu,sigma);                           % Distribuição normal    
indices = (max(find(x<(38+mu))):max(find(x>(38+mu))));  % Encontra o local que se deseja estimar
prob1=sum(DistNorm(indices))*T*100                      % Probabilidade de um evento ocorrer no intervalo
plot(x,DistNorm);                               
title(['Probabilidade de ' num2str(prob1) '%'])
xlabel('Anos')
ylabel('Distribuiçao de probabilidade')
hold on
area(x(indices),DistNorm(indices))                      % Probabilidade 