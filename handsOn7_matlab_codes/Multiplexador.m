% Multiplexador.m
clc; clear all;close all;
%% Parâmetros dos sinais
t=0:0.01:10;
f1=0.5;
f2=0.2;
sinal01=10*cos(2*pi*f1*t);
sinal02=10*cos(2*pi*f2*t);

%% Codificador de sinais
% Ajustando sinal 01
sig_quan01= sinal01-min(sinal01)+1;                     % Todos elementos positivos
sig_quan01= round(sig_quan01);                          % Transforma sinal em números inteiros
sig_code01= de2bi (sig_quan01);                         % Transforma em sinal binário 
% Ajustando sinal 02
sig_quan02= sinal02-min(sinal02)+1;                     % Todos elementos positivos
sig_quan02= round(sig_quan02);                          % Transforma sinal em números inteiros
sig_code02= de2bi (sig_quan02);                         % Transforma em sinal binário 

%% Multiplexador de sinais
Zero= zeros(1,5);
for i=1:1:1000
    
mux_sig(4*(i-1)+1,:)    =   sig_code01(i,:);
mux_sig(4*(i-1)+2,:)    =   Zero;
mux_sig(4*(i-1)+3,:)    =   sig_code02(i,:);
mux_sig(4*(i-1)+4,:)    =   Zero;

end
%% Demultiplexação
demux_01 = [];
demux_02 = [];

for i=1:1000
demux_01 (i,:)= mux_sig((i-1)*4 + 1,:);
demux_02 (i,:)= mux_sig((i-1)*4 + 3,:);
end

sig_rec01 = bi2de(demux_01);
sig_rec02 = bi2de(demux_02);