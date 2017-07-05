# -*- coding: utf-8 -*-
"""
Created on Mon Jul  3 13:32:26 2017

@author: joaomarcos
"""
from matplotlib import pyplot as plt
import numpy as np
import scipy.io.wavfile as wv

alfa = 0.5
fs, x = wv.read('./guitar.wav')
timelag = 0.5;                                                  # Atraso do eco
delta = round(fs*timelag)     
eco = np.zeros(len(x)+delta) 
eco[delta:] = alfa*x 
x_eco = np.zeros(len(eco))
x_eco += eco
x_eco[:len(x)] += x
t = np.linspace(0,len(x_eco)/fs,len(x_eco))

x = np.concatenate((x,np.zeros(delta)),axis=0) #padding
autocorrelacao = np.correlate(x_eco/max(x_eco),x_eco/max(x_eco),'full') #valor normalizado
autocorrelacao = autocorrelacao[len(autocorrelacao)//2:]

autocorrelacao = autocorrelacao[autocorrelacao>0]


indexes = 10992
#local do eco : menor pico, mais distante
newdelta = indexes*2 
denominador = np.zeros(1+newdelta-1+1) 
denominador[0] = 1
denominador[-1] = alfa #índice -1 representa o último elemento
#denominador é o [1 zeros(1,newdelta-1) alfa]

from scipy import signal
x_new = signal.lfilter([1],denominador,x_eco)


plt.title("Resultado da filtragem")
plt.plot(x_new/max(x_new))
plt.show()