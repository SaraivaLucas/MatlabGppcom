% Multiplexador_pacientes.m
close all; clear all; clc;
%% Dados
load('/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Code_lin.mat')
numero_bits=4;
n_pacientes=5;
nump=n_pacientes*2;

%% Multiplexador para 5 sinais
Zero= zeros(1,numero_bits);
for i=1:1:2000
mux_sig(nump*(i-1)+1,:)    =   vet_bin01(i,:);
mux_sig(nump*(i-1)+2,:)    =   Zero;
mux_sig(nump*(i-1)+3,:)    =   vet_bin02(i,:);
mux_sig(nump*(i-1)+4,:)    =   Zero;
mux_sig(nump*(i-1)+5,:)    =   vet_bin03(i,:);
mux_sig(nump*(i-1)+6,:)    =   Zero;
mux_sig(nump*(i-1)+7,:)    =   vet_bin04(i,:);
mux_sig(nump*(i-1)+8,:)    =   Zero;
mux_sig(nump*(i-1)+9,:)    =   vet_bin05(i,:);
mux_sig(nump*(i-1)+10,:)   =   Zero;
end

%% Save
filename = '/home/labsim/python-gppcom/Desafio HandsOn07/Resolução/Minha_Resolucao/Multiplexador.mat';
save(filename)




