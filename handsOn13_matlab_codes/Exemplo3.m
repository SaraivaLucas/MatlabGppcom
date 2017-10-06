clc;clear all;close all;
%% Parâmetros
n_bits = 200;                                       % Numero de bits
T = 100;                                            % Tempo de símbolo OFDM
Ts = 2;                                             % Tempo de símbolo em portadora unica
K = T/Ts;                                           % Numero de subportadoras independentes
N = 2*K;                                            % DFT de N pontos
variance=input('Forneca o valor da variancia: ');   % Variância do ruido

%% Gerar bits aleatorios
dataIn=rand(1,n_bits);                              % Sequência de números entre 0 e 1 uniformemente distribuidos
dataIn=sign(dataIn-.5);                             % Sequência de -1 e 1
dataInMatrix = reshape(dataIn,n_bits/4,4);          % Conversor serial paralelo

%% Gerar constelaçao 16-QAM
seq16qam = 2*dataInMatrix(:,1) + dataInMatrix(:,2) + 1i*(2*dataInMatrix(:,3)+ dataInMatrix(:,4)); % Símbolos 16-QAM
seq16=seq16qam';
X = [seq16 conj(seq16(end:-1:1))];                  % Para propriedadade da simetria

%% Construindo xn
xn = zeros(1,N);
for n=0:N-1
for k=0:N-1
xn(n+1) = xn(n+1) + 1/sqrt(N)*X(k+1)*exp(1i*2*pi*n*k/N);
end
end

%% Adição de ruido
noise = sqrt(variance)*randn(1,N)+1i*sqrt(variance)*randn(1,N); % Adcionando Ruido
rn = xn+noise;% sinal recebido = xn+ruido

%% Cálculo da DFT
Y = zeros(1,K); %prealocação de Y
%DFT de rn
for k=0:K-1
for n=0:N-1
Y(1,k+1) = Y(1,k+1) + 1/sqrt(N)*rn(n+1)*exp(-1i*2*pi*k*n/N);
end
end

%% Plotting
scatterplot(Y)
figure
hold on
figure
scatter(real(seq16),imag(seq16), 'r', '+')
hold off
title(['Sinal com ruido de variancia ', num2str(variance)])