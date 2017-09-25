clc;clear all;close all;
%% Parâmetros 
n_bits = 200;                               % Numero de bits
T = 100;                                    % Tempo de símbolo OFDM
Ts = 2;                                     % Tempo de símbolo em portadora unica
K = T/Ts;                                   % Numero de subportadoras independentes 
N = 2*K;                                    % DFT de N pontos

%% Gerar bits aleatorios
dataIn=rand(1,n_bits);                      % Sequência de numeros entre 0 e 1 uniformemente distribuidos
dataIn=sign(dataIn-.5);                     % Sequência de -1 e 1
dataInMatrix = reshape(dataIn,n_bits/4,4);  % Conversor serial paralelo

%% Gerar constelaçao 16-QAM
seq16qam = 2*dataInMatrix(:,1) + dataInMatrix(:,2) + 1i*(2*dataInMatrix(:,3)+ dataInMatrix(:,4)); %simbolos 16-QAM
seq16=seq16qam';                            % Transposta de seq16qam
X = [seq16 (seq16(end:-1:1))];              % Para propriedadade da simetria

%% Construindo xn
xn = zeros(1,N);
for n=0:N-1
for k=0:N-1
xn(n+1) = xn(n+1) + 1/sqrt(N)*X(k+1)*exp(1i*2*pi*n*k/N);
end
end
        
%% Construindo xt
xt=zeros(1, T+1);
for t=0:100
for k=0:N-1
xt(1,t+1)=xt(1,t+1)+1/sqrt(N)*X(k+1)*exp(1i*2*pi*k*t/T);
end
end

%% Plotting
plot(abs(xt));
title('Envoltoria de x(t)')
xlabel('Tempo')
ylabel('x(t)')

plot(abs(xt));
hold on
stem(abs(xn), 'r')
hold off
title('Sinais x(t) e xn')
xlabel('Tempo')
axis([0 100 0 9])
fig = gcf; fig.PaperPosition=[0 0 8 5];         % Configuração do recorte da folha





























