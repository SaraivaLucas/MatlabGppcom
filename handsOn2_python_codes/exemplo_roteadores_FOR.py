#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 19 17:54:13 2017

@author: joaomarcos
"""
#exemplo com laço for
import timeit as T
dPasso = 5;
dDim = 200;
nl = (dDim-2*dPasso)/dPasso + 1;
start = T.default_timer() #inicia contador de tempo
import numpy as np
NL = int(nl) #nl não é do tipo inteiro
px = np.ndarray([NL,NL])
py = np.ndarray([NL,NL])
#Matriz com posição de cada ponto do grid 
#(posição relativa ao canto inferior direito)

for i in range(NL):
    for j in range(NL):
        px[i,j] = dPasso + j*dPasso
        py[j,i] = px[i,j]

#Matrizes de posição e potência recebida
pbs0 = np.ndarray([NL,NL], dtype=complex)
pbs1 = np.ndarray([NL,NL], dtype=complex)
pl0  = np.ndarray([NL,NL])
pl1  = np.ndarray([NL,NL])
plf  = np.ndarray([NL,NL])

for i in range(NL):
    for j in range(NL):
#Matrizes com posição de cada ponto do grid relativa 
#a cadaroteador
        pbs0[i,j] = px[i,j]+ 1j*py[i,j] - ( dDim/2 + 0.8*dDim*1j);
        pbs1[i,j] = px[i,j]+ 1j*py[i,j] - ( dDim/2 + 0.2*dDim*1j);
#cálculo da potência recebida em cada ponto do grid
# recebida de cada roteador
        
        pl0[i,j]=  10*np.log10(1/(np.absolute(pbs0[i,j])**4)/0.001)
        pl1[i,j]=  10*np.log10(1/(np.absolute(pbs1[i,j])**4)/0.001)
#cálculo da melhor potência em cada ponto do grid
        plf[i,j] = max(pl0[i,j],pl1[i,j])               


stop = T.default_timer() #encerra o contador de tempo
from matplotlib import pyplot as plt

stop_time = time.clock()
tempo_de_execucao = stop_time - start_time
from matplotlib import pyplot as plt
#plt.matshow(pbs0)
#plt.matshow(pbs1)
plt.matshow(pl0)
plt.grid()
plt.colorbar()
plt.title("Sistema sem laço: "+ str(tempo_de_execucao)+ " segundos",y=1.08)
plt.matshow(pl1)
plt.grid()
plt.colorbar()
plt.title("Sistema sem laço: "+ str(tempo_de_execucao)+ " segundos",y=1.09)
plt.matshow(pl0+pl1)
plt.grid()
plt.colorbar()
plt.title("Sistema sem laço: "+ str(tempo_de_execucao)+ " segundos",y=1.08)
print("Tempo de execução:", stop-start)