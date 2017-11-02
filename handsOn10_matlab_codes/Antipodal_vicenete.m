%% Mistura de 3 Codes: (Jupyter notebook não aceita função)
% scritpSimAntipodal
% SimAntipodal
% Qfunct
clear all;close all;clc;
%% Parâmetros
snr_in_dB=0:1:12;                                       % SNR em dB 
nMCSamples = 10000;                                     % Número de amostras MMC
vtSNRTeo=0:0.1:12;                                      % SNR em dB teórica (faremos com mais amostras)
dE = 10;                                                % Energia do sinal s0 e s1
dSNR = exp(snr_in_dB*log(10)/10);                       % SNR em escala linear
dsgma = dE./sqrt(2*dSNR);                               % Desvio padrão do ruído

%% Transmissão
vtBin = randi([0 1],1,nMCSamples);                      % Geração dos números binários 0 e 1 com igual probabilidade
% Estima erro varrendo todos os valores de Snr
for ik=1:length(snr_in_dB)
vtIndex0 = find(vtBin == 0);                            % Acha os índice de bits iguais a 0
vtIndex1 = find(vtBin == 1);                            % Acha os índice de buts iguais a 1

% Dado que o ruído é de média zero e variancia dsgma^2, têm-se que 
% r=média+dsgma*randn(.)= dsgma*randn(.)
% Gera saida do correlator para cada entrada
vtEnergiaR(vtIndex0) = dE + dsgma(ik)*randn(1,length(vtIndex0));
vtEnergiaR(vtIndex1) = -dE + dsgma(ik)*randn(1,length(vtIndex1));

%% Detecção:
% 0 se, r>0; e 1, se r<0
vtBinDetec = vtEnergiaR < 0;
%% Detecção de erro
% Detecção de erros (soma dos vetores originais e detectados)
% 0 + 0 = 0 (acerto)
% 1 + 1 = 2 (acerto)
% 0 + 1 = 1 (erro)
% 1 + 0 = 1 (erro)
vtError = vtBin + vtBinDetec; 
nErrors = length(find(vtError == 1));
% Estimativa da probabilidade de erro, i.e., BER
vtSimError(1,ik) = nErrors/nMCSamples;
end

%% Gera a curva teórica
for ik=1:length(vtSNRTeo)
  dSNR=exp(vtSNRTeo(ik)*log(10)/10);   
  vtTeoError(ik)=(1/2)*erfc(sqrt(2*dSNR)/sqrt(2));     
end

%% Plotting
semilogy(snr_in_dB,vtSimError,'o');
hold on;
semilogy(vtSNRTeo,vtTeoError);
legend('BER (simulada)', 'P_{e} (teórica)')
xlabel('SNR')
ylabel('BER (simulada) ou Pe (teórica)')
