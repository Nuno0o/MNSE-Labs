# Relatório de MNSE : Lab1

## 1. Parte introdutória

Na primeira parte do trabalho prático, é pedida a conversão de um ficheiro `.mp3` para o formato `.wav`, utilizando diferentes frequências de amostragem e relatar as diferenças.

Depois de realizados testes sobre um ficheiro genérico `.mp3`, foram notadas drásticas diferenças.

Enquanto que o ficheiro áudio que possui uma frequência de amostragem de `44100hz` demonstra uma qualidade muito semelhante à do ficheiro original, sem diferenças audíveis, o de `11025hz` possui uma qualidade bastante inferior, notando-se também que o som é vagamente mais grave e possui algum ruído.

Isto deve-se probavelmente à utilização de filtros por parte do programa VLC que cortam frequências altas.

## 2. Variação da frequência de amostragem usando ou não filtros

Na segunda parte deste trabalho, é pedida a realização de sub amostragem de um ficheiro de som `.wav`, sendo esta feita com os fatores inteiros 4 e 2, utilizando ou não filtros `passa baixo`.

Sub amostragem consiste na redução do número de amostras presentes no som utilizado. Ao realizar uma sub amostragem com fator 2, uma em cada duas amostras é removida, enquanto que ao utilizar um fator 4, apenas se mantém uma em cada quatro amostras.

Para a realização dos testes, foi usado o ficheiro fornecido `batman_theme_x.wav` que possui `70464` amostras e uma frequência de amostragem de `11025hz`, em conjunto com 2 funções `Matlab` fornecidas `amostragemInterp_semFiltro.m` e `amostragemInterp_comFiltro.m`.

As duas funções reproduzem inicialmente o som com a taxa de amostragem normal, sendo este o resultante gráfico:

![alt text](nofilter4\1c364f7ec50da941afaf4f1de7d8d5ea.png)

Depois de realizada a sub amostragem do som, são obtidos os seguintes gráficos para os fatores `2` e `4` respetivamente:

Fator 2

![alt text](nofilter2\c35ed5552e079b78116896e34404ee06.png)

Fator 4

![alt text](nofilter4\d280ad776363626c15eeafe0533d02d5.png)

Pode-se observar que, devido ao efeito de aliasing, são introduzidas frequências altas que não existiam anteriormente.

Isto deve-se ao facto de que ao reduzir o número de  amostras, também se está a reduzir a taxa de amostragem, e assim esta passa a ser inferior a frequência de Nyquist, que é igual a 11025/2 hz. Isto impede que as frequências altas sejam reconstruidas com perfeito detalhe.

Ao não utilizar um filtro, os resultados obtidos depois da interpolação são os seguintes:

Fator 2

![alt text](nofilter2\9c2d8fd85250e059bef935345be195fe.png)

Fator 4

![alt text](nofilter4\5412a0ee2e0b0ac4be722ea34a9609be.png)

Como é evidente, embora a magnitude das baixas frequências seja relativamente realista, surgiram frequências altas mesmo depois da interpolação.

Torna-se assim necessário a utilização de um filtro `passa baixo` que permita cortar as frequências indesejadas:

Fator 2


![alt text](filter2\e4d1c32bdf4266485ed5d2e9014990c6.png)

![alt text](filter2\1a6f71e0ae7a5a075bae39dd54145b2a.png)

Fator 4

![alt text](filter4\235f06bfae815f542e595ad6856e45b5.png)

![alt text](filter4\fa3d65ee1267e0861d46d88f07d529c4.png)

Observando os gráficos da direita, conclui-se que o filtro atenua frequências aproximadamente para cima dos `5000hz` para a sub amostragem de fator 2 e `2500hz` para sub amostragem de fator 4, que são predominantemente os intervalos de frequências indesejadas.

Depois de efetuada a interpolação dos sinais filtrados, obtêm-se os seguintes resultados:

Fator 2

![alt text](filter2\923e1c8eb8abb9dcc18fd9070638387b.png)

Fator 4

![alt text](filter4\a059a12f126ae764a3382957aeb0b688.png)

Comprova-se assim que efetivamente as frequências indicadas anteriormente foram atenuadas de forma a prevenir o aparecimento de frequências altas que não estavam presentes.

Para os testes realizados, foram calculados os valores de `Erro médio quadrático` entre o sinal original e produzido, assim como a `Relação sinal-ruído de pico`, que indica a relação máxima entre a potência de um sinal e a potência do ruído sobreposto a este.

|Fator|Sem filtro|Com filtro| 
|:-:|:-:|:-:|
|**2**|`Erro = 0.009626 PSNR = 20.0974`|`Erro = 0.000824 PSNR = 30.7726`|
|**4**|`Erro = 0.042958 PSNR = 13.6015`|`Erro = 0.013163 PSNR = 18.7383`|

Como se pode confirmar pelos valores obtidos, fatores de sub amostragem menores geram um sinal com menor erro e maior PSNR, e a utilização de filtros também produz um erro menor e um PSNR maior.

Também se pode verificar que com um fator de 2 e utilização de filtro, o som possui um PSNR considerado aceitável, enquanto que os outros são medíocres.

Dum ponto de vista subjetivo, os sons produzidos possuíam distinguidamente uma pior qualidade, principalmente com fator de sub amostragem 4, no entanto a utilização de filtros retirou bastante ruído e produziu um som mais grave, no entanto com melhor qualidade do que sem filtro.

## 3. Experiências de quantização

Na terceira e última parte deste trabalho prático, foi pedida para realizar uma quantização uniforme sobre um ficheiro `.wav` com pelo menos `44100hz` e `16 bits` por amostra, reduzindo o número de bits de amostra para `8` e `4 bits` e relatar as diferenças observadas.

