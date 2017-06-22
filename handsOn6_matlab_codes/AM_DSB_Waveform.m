clc; clear all; close all;
%% Determinando os parâmetros da onda
t = [0:999]*1e-6;                                               % Definição do vetor tempo
Ts=1e-6;                                                        % Definiçao do periodo 10^(-6)
fc = 10000;                                                     % Frequencia da portadora.
fm = 1500;                                                      % Frequencia do sinal
tau = 0.0001;                                                   % Constante de tempo do detector de envelope.
Mu = 0.6;                                                       % Indice de modulaçao.
x_AM = (1+Mu*cos(2*pi*fm*t)).*cos(2*pi*fc*t);                   % Onda Modulada


%% Calculando do envelope
% Envelope Ideal
x_env1 = abs(1+Mu*cos(2*pi*fm*t));
% Calcula a saída do detector de envelope.



 x_AM = x_AM.*(x_AM>0);                                         % Parte positiva da onda AM 
  x_env = zeros(size(x_AM));                                    % Cria um zeros vetor pra gurardar o envelope
  nSamp = length(x_AM);                                         % Número de amostras da onda AM
  out = -1;
 %% Cálculo da saida
 for i=1:nSamp,
    inp = x_AM(i);
    if (inp>=out)                                               % Caso 1: x_am(t) > vc(t)
      out = inp;             
    else                                                        % Caso 2: x_am(t) < vc(t)
      out = out*(1-Ts/tau);  
    end;
    x_env(i) = out;
  end; 

%% Plotting
plot(1000*t,x_AM,1000*t,x_env);
ylabel('Amplitude');
xlabel('t (ms)');
legend('AM waveform','Ideal envelope','Detector output','location','southeast');