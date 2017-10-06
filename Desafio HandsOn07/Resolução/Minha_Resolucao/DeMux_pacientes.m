% DeMux_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Multiplexador.mat')

%% Demultiplexação
demux_01 = [];
demux_02 = [];
demux_03 = [];
demux_04 = [];
demux_05 = [];

for i=1:2000
demux_01 (i,:)= mux_sig((i-1)*10 + 1,:);
demux_02 (i,:)= mux_sig((i-1)*10 + 3,:);
demux_03 (i,:)= mux_sig((i-1)*10 + 5,:);
demux_04 (i,:)= mux_sig((i-1)*10 + 7,:);
demux_05 (i,:)= mux_sig((i-1)*10 + 9,:);
end

filename = '/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/DeMux.mat';
save(filename)