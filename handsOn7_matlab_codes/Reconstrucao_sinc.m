% Reconstrucao_sinc.m
close all; clear all; clc;
%% Parâmetros
% Coletaremos todos os dados do processo de amostragem para que o código
% não fique extenso. Todas as variáveis terão o mesmo nome. O arquivo .mat
% deve sempre está na pasta em que o script está.
load('Amostragem.mat')

%% Reconstrução via Sincs
nSamples = length(s_out);                                        % Mede-se o comprimento do sinal
xSamples = 0 : nSamples-1;                                       % Vetor ordenado de amostras
trec = nSamples/Tf*[0:T:Tf];                                     % Eixo do tempo do sinal recuperado
Tsinc = 0.002;                                                   % Passo de tempo da sinc
Tfsinc = 50;                                                     % Tempo Final da sinc
tsinc = 0:Tsinc:Tfsinc;                                          % Eixo de tempo da sinc
s_recv=0;                                                        % Cria o vetor da reconstrução
Bs = fm1;                                                        % Banda da transmissão

% Gera laço para somatório
for ik = xSamples      
Nx_sinc = s_out(ik+1)*sinc(2*pi*Bs*(tsinc-ik*T));                % Cria sinc para a amostra ik
s_recv = s_recv+Nx_sinc;                                         % Faz somatórios das sincs
end
s_recv=s_recv(1:lfft);                                           % Corrige comprimento do vetor
s_recv=s_recv*(max(m_t)/max(s_recv));                            % Aquele ganho maroto

%% Plotting
% Plota o sinal reconstruído por um Sincs no domínio do tempo
% Plota sinal recuperado na frequência
S_recv=fftshift(fft(s_recv,lfft)/lfft);
subplot(2, 1, 1);
sfig2a=plot(freq,abs(S_recv));
xlabel('Frequência (Hz)');
axis([-150 150 0 .6]);
title('Espectro do sinal reconstruido');

% Plota sinal recuperado no tempo
subplot(2, 1, 2);
sfig2b=plot(t,m_t,'k-.',t,s_recv(1:lfft),'b');
legend('Sinal original','Sinal reconstruido');
xlabel('Tempo (sec)');
title('Sinal Original x Sinal Reconstruido');
set(sfig2b,'Linewidth',2);