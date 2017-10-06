from scipy.io import loadmat
import numpy as np
quantizacao_mat = loadmat('../handsOn7_matlab_codes/Quantizacao.mat')

#não vamos importar o quantizacao.mat novamente, vide o bloco anterior
import numpy as np

print(quantizacao_mat.keys())

T = float(quantizacao_mat['T'])
Fmax=1/(2*T)             # Frequência máxima dada por Fs/2
BW=5
t = quantizacao_mat['t'].flatten()
m_t = quantizacao_mat['m_t'].flatten()
lfft = int(quantizacao_mat['lfft'])
Q_out = quantizacao_mat['Q_out'].flatten()
N_samp = int(quantizacao_mat['N_samp'])
# Largura de banda
# Filtro
H_lpf=np.zeros(lfft)                                            # Zera vetor filtro
H_lpf[lfft//2-BW:lfft//2+BW]=1                                 # Define 1 na frequencia desejada
S_recv=N_samp*Q_out*H_lpf   # Filtragem ideal
s_recv=np.real(np.fft.ifft(np.fft.fftshift(S_recv)))         # Reconstroi o sinal no tempo

s_recv=s_recv[0:lfft]                                          # Corrige número de elementos 
s_recv=s_recv-s_recv[0]                                         # Remove quaisquer componente DC
s_recv=s_recv*(np.max(m_t)/np.max(s_recv))          # Dá ganho pro sinal reconstruido

import matplotlib.pyplot as plt

#plt.title("Espectro do sinal reconstruído")
#plt.plot(np.abs(S_recv))
##plt.axis([-150,150,0,.6])
#plt.show()

plt.title("Sinal original x Sinal reconstruído")
plt.plot(t,m_t,'*')
plt.plot(t,s_recv)
plt.legend(["Sinal original","Sinal reconstruído"])
plt.show()

