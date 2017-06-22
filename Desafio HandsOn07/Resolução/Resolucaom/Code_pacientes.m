% Code_pacientes.m
close all; clear all; clc;
%% Dados
load('Quantizacao.mat')

%% Colocando números em inteiros e positivos 
% Ajustando sinal 01
sig_quan01=q_out01*L;                                   % Coloca numeros inteiros
sig_quan01= sig_quan01-min(sig_quan01)+1;               % Todos elementos positivos
sig_quan01= round(sig_quan01);                          % Caso haja erros, regenera sinal perfeitamente pra inteiros

% Ajustando sinal 02
sig_quan02=q_out02*L;                                   % Coloca numeros inteiros
sig_quan02= sig_quan02-min(sig_quan02)+1;               % Todos elementos positivos
sig_quan02= round(sig_quan02);                          % Caso haja erros, regenera sinal perfeitamente pra inteiros

%% Codificador binário
% Codificando sinal 01
vet_bin01 = de2bi(sig_quan01);
% Codificando sinal 02
vet_bin02 = de2bi(sig_quan02);

filename = 'Code_lin.mat';
save(filename)