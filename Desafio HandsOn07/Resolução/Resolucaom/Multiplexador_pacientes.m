% Multiplexador_pacientes.m
close all; clear all; clc;
%% Dados
load('Code_lin.mat')

%% Multiplexador de sinais
Zero= zeros(1,5);
for i=1:1:2000
    
mux_sig(4*(i-1)+1,:)    =   vet_bin01(i,:);
mux_sig(4*(i-1)+2,:)    =   Zero;
mux_sig(4*(i-1)+3,:)    =   vet_bin02(i,:);
mux_sig(4*(i-1)+4,:)    =   Zero;

end
%% Save
filename = 'Multiplexador.mat';
save(filename)

