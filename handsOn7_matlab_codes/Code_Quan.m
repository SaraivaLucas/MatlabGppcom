% Code_Quan.m
clc; clear all;close all;
%% Parâmetros
load('Quantizacao.mat');

%% Codificador binário
%Colocando valores em números inteiros e positivos
sig_quan=q_out*L;                                   % Coloca numeros inteiros
sig_quan= sig_quan-min(sig_quan)+1;                 % Todos elementos positivos
sig_quan= round(sig_quan);                          % Caso haja erros, regenera sinal perfeitamente pra inteiros
vet_bin=[];                                         % Inicializa vetor vazio (nenhum elemento)
%Transforma em binário e junta todos elementos
for i=1:length(sig_quan)    
ele_bin = de2bi(sig_quan(i),[L],2 );                % Transforma cada elemento em binário
ele_bin = flip(ele_bin);                            % Inverte a ordem dos elementos
vet_bin= [vet_bin ele_bin ];                        % Acrescenta ao vetor cada elemento em binário
end

%% Decodificador binário
revert = [];                                        % Inicializa vetor vazio (nenhum elemento)
%Recebe de 8 em 8 elementos 
for i=1:length(sig_quan)                        
elemento = vet_bin(1,L*i-(L-1):i*L);
elemento = flip(elemento);
elemento = bi2de(elemento);
revert=[revert elemento];
end
revert = revert-L;
revert = revert/L - 1;
plot (t, revert)