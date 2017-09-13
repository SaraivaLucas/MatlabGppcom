clc;clear all;close all;
%% Dados
fm=1;
fs=100;
x=0:1/fs:1/fm+1/;
y=2+sin(2*pi*fm*x+pi/3);
plot(x,y)