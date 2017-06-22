% DeMux_pacientes.m
close all; clear all; clc;
%% Dados
load('Multiplexador.mat')

%% Demultiplexação
demux_01 = [];
demux_02 = [];

for i=1:2000
demux_01 (i,:)= mux_sig((i-1)*4 + 1,:);
demux_02 (i,:)= mux_sig((i-1)*4 + 3,:);
end

filename = 'DeMux.mat';
save(filename)