import spectrum as spc 
import numpy as np
N_amostras = 300
fc = 0.4
fs = 50.0
t_amostragem = 1.0/fs
ruido = spc.data_cosine(N=N_amostras, sampling=fs, A=1.0, freq=fc)
# data_cosine() retorna um cosseno ruidoso
#N : numero de amostras 
# sampling : frequencia de amostragem 
# A : intensidade do ruido
# freq : frequencia do cosseno
import matplotlib.pyplot as plt
x = np.linspace(0,N_amostras*1.0/fs,N_amostras)
plt.figure(1,[10,7])
grafico_1 = plt.subplot(411)
plt.title("Sinal com ruído")
plt.xlabel("Tempo (s)")
plt.ylabel("g(t)")
plt.grid()
plt.plot(x,ruido)

grafico_2 = plt.subplot(412)
from scipy import fftpack
Gf = fftpack.fft(ruido)
Gf = 2.0*np.abs(Gf)/N_amostras #normalização

Gf2 = Gf*np.conj(Gf) #não precisa normalizar Gf2, pois ele já resulta de um Gf normalizado
#multiplica pelo conjugado para obter o |G(f)|^2
x_hz = np.linspace(0.0,1.0/(2.0*t_amostragem),N_amostras/2)
plt.xlabel("Frequência (Hz)")
plt.ylabel("|G(f)|")
plt.grid()
grafico_2.stem(x_hz,Gf[:N_amostras/2])
grafico_3 = plt.subplot(414)
plt.title("Densidade espectral de energia - ESD")
plt.xlabel("Frequência (Hz)")
plt.ylabel("|G(f)|²")
plt.grid()
grafico_3.stem(x_hz,Gf2[:N_amostras/2])
print(max(Gf)**2)
print(max(Gf2))
print(np.sum(Gf2[:N_amostras/2]))
plt.show()