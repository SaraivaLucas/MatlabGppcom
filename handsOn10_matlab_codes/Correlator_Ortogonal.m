clc;clear all;close all;
%% Parametros
K=20;                                               % Número de amostras
A=1;                                                % Amplitude do sinal
l=0:K;                                              % Eixo amostras
% Definindo forma de onda
s_0=A*ones(1,K);                                    % Sinal 1: Um degrau
s_1=[A*ones(1,K/2) -A*ones(1,K/2)];                 % Sinal 2: Soma de degraus
% Inicializando sinais de saida
r_0=zeros(1,K);                                     % Inicializa vetor r_0
r_1=zeros(1,K);                                     % Inicializa vetor r_1
Variancia = [0 0.1 1];                              % Variâncias

%% Cálculo
% Queremos estimar 
for  ik=1:3
noise=random('Normal',0,Variancia(ik),1,K);          % Gera vetor de ruído
%% Quando s_0 é transmitido
s=s_0;                                              % Sinal enviado
r=s+noise;                                          % Sinal recebido
% Correlacionando sinais
for n=1:K
        r_0(n)=sum(r(1:n).*s_0(1:n));
        r_1(n)=sum(r(1:n).*s_1(1:n));        
end
%% Plotting 
subplot(3,2,-1+2*ik)
hold on
plot(l,[0 r_0],'-')
plot(l,[0 r_1],'--')
set(gca,'XTickLabel',{'0','10Tb','20Tb'})
axis([0 20 -5 30])
xlabel(['\sigma^{2}= ' num2str(Variancia(ik)) ' & s_{0} é transmitido'])

%% Quando s_1 é transmitido
s=s_1;                                              % Sinal enviado
r=s+noise;                                          % Sinal recebido
for n=1:K
        r_0(n)=sum(r(1:n).*s_0(1:n));
        r_1(n)=sum(r(1:n).*s_1(1:n));       
end

%% Plotting 
subplot(3,2,2*ik)
hold on
plot([0 r_0],'-')
plot([0 r_1],'--')
set(gca,'XTickLabel',{'0','10Tb','20Tb'})
axis([0 20 -5 30])
xlabel(['\sigma^{2}= ' num2str(Variancia(ik)) ' & s_{1} é transmitido'])
end


