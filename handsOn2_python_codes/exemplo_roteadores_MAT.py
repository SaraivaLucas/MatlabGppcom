#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 19 20:08:53 2017

@author: joaomarcos
"""
dPasso = 5
dDim = 200
import time
start_time = time.clock()
import numpy as np
x= np.arange(dPasso,dDim-dPasso,dPasso)
y=np.arange(dPasso,dDim-dPasso,dPasso)
X,Y = np.meshgrid(x,y)

pbs0 = X + 1j*Y - (dDim/2 + 0.8*dDim*1j)
pbs1 = X + 1j*Y - (dDim/2 + 0.2*dDim*1j)

pl0 = 10*np.log10(1/(np.absolute(pbs0)**4)/0.001)
pl1 = 10*np.log10(1/(np.absolute(pbs1)**4)/0.001)

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
