clear all;clc;close all;
tf = 0.3;% duraзгo de cada tom
% tabela notas musicais
% do- 1; re- 2; mi- 3; fa- 4; sol-5; la-6; si-7
vtmusic = [1 2 3 4 5 6 7 8]; % vetor de "mъsica"
% Frequencia fundamental da nota Dу 
fdo = 512; %Hz
% Relaзгo de frequкncias entre as notas musicais
vtTom2Freq = [1 9/8 5/4 4/3 3/2 5/3 15/8 2]; 
%% gerar e tocar musica 
for iplay = vtmusic
    if iplay == 0
        pause(tf);
    else
            fs = vtTom2Freq(iplay)*fdo; 
            fa = 100*fs;
            t = 0:1/fa:tf;
            y=cos(2*pi*fs*t);
            %wavplay(y,fa)
            p = audioplayer(y, fa);
            play(p);
            pause(tf);
    end
end