import numpy as np
fc=10.0
N = 1000
t = np.linspace(0,4*np.pi,N)
x = np.cos(2.0*np.pi*t*fc)
R_implementada = np.zeros([N],dtype = float)
#implementaçao:
for m in range(N):
    for n in range(N-m):
        R_implementada[m] = R_implementada[m]+x[n]*x[n+m]
R_implementada = R_implementada/N

from matplotlib import pyplot as plt

auto = np.correlate(x,x,'full')
auto = auto[auto.size/2:]

plt.figure(1,[10,7])

grafico_1 = plt.subplot(311)
plt.title("Cosseno de 10Hz")
plt.ylabel("Amplitude")
plt.grid()
plt.plot(t,x)

grafico_2 = plt.subplot(312)
plt.ylabel("Autocorrelaçao built-in")
plt.grid()
plt.plot(t,auto)

grafico_3 = plt.subplot(313)
plt.plot(t,R_implementada)
plt.title("Autocorrelação built-in")
plt.xlabel("Tempo (s)")
plt.ylabel("Amplitude")
plt.grid()
plt.show()