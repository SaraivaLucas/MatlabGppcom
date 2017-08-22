#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug  9 16:56:32 2017

@author: labsim
"""

import scipy.stats as stats 
import numpy as np
mu=200                                                 # Média
sigma =20                                              # Desvio padrâo
T=0.001                                                # Taxa de amostragem
x=np.arange(120,280+T,T)                               # Eixo x       
DistNorm=stats.norm.pdf(x,mu,sigma)                           # Distribuição normal    

#cdfplot(DistNorm)                                      # Plot da CDF 
import matplotlib.pyplot as plt

y =np.cumsum(DistNorm)
y /= y[-1]

#DistNorm /= (T*DistNorm).sum()

# Compute the CDF
#CY = np.cumsum(DistNorm*T)

plt.plot(x,y)
plt.show()