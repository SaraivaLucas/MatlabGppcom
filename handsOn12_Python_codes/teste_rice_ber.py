import numpy as np
import matplotlib.pyplot as plt 

#Dados iniciais
N=10**6 #Number of data samples to send across the Rician Channel
EbN0dB= np.arange(-5,20,2) #Eb/N0 in dB overwhich the performance has to be simulated
totPower=1 # Total power of LOS path & scattered paths
K=np.array([1,2,5,10,20,30]) #lista dos fatores K ricianos

d=np.random.rand(N)>0.5 #data generation
x=2*d-1 #BPSK modulation
simBER_ricean=np.zeros(len(EbN0dB))
plotStyle=['b*-','r*-','k*-','g*-','m*-','c*-']
legendas = []
for index in range(len(K)):
    k=K[index]
    #Derive non-centrality parameter and sigma for the underlying
    #Gaussian RVs to generate the Rician Envelope
    s=np.sqrt(k/(k+1)*totPower) #Non-Centrality Parameter
    sigma=totPower/np.sqrt(2*(k+1))
    for i in range(len(EbN0dB)):
        noise=1/np.sqrt(2)*(np.random.randn(N)+1j*np.random.randn(N)) #AWGN noise with mean=0 var=1
        h=((sigma*np.random.randn(N)+s)+1j*(np.random.randn(N)*sigma+0)) #Rician Fading - single tap
        n = noise*10**(-EbN0dB[i]/20) #Scaling the noise for required Eb/N0
        y_ricean=h*x+n #received signal through Rician channel
        #Coherent Receiver for Rician Channel
        y_ricean_cap=y_ricean/h #Assuming that h is known at the signal accurately
        r_ricean=np.real(y_ricean_cap)>0 #received symbols = 1 is real part > 0 or else it is 0
        #Receiver for AWGN channel
        simBER_ricean[i]=np.sum(np.bitwise_xor(d,r_ricean))
    simBER_ricean=simBER_ricean/N
    #Simulated BER
    EbN0=10**(EbN0dB/10) #Eb/N0 in Linear Scale
    plt.semilogy(EbN0dB,simBER_ricean,plotStyle[index])
    legendas.append('K = ' +str(K[index]))

plt.axis([-5,20,10**(-5),10**0])
plt.legend(legendas)
plt.title('Eb/N0 Vs BER for BPSK over Rician Fading Channels with AWGN noise')
plt.xlabel('Eb/N0(dB)')
plt.ylabel('Bit Error Rate or Symbol Error Rate')
