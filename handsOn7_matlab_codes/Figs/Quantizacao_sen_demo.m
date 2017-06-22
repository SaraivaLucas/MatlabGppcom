% Quantizacao_sen_demo.m
clc; clear all;close all;
%% Parâmetros
fs=80000;                                           % Frequência de amostragem
Ts=1/fs;                                            % Período de amostragem
fm=20;                                              % Frequência da onda
Tm=1/fm;                                            % Período de amostragem
t=0:Ts:Tm-Ts;                                       % Eixo do tempo
x=sin(2*pi*20*t);                                   % Sinal x(t)
L=8;                                                % Níveis de quantização
nbits=log2(L);                                      % Pode-se representar com 4 bits

%% Quantização com round()
sig_max=max(x);                                     % Encontra pico máximo
sig_min=min(x);                                     % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                          % Intervalo de quantização (distância entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;      % Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

% Etapas para usar o round()
sigp=x-sig_min;                                     % Joga sinal pra cima
sigp=sigp*(1/Delta);                                % Dá ganho de 1/Delta no sinal (elementos >= 0)
sigp=sigp+1/2;                                      % Tira elementos do zero 
% Agora que nenhum valor do sinal agora é zero nem negativo:
qindex=round(sigp);                                 % Encontra inteiro mais proximo para cada elemento
qindex=min(qindex,L);                               % Trunca o excedente de qindex (Ex: nível 17)
q_out=q_level(qindex);                              % Distribui nos níveis cada elemento

%% Remoção
% Remove de x
q_sub1=x;
for ik=1:1:length(t)
   % a=q_sub(ik)-q_sub(ik+1)
if q_sub1(ik)>=Delta
    q_sub1(1,ik:end)=q_sub1(1,ik:end)-Delta;    
    
end
if q_sub1(ik)<=Delta
    q_sub1(1,ik:end)=q_sub1(1,ik:end)+Delta;
end   
end

%% Intervalos
q_sub1=q_sub1-Delta*3/2;
a=zeros(1,length(t));
b(1,1:length(t))=Delta/2;
c(1,1:length(t))=-Delta/2;
    
%% Plotting
plot (t,q_sub1,t,x,'k',t,a,'k',t,b,'k',t,c,'k')