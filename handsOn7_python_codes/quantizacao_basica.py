# -*- coding: utf-8 -*-
"""
Created on Mon Jul 31 08:45:10 2017

@author: joaomarcos
"""

import numpy as np
import matplotlib.pyplot as plt
fs=8000                                            # Frequência de amostragem
Ts=1/fs                                            # Período de amostragem
fm=20                                              # Frequência da onda
Tm=1/fm                                            # Período de amostragem
t= np.arange(0,Tm,Ts)                              # Eixo do tempo
x=np.sin(2*np.pi*20*t)                                   # Sinal x(t)
L=16                                               # Níveis de quantização
nbits=np.log2(L)       
sig_max=max(x)                                     # Encontra pico máximo
sig_min=min(x)                                     # Encontra pico mínimo
Delta=(sig_max-sig_min)/L                          # Intervalo de quantização (distância entre um nível e outro)
q_level=np.arange(sig_min+Delta/2,sig_max,Delta)      # Vetor com os Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

# Etapas para usar o round()
sigp=x-sig_min                                     # Joga sinal pra cima
sigp=sigp*(1/Delta)                                # Dá ganho de 1/Delta no sinal (elementos >= 0)
sigp=sigp+1/2   +0.0001                                   # Tira elementos do zero 
# Agora que nenhum valor do sinal  é zero nem negativo:
qindex=np.round(sigp)                      # Encontra inteiro mais proximo para cada elemento
qindex[qindex==17] = 16                      # Trunca o excedente de qindex (Ex: nível 17)
qindex = qindex.astype(int)
q_out=q_level[qindex-1]                              # Distribui nos níveis cada elemento

## Plotting
plt.plot(t,q_out,t,x)
plt.show()