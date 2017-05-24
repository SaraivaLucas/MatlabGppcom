#tutorial de geração e visualização de sinais com Python
# Autor: João Marcos Costa (Engenharia Elétrica)
# Data: 26/04/2017
# GppCom/DCO/UFRN, Natal/RN

import numpy as np
fsampling = 10**3 #10KHz : taxa de amostragem
tf = 200
T = np.arange(0,tf,(1/fsampling)) #array com valores de tempo
f_m = 0.04 #frequência de m(t)
A_m = 2 #amplitude de m(t)
m_t = A_m*np.cos(2*np.pi*f_m*T)

import matplotlib.pyplot as plt 
plt.plot(T,m_t)
plt.grid()
plt.title("Gráfico 1")
plt.ylabel("Amplitude")
plt.xlabel("Tempo (s)")
plt.show()

