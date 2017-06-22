[y,fs]=  audioread('/guitar.wav');% Deve ser colocado o endereço do arquivo .wav!! 
a=length(y);
x=linspace(0,2,a);
%% tocar sinal
p = audioplayer(y,fs);
play(p);

%% plotar sinal
plot(x,y);