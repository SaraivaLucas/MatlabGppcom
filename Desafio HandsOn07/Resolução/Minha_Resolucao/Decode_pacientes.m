% Decode_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/DeMux.mat')

%% Decodificador binário
vet_dec_rec01 = bi2de(demux_01);
vet_dec_rec02 = bi2de(demux_02);
vet_dec_rec03 = bi2de(demux_03);
vet_dec_rec04 = bi2de(demux_04);
vet_dec_rec05 = bi2de(demux_05);

%% Plotting
subplot(2,3,1)
plot(vet_dec_rec01)

subplot(2,3,2)
plot(vet_dec_rec02)

subplot(2,3,3)
plot(vet_dec_rec03)

subplot(2,3,4)
plot(vet_dec_rec04)

subplot(2,3,5)
plot(vet_dec_rec05)

filename = '/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Decode_pacientes.mat';
save(filename)

