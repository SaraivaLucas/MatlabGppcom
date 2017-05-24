% Parâmetros da onda
tf = 1; % Tempo de duração da nota
fc = 512; % Frequência da nota Dó
fs = 100*fc; % Frequencia de amostragem da nota. 
t = 0:1/fs:tf; % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;  % Amplitude do sinal. (0~1)
y=A*cos(2*pi*fc*t); % Sinal senoidal

% Reproduzindo a nota:
p = audioplayer(y, fs); 
play(p);  
plot(t,y)  
axis([0 0.02 -2 2 ]);