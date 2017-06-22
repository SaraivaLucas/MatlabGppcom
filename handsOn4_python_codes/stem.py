import numpy as np
from matplotlib import pyplot as plt
N_amostras = 50 #é interessante diminuir o N para o gráfico não ficar com excesso de info.
f_amostragem = 200
t_amostragem = 1/f_amostragem
x = np.linspace(0.0,N_amostras*t_amostragem,N_amostras) #eixo do tempo 
f = 60.0 # Hz
Am = 2 # amplitude
y = Am*np.cos(2.0*np.pi*f*x) + np.cos(2.0*np.pi*x*50.0) # sinal senoidal 



yf = np.fft.fft(y)
xf = np.linspace(0.0,1.0/(2.0*t_amostragem),N_amostras/2)
f,subplot = plt.subplots(1,2)
subplot[0].plot(xf,2.0/N_amostras * np.abs(yf[:N_amostras/2]))
subplot[0].set_title("Função plot()")
subplot[1].stem(xf,2.0/N_amostras * np.abs(yf[:N_amostras/2]),'b-')
subplot[1].set_title("Função stem()")
plt.show()