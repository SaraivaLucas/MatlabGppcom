import numpy as np #biblioteca principal para funções matemáticas e arrays (vetores e matrizes)
#'import' importa módulos/bibliotecas do python, equivalente ao #include<> de C/C++
#'as' permite dar um 'apelido' ao módulo para quando formos usar suas funções e classes
import scipy.io.wavfile as wv #scipy é um módulo para métodos numéricos
#'io' é um módulo interno da scipy, relacionado à entrada (input, 'i') e saída ('output','o') 
#de arquivos, e 'wavfile' é o módulo específico para leitura e escrita de arquivos .wav (áudios)
[fs,sinal] = wv.read('guitar.wav') 
# wv.read('arquivo_de_audio.wav') é uma função de duplo retorno
# retorna a frequência de amostragem, que resolvi armazenar na variável 'fs' 
# o segundo retorno é um array com as amostras (de amplitude) ordenadas do áudio
t = np.linspace(0,len(sinal)/fs,len(sinal))
#np.linspace cria um array com N elementos, começando em A e terminando em B,
#como em 'exemplo = np.linspace(A,B,N)'
#t é um array com valores de tempo correspondentes à duração do sinal. 
from matplotlib import pyplot as plt 
# executa a mesma coisa que 'import matplotlib.pyplot as plt'
plt.figure(1,[10,7]) 
#cria uma instância da classe figure, como se fosse uma figura em branco
#iremos fazer os gráficos nessa figura, e a 'caixa' dos gráficos 
#tem 10x7 polegadas 
grafico_1 = plt.subplot(311) 
'''plt.title('Sinal original')
plt.xlabel('Tempo') #título do eixo X
plt.ylabel('Amplitude')#título do eixo Y
plt.plot(t,sinal)#plota os valores do sinal em função do tempo
grafico_2 = plt.subplot(313) # segunda figura na terceira célula. o espaço entre elas duas (célula 2 vazia) é uma opção
sinal_2 = 2*sinal #amplificamos o sinal dobrando o valor de suas amostras
plt.title('Sinal amplificado (x2.0)')
plt.xlabel('Tempo')
plt.ylabel('Amplitude')
plt.plot(t,sinal_2)
#setting vertical (y) limits in both graphics
grafico_1.set_ylim([-40000,40000])
grafico_2.set_ylim([-40000,40000])'''
#plt.show()
A = sinal.max()
fc= 512
t = np.linspace(0,1,50000)
#print(str(t.size)+' '+str(t[len(t)-1]))
do = np.cos(2*np.pi*t*fc)
re = np.cos(2*np.pi*t*9*fc/8)
mi = np.cos(2*np.pi*t*5*fc/4)
fa = np.cos(2*np.pi*t*4*fc/3)
sol = np.cos(2*np.pi*t*3*fc/2)
la = np.cos(2*np.pi*t*5*fc/3)
si = np.cos(2*np.pi*t*15*fc/8)
som = np.concatenate((do,re,mi,fa,sol,la,si))
def achar_T_amostra(frequencia,array_tempo):
	import numpy as np
	T=1/frequencia
	for i in range(len(array_tempo)):
		if np.isclose(T,array_tempo[i],0.01):
			print(i)
			break
achar_T_amostra(fc,t)
print(t[97])
#do= do.astype('int16')
'''import os
from subprocess import Popen, PIPE
wv.write('teste.wav',50000,som)
#os.system('vlc guitar.wav teste.wav')
saida = Popen(['cvlc','--play-and-exit','teste.wav'],stdin=PIPE,stdout=PIPE,stderr=PIPE)'''
