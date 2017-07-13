% TLC.m
clear all;close all;clc;
%% Parâmetros
% Esse experimento é feito com um dado de 6 faces (6 pontuações de 1 a 6).
% Monta-se um vetor com cada jogada para que possa fazer um laço for com
% cada elemento.
Jogadas = [2 50 100 200];                 % Número de jogadas do dado
Jogadores = 10000;

%% Simulando as jogadas
% Faremos aqui a criação das jogadas para cada jogador. Montaremos uma
% matriz em que as linhas representarão os resultados e as colunas
% representarão os jogadores. Em seguida será calculado a pontuação de cada
% jogador somando os pontos de cada jogada. Queremos mostrar também o
% quanto é prejudicial em termos de tempo o uso do laço FOR. Simularemos
% para os dois casos e computaremos o tempo:
for id=1:length(Jogadas)
n = Jogadas(id);                                        % Para um número "n" de jogadas
% Implementação com laço for:
dcfs = tic;                                             % Inicia o cronômetro

for ic=1:n
x(ic,:)=ceil(6*rand(1,Jogadores)) ;                     % Gera números aleatórios entre o intervalo de 1 a 6 (faces do dado)
end

for ik=1:length(x(1,:)),        
        y(ik)=sum(x(:,ik));                             % Soma os pontos de cada jogador
end

df = toc(dcfs);                                         % Tempo de execuçaõ com FOR
disp([' '])                                             % Pula linha
disp([' Para ',num2str(n) ,' Jogadas'])                 % Mostra número de jogadas atual 
disp([' Tempo com for = ' num2str(df) 's'])             % Mostra tempo

% Implementaзгo like-Matlab
dsfs = tic;                                             % Inicia o cronômetro
x = ceil(6*rand(n,Jogadores));                          % Gera matriz com jogadas
y = sum(x,1);                                           % Calcula a pontuação de cada jogador
dsem = toc(dsfs);                                       % Tempo de execuçaõ sem FOR
disp([' Tempo sem for = ' num2str(dsem) 's'])           % Mostra tempo
disp([' Razão = ' num2str(df/dsem) ' vezes'])           % Razão entre tempos 

 %% Display
% O número de plots dependerá da quantidade de elementos do vetor Jogadas.
% Em seguida no subplot() determinaremos quantos plots serão efetuados e
% qual a posição. Cada elemento de jogadas será representado em um quadrado
% no subplot.
nPlots=length(Jogadas);                                 % Número de plots     
subplot(2, ceil(nPlots/2), id )                         % Determinação de posicionamento dos plots
binCtrs = n:1:n*6;                                      % Centro de cada coluna dependem de "n"
hist(y,binCtrs);                                        % Plota Histograma para cada eixo
hold on;
% Histograma gaussiano estimado
mi = mean(y);                                           % Calcula média de cada jogador
des = std(y);                                           % Calcula desvio padrão de cada jogador
%ye = des*randn(1,length(y))+mi;                        % Histograma estimado 
Tp = 1/Jogadores;
xi = min(y):Tp:max(y);
ye = (1/Tp)*normpdf(xi,mi,des);
%[yPlot, xPlot] = hist(ye,binCtrs);                     % Retorna posição do histohrama sem plotar 
plot(xi, ye,'k','linewidth',2);                         % Plota histograma esperado como linha
title(['n = ' num2str(n)]);
xlabel('Soma');
ylabel('Frequência de ocorrência');
% Legenda apenas no primeiro
if (id==1)
    legend('Dados','Gaussiana')
end
vtdf(id) = df;                                          % Armazena vetor com tempo com FOR
vtdsem(id) = dsem;                                      % Armazena vetor com tempo sem FOR    
end

% Novo plot para relacionar tempos de execução
figure;
plot(Jogadas,vtdf,'b-*');
hold all;
plot(Jogadas,vtdsem,'r-s');
legend('Tempo com laço for','Tempo sem laço for');
xlabel('Valor de n');
ylabel('Tempo de execução [s]');
 