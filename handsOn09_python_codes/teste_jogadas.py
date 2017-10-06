## Parâmetros
# Esse experimento é feito com um dado de 6 faces (6 pontuações de 1 a 6).
# Monta-se um vetor com cada jogada para que possa fazer um laço for com
# cada elemento.
Jogadas = [2,50,100,200]                 # Número de jogadas do dado
Jogadores = 10000

## Simulando as jogadas
# Faremos aqui a criação das jogadas para cada jogador. Montaremos uma
# matriz em que as linhas representarão os resultados e as colunas
# representarão os jogadores. Em seguida será calculado a pontuação de cada
# jogador somando os pontos de cada jogada. Queremos mostrar também o
# quanto é prejudicial em termos de tempo o uso do laço FOR. Simularemos
# para os dois casos e computaremos o tempo:
import numpy as np   
import time 
import matplotlib.pyplot as plt
from matplotlib import mlab 
from scipy import stats
vtdf = np.ndarray([4])
vtdsem = np.ndarray([4])
plt.figure(1,[15,7])
for i_d in range(1,len(Jogadas)+1):
    n = Jogadas[i_d-1]                                        # Para um número "n" de jogadas
# Implementação com laço for:
    dcfs = time.clock()                                             # Inicia o cronômetro
    x = np.ndarray([n,Jogadores])
    y = np.ndarray([len(x[1,:])])
    for ic in range(n):
        x[ic,:]=np.ceil(6*np.random.rand(1,Jogadores))        # Gera números aleatórios entre o intervalo de 1 a 6 (faces do dado)

    for ik in range(len(x[1,:])):
        y[ik]=sum(x[:,ik])                             # Soma os pontos de cada jogador
    df = time.clock() - dcfs
    
    print('   ')                                             # Pula linha
    print(' Para ',n,' Jogadas')                 # Mostra número de jogadas atual 
    print(' Tempo com for = ',df,'s')             # Mostra tempo

# Implementação like-Matlab
    dsfs = time.clock()                                             # Inicia o cronômetro
    x = np.ceil(6*np.random.rand(n,Jogadores))                          # Gera matriz com jogadas
    y = sum(x)       # Calcula a pontuação de cada jogador, equivalente a sum(x,1) do Matlab
    #np.sum(x,1) não retorna o que queremos
    dsem = time.clock() - dsfs                                       # Tempo de execuçaõ sem FOR
    print(' Tempo sem for = ',dsem,'s')           # Mostra tempo
    print(' Razão = ',df/dsem,' vezes')           # Razão entre tempos 

## Display
# O número de plots dependerá da quantidade de elementos do vetor Jogadas.
# Em seguida no subplot() determinaremos quantos plots serão efetuados e
# qual a posição. Cada elemento de jogadas será representado em um quadrado
# no subplot.
    nPlots=len(Jogadas)                                 # Número de plots     
    pos = i_d  
    plt.subplot(220+pos)                         # Determinação de posicionamento dos plots
    binCtrs = np.arange(0,n*6+2)                                       # Centro de cada coluna dependem de "n"
    # Histograma gaussiano estimado
    mi = np.mean(y)                                           # Calcula média de cada jogador
    des = np.std(y)
    Tp = 1/Jogadores                                           # Calcula desvio padrão de cada jogador
    xi = np.arange(np.min(y),np.max(y)+Tp,Tp)
    ye = Jogadores*stats.norm.pdf(xi,mi,des)                        # Histograma estimado 
    #ye = Jogadores*mlab.normpdf(y,mi,des)
    #[yPlot, xPlot] = hist(ye,binCtrs)                     # Retorna posição do histohrama sem plotar 
    
    plt.plot(xi,ye,'k',linewidth=3.0)                         # Plota histograma esperado como linha
    plt.hist(y,bins=binCtrs,color='purple')                                        # Plota Histograma para cada eixo
    if n>2:plt.xlim([3*n,4*n]) #se n for muito pequeno, a visualização se compromete
    plt.title('n = '+ str(n))
    plt.xlabel('Soma')
    plt.ylabel('Frequência de ocorrência')
    # Legenda apenas no primeiro
    if (i_d==1):
        plt.legend(['Gaussiana','Dados'],loc='upper left')
    
    vtdf[i_d-1] = df                                          # Armazena vetor com tempo com FOR
    vtdsem[i_d-1] = dsem                                      # Armazena vetor com tempo sem FOR    
    

    # Novo plot para relacionar tempos de execução


plt.tight_layout()
plt.show()
plt.figure(2)
plt.plot(Jogadas,vtdf,'b-*')
plt.plot(Jogadas,vtdsem,'r-s')
plt.legend(['Tempo com laço for','Tempo sem laço for'])
plt.xlabel('Valor de n')
plt.ylabel('Tempo de execução [s]')
plt.show()