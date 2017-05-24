# -*- coding: utf-8 -*-
"""
Spyder Editor

Este é um arquivo de script temporário.
"""

import numpy as np
from matplotlib import pyplot as plt
import matplotlib.pylab as pylab 
N_amostras = 50
f_amostragem = 200
t_amostragem = 1/f_amostragem
x = np.linspace(0.0,N_amostras*t_amostragem,N_amostras) #eixo do tempo 
f = 60.0 # Hz
Am = 2 # amplitude
y = Am*np.cos(2.0*np.pi*f*x) + np.cos(2.0*np.pi*x*50.0) # sinal senoidal 

#Montando a DFT 

n = np.arange(0,N_amostras,1)
eixo_f = np.linspace(0.0,1.0/t_amostragem,N_amostras)

X_S = np.ndarray([N_amostras],dtype = complex)
for k in range(N_amostras):
    X_S[k] = np.sum(np.exp(-1j*2*np.pi*k*n/N_amostras)*y)


yf = np.fft.fft(y)
xf = np.linspace(0.0,1.0/(2.0*t_amostragem),N_amostras/2)
#plt.plot(xf,2.0/N_amostras * np.abs(X_S[:N_amostras/2]))
pylab.stem(xf,2.0/N_amostras * np.abs(X_S[:N_amostras/2]),'-')
#plt.show()