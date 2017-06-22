% SQNR_PCM.m
clc; clear all; close all;
%% Parâmetros
load('Quantizacao.mat')                                 % Recupera dados de Quantização.mat
SQNR=20*log10(norm(s_out)/norm(s_out-q_out))            % Valor atual de SQNR