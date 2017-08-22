clc;clear all;close all;
%% Parâmetros do desvanescimento plano
x=0:0.01:5;
Path_loss=-x+5;
Shadowing=cos(2*pi*0.7*x)+Path_loss;
Multipath=0.2*cos(2*pi*10*x)+0.5*sin(2*pi*8*x)+Shadowing;
plot(x,Path_loss,':',x,Shadowing,'-k',x,Multipath,'-')
legend('Path Loss','Shadowing','Multipath')
title('P_r/ P_t')
ylabel('K(dB)')
xlabel('Distância')