#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 30 23:30:52 2017

@author: pesquisador
"""

import numpy as np
import matplotlib.pyplot as plt 
from scipy.special import erfc

N = 10**6 #número de símbolos BPSK a serem transmitidos

d = np.random.rand(N) > 0.5 # dados binários 
x = 2*d -1 #simbologia: 0 representado por -1 e 1 representado por 1

EbN0dB = np.arange(-5,20,2) #sequência de valores Eb/n0 

BER_rayleigh_simulada = np.zeros(len(EbN0dB))
BER_awgn_simulada = np.zeros(len(EbN0dB))

for i in range(len(EbN0dB)):
    noise = 1/np.sqrt(2)*(np.random.randn(N)+1j*np.random.randn(N)) #ruído AWGN com média 0 e variância 1
    h = 1/np.sqrt(2)*(np.random.randn(N)+1j*np.random.randn(N))#fator de desvanecimento plano Rayleigh (single tap?)
    n = noise*10**(-EbN0dB[i]/20) # conversão de escala: dB para linear 
    y_awgn = x + n 
    y_rayleigh = h*x + n
    
    #receptor coerente para o canal Rayleigh:
    y_rayleigh_cap=y_rayleigh/h #supondo uma resposta ao impulso h conhecida
    r_rayleigh = np.real(y_rayleigh_cap)>0 #os símbolos positivos recebidos são 1, os demais são 0 (lembrar da simbologia)
    
    #receptor para o canal AWGN
    r_awgn = np.real(y_awgn)>0 
    BER_rayleigh_simulada[i] = np.sum(np.bitwise_xor(d,r_rayleigh))
    BER_awgn_simulada[i] = np.sum(np.bitwise_xor(d,r_awgn))

BER_rayleigh_simulada /= N #divisão do próprio vetor pelo número de dados binários
BER_awgn_simulada /= N

#BER Teórica:

EbN0=10**(EbN0dB/10) #Eb/N0 em escala linear

BER_rayleigh_teorica = 0.5*(1-np.sqrt(EbN0/(1+EbN0))) #vide as equações enunciadas
BER_awgn_teorica = 0.5*erfc(np.sqrt(EbN0))

plt.figure()
plt.semilogy(EbN0dB,BER_rayleigh_simulada,'g-*')
plt.semilogy(EbN0dB,BER_awgn_simulada,'r-*')
plt.semilogy(EbN0dB,BER_rayleigh_teorica,'ko')
plt.semilogy(EbN0dB,BER_awgn_teorica,'bo')

plt.grid()
plt.axis([-5,20,10**(-5),1.2])
plt.legend(['Rayleigh simulada','AWGN simulada','Rayleigh teórica','AWGN teórica'])
plt.title("Eb/N0 Vs BER para BPSK sobre canais Rayleigh e AWGN ")
plt.xlabel('Eb/N0(dB)')
plt.ylabel('Bit Error Rate ou BER')

plt.show()