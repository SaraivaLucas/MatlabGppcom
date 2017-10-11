clc;clear all;close all;
%% Parametros
K=20;                                               % Número de amostras
A=1;                                                % Amplitude do sinal
l=0:K;                                              % Eixo amostras

%% Definindo forma de onda dos símbolos
s_0=A*ones(1,K);                                    % Sinal 1: Um degrau
s_1=[A*ones(1,K/2) -A*ones(1,K/2)];                 % Sinal 2: Soma de degraus

%% Gerando filtro casado
h_0=s_0;                                            % Gera resposta h_0
for i=1:K
h_1(i)=s_1(K-i+1);                                  % Gera resposta h_1
end

%% Operando a convolução filtro-sinal sem ruído
s=s_0;                                              % Sinal a ser enviado
for n=1:K
        r_0(n)=sum(s_0(1:n).*h_0(1:n));             % Somatório 
        r_1(n)=sum(s_0(1:n).*h_1(1:n));             % Somatório
end

%% Plot do resultado
subplot(2,1,1)
plot(l,[0 r_0])
xlabel('Eixo das amostras')
ylabel('Pico em A^{2}T_{b}')
title('Saída do Filtro quando s_0 é enviado ')
 

subplot(2,1,2)
plot(l,[0 r_1])
xlabel('Eixo das amostras')
ylabel('Pico em A^{2}T_{b}/2')
title('Saída do Filtro quando s_0 é enviado')

