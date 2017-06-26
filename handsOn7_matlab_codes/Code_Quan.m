% Code_Quan.m
clc; clear all;close all;
%% Parâmetros
load('Quantizacao.mat');

%% Codificador binário
% Colocando números em inteiros e positivos 
sig_quan=q_out*L;                                   % Coloca números inteiros
sig_quan= sig_quan-min(sig_quan)+1;                 % Todos elementos positivos
sig_quan= round(sig_quan);                          % Caso haja erros, regenera sinal perfeitamente pra inteiros
vet_bin = de2bi(sig_quan);                          % Codificando sinal 

%% Decodificador de binário
vet_dec_rec = bi2de(vet_bin);                       % Transforma sinal para decimal novamente
revert = vet_dec_rec/L-2;                           % Desfaz os ajustes da codificação
plot (t, revert,t,q_out)
legend('revert','qout')