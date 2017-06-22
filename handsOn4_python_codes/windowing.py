from spectrum.window import Window
from matplotlib import pyplot as plt 
import numpy as np
from scipy import fftpack
N_pontos = 1024 
b = Window(N_pontos, name= 'blackman')
f = Window(N_pontos, name= 'flattop')
h = Window(N_pontos, name= 'hamming')
fc = 100.0
x = np.linspace(0,N_pontos-1,N_pontos)
y = np.cos(2.0*np.pi*x*fc)

YH = y*h.data #janelamento
YH = fftpack.fftshift(np.fft.fft(YH)) # fft 
YH = 2.0*np.abs(YH)/N_pontos #normalização


YB = y*b.data #janelamento
YB = fftpack.fftshift(np.fft.fft(YB)) # fft 
YB = 2.0*np.abs(YB)/N_pontos #normalização


YF = y*f.data #janelamento
YF = fftpack.fftshift(np.fft.fft(YF)) # fft 
YF = 2.0*np.abs(YF)/N_pontos # normalização

#yt = fftpack.ifft(YF)

#plt.plot(yt)
plt.plot(x,20.0*np.log10(YH/max(YH)))
plt.grid()
plt.title("Janelamento de um cosseno com Hamming")
plt.ylabel("Amplitude (dB)")
plt.show()