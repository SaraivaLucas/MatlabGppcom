%% Gabarito prova Tipo: 1
clc;clear all;close all;
%% Questão 1:
Texto = sprintf('Questão 1: Considerando o Hands-On 09: Modulação digital(modulação, demodulação e desempenho em ruído AWGN) -\nParte 01, qual a probabilidade de erro para um sistema digital binário com sinais antipodais e Eb/No = 10?\n\n');
disp(Texto)
% Resolução
Eb_No=10;                                                                                   % Valor escalar da Eb/No
vtTeoErrorAnti = qfunc(sqrt(2*Eb_No));                                                      % Probabilidade de erro
disp(['R: A probabilidade de erro é de P_e = ', num2str(vtTeoErrorAnti)])    
disp(' ')
clear;

%% Questão 2:
Texto = sprintf('Questão 2:  Considerando a Prática 1: PDFs e CDFs de VAs clássicas do Hands-On 07, a duração de chamadas de uma \noperadora telefônica é uma VA com distribuição exponencial de taxa λ=30 segundos/chamada. Qual a probabilidade de \nassinantes fazerem uma chamada com mais de 4 minutos de duração?\n\n');
disp(Texto)
% Resolução
lambda=30/60;                                                                                % Lambda em minutos por chamada 
x=4;                                                                                         % Duração da chamada em questão
f=lambda*exp(-lambda*x);                                                                     % Função probabilidade 
disp(['R: A probabilidade de a chamada durar mais que 4 minutos é de P = ', num2str(f*100),' %'])  % Percentual
disp(' ')
clear;

%% Questão 3
Texto = sprintf('Questão 3:  Considerando a Prática 2: Recepção AM-DSB (detecção de envoltória) do Hands-On 05, qual o  erro médio \nquadrático entre a envoltória ideal e a envoltória recuperada quando tau = 0.0030? \n\n');
disp(Texto)
% Resolução
tau =0.003;                                                                                 % Constante de tempo do detector de envelope  

%                                                       Copiado
%-----------------------------------------------------------------------------------------------------------------------
t = [0:999]*1e-6;                                               % Definição do vetor tempo
Ts = 1e-6;                                                      % Definição do período
fc = 10000;                                                     % Frequência da portadora
fm = 1500;                                                      % Frequência do sinal
Mu = 0.6;                                                       % Índice de modulação
x_AMo = (1+Mu*cos(2*pi*fm*t)).*cos(2*pi*fc*t);                  % Onda Modulada AM-DSB
% Envelope ideal do AM-DSB
x_envIdeal = abs(1+Mu*cos(2*pi*fm*t));
% Detector de envelope.
x_AM = x_AMo.*(x_AMo>0);                                        % Parte positiva da onda AM
x_env = zeros(size(x_AM));                                      % Vetor de zeros vetor pra guardar o envelope
nSamp = length(x_AM);                                           % Número de amostras da onda AM
out = -1;                                                       % Saída inicial (temporária)
% Cálculo da saida
for i=1:nSamp,
    inp = x_AM(i);
    if (inp>=out)                                               % Caso 1: x_am(t) > Vc(t) (carga do capacitor)
        out = inp;
    else                                                        % Caso 2: x_am(t) < Vc(t) (descarga do capacitor)
        out = out*(1-Ts/tau);
    end
    x_env(i) = out;
end
%-----------------------------------------------------------------------------------------------------------------------

% Cálculo do erro médio quadrático                                                                                             
Erro_MSE=(x_envIdeal-x_env).^2;
Erro_MSE=sum(Erro_MSE)/length(Erro_MSE);
disp(['R: O Erro médio quadrático é de E = ',num2str(Erro_MSE)]);
disp(' ')
clear;

%% Questão 4
Texto = sprintf('Questão 4:  Considerando a Prática 2: Ruído em comunicações digitais do Hands-On 08, qual a potência do ruído para \numa modulação 8-PSK e uma Eb/No = 20dB? \n\n');
disp(Texto)
% Resolução
M=8;                                                            % Modulação 8-PSK
Eb_No_db=20;                                                    % Eb/No em dB
Eb_No=10^(Eb_No_db/10);                                         % Eb/No linear
Var=1/(2*M*Eb_No);                                              % Cálculo da Variância
mu=0;                                                           % Média de um ruído AWGN
P= mu+Var;                                                      % Cálculo da potência
disp(['R: A potência é de P = ',num2str(P)]);
disp(' ')
clear

%% Questão 5
Texto = sprintf('Questão 5:  Considerando a Prática 3: Quantização do Hands-On 06, qual a SQNR para 32 níveis de quantização = 20dB? \n\n');
disp(Texto)
L= 32; 
%                                                   Copiado
%-----------------------------------------------------------------------------------------------------------------------
T=0.002;                                                % Taxa de amostragem (500kHz)
Tf=1;                                                   % Tempo final em segundos
t=0:T:Tf-T;                                             % Definição do eixo do tempo      
fm1=3;                                                  % Frequência senoide 1      
fm2=1;                                                  % Frequência senoide 2
m_t=sin(2*pi*fm2*t)-sin(2*pi*fm1*t);                    % Sinal mensagem m(t)
ts=0.02;                                                % Nova taxa de amostragem
N_samp=round(ts/T);                                     % Número de elementos
% Amostragem 
s_out=downsample(m_t,N_samp);                           % Coleta 1 amostra a cada N_samp=10 amostras do sinal  
s_out=upsample(s_out,N_samp);                           % Retorna vetor amostrado com o numero inicial de elementos
% Quantização
sig_max=max(s_out);                                     % Encontra pico máximo
sig_min=min(s_out);                                     % Encontra pico mínimo
Delta=(sig_max-sig_min)/L;                              % Intervalo de quantização (separação entre um nível e outro)
q_level=sig_min+Delta/2:Delta:sig_max-Delta/2;          % Vetor com amplitudes dos Q níveis 
sigp=s_out-sig_min;                                     % Shift para cima
sigp=sigp*(1/Delta);                                    % Calcula a quantidade de nívels
sigp=sigp+1/2;                                          % Tira elementos do zero 
qindex=round(sigp);                                     % Encontra inteiro mais proximo para cada elemento
qindex=min(qindex,L);                                   % Remove o excedente de qindex 
q_out=q_level(qindex);                                  % Calcula a amplitude quantizada de cada amostra
%-----------------------------------------------------------------------------------------------------------------------

% Cálculo da SQNR 
N=length(m_t);                                          % Comprimento do vetor 
Psignal=sum(m_t.^2)/N;                                  % Potência do sinal
Pnoise=sum((m_t-q_out).^2)/N;                           % Potência do ruído
SQNR=Psignal/Pnoise;                                    % SQNR linear 
disp(['R: SQNR = ', num2str(SQNR)])
disp(' ')