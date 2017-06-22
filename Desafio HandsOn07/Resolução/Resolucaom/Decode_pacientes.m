% Decode_pacientes.m
close all; clear all; clc;
%% Dados
load('DeMux.mat')

%% Decodificador binário
vet_dec_rec01 = bi2de(demux_01);
vet_dec_rec02 = bi2de(demux_02);

%% Plotting
subplot(2,1,1)
plot(vet_dec_rec01)

subplot(2,1,2)
plot(vet_dec_rec02)



filename = 'Decode_pacientes.mat';
save(filename)

