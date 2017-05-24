clc; close all;clear all;
%% Parâmetros do sinal 
N=1000;                                   % Número de amostras
f1=10;                                    % Frequência do seno (kHz)
FS=2000;                                  % Frequência de amostragem (kHz)
n=0:N-1;                                  % Números de índice de amostra
Am=5;                                     % Amplitude x(n)
x=Am*sin(2*pi*f1*n/FS);                   % Gera o sinal x(n)
t=[1:N]*(1/FS);                           % Definiçao do eixo do tempo
f=[-0.5*FS:FS/N:0.5*FS-FS/N];             % Eixo da frequência
Rxx=xcorr(x,'biased');                    % Estima / normaliza a autocorrelaçao de x(n)

%% Cálculo da potência no tempo
Px=0;
for n= 1: N
 Px=Px+(abs(x(n)))^2;        
end
Px=(1/N)*Px;

%% Cálculo da potência no a frêquencia
X = fft(x)/N;
Pfx=0;
for k= 1: N
 Pfx=Pfx+(X(k).*conj(X(k)));       
end

%% Display

disp(['Potência de duas bandas: '])
                                        % Cálculo da potência de duas bandas
disp(['Parseval tempo      =  ' num2str(Px)]);

                                        % Cálculo da potência de duas bandas
disp(['Parseval Frequencia =  ' num2str(Pfx)]);

PRxx = Rxx(N);                          % Cálculo da potência duas bandas via autocorrelação
disp(['Autocorrelação      =  ' num2str(PRxx)]);

Pxxbp= bandpower(x);                    % Cálculo da potência de duas bandas via bandpower
disp(['Bandpower           =  ' num2str(Pxxbp)])

Pvar = std(x)^2;                        % Cálculo da potência duas bandas via variancia
disp(['Variância           =  ' num2str(Pvar)])