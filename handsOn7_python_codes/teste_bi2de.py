import numpy as np

#a conversão binário/decimal para escalares é menos verbosa que para sinais, como visto anteriormente
#para economizar linhas de código, é uma boa prática resumir a conversão binário/decimal em duas funções:

def de2bi(sinal):
    from numpy import fromiter,binary_repr,round 
    sinal_bin = round(sinal).astype(int)
    return fromiter(map(binary_repr,sinal_bin),dtype=int)

def bi2de(sinal):
    from numpy import ndarray
    sinal_dec = ndarray(len(sinal),dtype=int)
    for i in range(len(sinal_dec)):
        sinal_dec[i] = int(str(sinal[i]),2)  
    return sinal_dec

## Parâmetros dos sinais
t = np.arange(0,10,0.01)
f1=0.5
f2=0.2
sinal01=10*np.cos(2*np.pi*f1*t)
sinal02=10*np.cos(2*np.pi*f2*t)

## Codificador de sinais
# Ajustando sinal 01
sig_quan01= sinal01-np.min(sinal01)+1                     # Todos elementos positivos
sig_quan01= np.round(sig_quan01)                          # Transforma sinal em números inteiros
sig_code01= de2bi(sig_quan01)                         # Transforma em sinal binário 
# Ajustando sinal 02
sig_quan02= sinal02-np.min(sinal02)+1                     # Todos elementos positivos
sig_quan02= np.round(sig_quan02)                          # Transforma sinal em números inteiros
sig_code02= de2bi(sig_quan02)                         # Transforma em sinal binário 



mux_sig = np.zeros(4000,dtype=int)
#mux_sig é uma matriz 4000x5 em matlab, onde cada coluna contém os 5 dígitos do binário
#em Python, a palavra binária não é decomposta nos seus 5 dígitos
#devido a isso, mux_sig é um simples array de 4000 elementos, cada um sendo um binário completo

## Multiplexador de sinais

for i in range(1,1001): #o range vai até N-1, ou seja, 1000, tal qual matlab
    mux_sig[4*(i-1)]      =   sig_code01[i-1]  #indexação em python começa em 0
    mux_sig[4*(i-1)+1]    =   0
    mux_sig[4*(i-1)+2]    =   sig_code02[i-1]
    mux_sig[4*(i-1)+3]    =   0

#Demultiplexador de sinais    
demux_01 = np.zeros(1000,dtype=int)
demux_02 = np.zeros(1000,dtype=int)

for i in range(1,1001):
    demux_01[i-1]= mux_sig[(i-1)*4 ]
    demux_02[i-1]= mux_sig[(i-1)*4 + 2]
    
sig_rec01 = bi2de(demux_01)
sig_rec02 = bi2de(demux_02)

