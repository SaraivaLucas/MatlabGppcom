% Code_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Quantizacao.mat')

%% Codificador binário
% Codificando sinal 01
vet_bin01 = de2bi(qindex01-1);
% Codificando sinal 02
vet_bin02 = de2bi(qindex02-1);
% Codificando sinal 03
vet_bin03 = de2bi(qindex03-1);
% Codificando sinal 04
vet_bin04 = de2bi(qindex04-1);
% Codificando sinal 05
vet_bin05 = de2bi(qindex05-1);

filename = '/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Code_lin.mat';
save(filename)