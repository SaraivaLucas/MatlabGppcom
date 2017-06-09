clear all;clc;close all;
%% Parâmetros
p= 0.1;                                                     % Passo de tempo
N_samp= 200;                                                % Número de amostras (sinal puro)
Tf= p*(N_samp-1);                                           % Tempo final
t= 0:p:Tf;                                                  % Eixo do tempo
fm1= 0.4;                                                   % Frequecia senoide 1
fm2= 0.1;                                                   % Frequecia senoide 2
x= sin(2*pi*fm1*t)+sin(2*pi*fm2*t);                         % Sinal banda base
B=max(fm1,fm2);                                             % Largura mínima de banda

%% Amostragem
% Faremos saltos nas amostras pulando valores de forma que no final teremos
% apenas n amostras de x(t). Para isso, faremos duas etapas. Primeiro
% criaremos um vetor com um número de amostras menor, e em seguida faremos
% a distribuição dessas coletadas num vetor de mesmo número de amostras do
% vetor inicial. No sinal resultante x_sampled a impressão que teremos é
% que este foi zerado em alguns pontos das suas amostras:

n=50;                                                       % Número de amostras (sinal amostrado)
Ts_samp = ceil(length(x)/n);                                % Elementos "pulados" para ter 50 amostras
x_samp = x(1:Ts_samp:end);                                  % Sinal amostrado com intervalo de 4 elementos
t_samp = t(1:Ts_samp:end);                                  % Tempo amostrado com intervalo de 4 elementos
Ts = t_samp(2)-t_samp(1);                                   % Período de amostragem

% Processo de distribuição das amostras
x_sampled = zeros(1,N_samp);                                % Cria vetor zeros para x(t)
x_sampled(1:Ts_samp:end) = x(1:Ts_samp:end);                % Distribui as amostras no vetor
% plot(x_sampled)

%% Estpectro
lfft=length(x_sampled);
spec = fftshift(abs(fft(x_sampled,lfft)/lfft));
Fd = 1/Ts;
freq = [-Fd/2:Fd/lfft:Fd/2-Fd/lfft];

%% Reconstrução do sinal 
% A partir de aqui, faremos a reconstrução do sinal sem usar qualquer
% informação anterior salvo o sinal recebido (x_samp), para que a simulação
% seja completa.

x_rec=0;                                                        % Cria o vetor da reconstrução
nSamples = length(x_samp);                                      % Mede-se o comprimento do sinal
xSamples = 0 : nSamples-1;                                      % 
trec = nSamples/Tf*[0:p:Tf];                                    % Eixo do tempo do sinal recuperado
psinc = 0.1;                                                    % Passo da sinc
Tfsinc = 50;                                                    % Tempo Final
tsinc = 0:psinc:Tfsinc;                                         % Eixo de tempo da sinc

% Nosso x_samp será o ponto que dará a amplitude da sinc (intensidade). Já
% o argumento da sinc será um vetor de tempo com um determinado atraso para
% cada amostra.
% Laço para interpolação de sinc nos tempos coletados (50 amostras)
for ik = xSamples      
Nx_sinc = x_samp(ik+1)*sinc(2*pi*B*(tsinc-ik*Ts));              % Cria sinc para a amostra ik
x_rec = x_rec+Nx_sinc;                                          % Faz somatórios das sincs
end

%% Plotting
plot (freq,abs(spec));
figure
% Plota amostras coletadas na recepção
subplot(2,1,1);
stem(t_samp, x_samp,'filled');
hold on;
% Plota o sinal original 
plot(t,x,'k :');
% Plota sequências de sincs sem soma
title('Amostras recebidas')
legend('Amostras','Sinal original')
xlabel('t');
ylabel('x(t)');
axis([0 Tf -2 2]);
% --------------------------------------
% Plota o sinal original 
subplot(2,1,2);
title('Sinal Recuperado')
xlabel('t');
ylabel('x(t)');
% Plota somatório das sincs
plot(tsinc,x_rec,'k');
axis([0 Tf -2 2]);
subplot(2,1,1);
hold off;
subplot(2,1,2);
hold off;

