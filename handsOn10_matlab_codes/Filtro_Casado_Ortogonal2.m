clc;clear all;close all;
%% Parametros
K=20;                                               % Número de amostras
A=1;                                                % Amplitude do sinal
l=0:K;                                              % Eixo amostras
Variancia=[0 0.1 1];                                % Vetor de variâncias de ruído

%% Definindo forma de onda dos símbolos
s_0=A*ones(1,K);                                    % Sinal 1: Um degrau
s_1=[A*ones(1,K/2) -A*ones(1,K/2)];                 % Sinal 2: Soma de degraus

%% Filtragem
for ik= 1:3    
noise = random('Normal',0,Variancia(ik),1,K);       % Vetor com ruído
%% Quando s_0 é transmitido
s=s_0;                                              % Sinal enviado
y=s+noise;                                          % Sinal recebido
y_0=conv(y,wrev(s_0));                              % Concolução filtro casado saída 0
y_1=conv(y,wrev(s_1));                              % Concolução filtro casado saída 1

%% Plotting
subplot(3,2,-1+2*ik)
plot(l,[0 y_0(1:K)],'- k',l,[0 y_1(1:K)],'-- k')
set(gca,'XTickLabel',{'0','10T_{b}','20T_{b}'})
axis([0 20 -30 30 ])
xlabel([' \sigma^{2}= ' num2str(Variancia(ik)) ' & s_{0} é transmitido'])

%% Quando s_1 é transmitido
s=s_1;                                              % Sinal enviado
y=s+noise;                                          % Sinal recebido
y_0=conv(y,wrev(s_0));                              % Concolução filtro casado saída 0
y_1=conv(y,wrev(s_1));                              % Concolução filtro casado saída 1

%% Plotting 
subplot(3,2,2*ik)
plot(l,[0 y_0(1:K)],'- k',l,[0 y_1(1:K)],'-- k')
set(gca,'XTickLabel',{'0','10T_{b}','20T_{b}'})
axis([0 20 -30 30 ])
xlabel(['\sigma^{2}= ' num2str(Variancia(ik)) ' & s_{1} é transmitido'])
end


