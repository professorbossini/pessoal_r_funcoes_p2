#constante previamente definida
pi
#pode ser sobrescrita!
pi <- 5
pi
#volte ao normal removendo o valor atribuído a pi
rm(pi)
pi
##################################################
#para conjuntos
x <- c(1, 2, 3, 4, 5); x
y <- c(3, 4, 5, 6, 7); y
union(x,y)
intersect(x,y)
#responde se são iguais
?setequal
#false
setequal(x, y)
#true
setequal(c(1, 2), c(1, 2))

#diferença entre conjuntos
#todos os que estão em x mas não em y
setdiff(x, y)
setdiff(c(1, 2), c(1, 3))

#devolve um vetor de booleanos
#para cada elemento do primeiro, um booleano indica se ele pertence ao segundo
#TRUE
is.element(c(1), c(1, 2))
#TRUE FALSE FALSE
is.element(c(1, 2, 3), c(1))
##################################################
#funções estatísticas
x <- 1:5;x
#média
mean(x)
#desvio padrão
sd(x)
#correlação
cor(x, x)#1
cor ((1:100)^2, log(1:100)) #0.77
cor (c(1, 2, 3), c (10, 53, 4)) #-0.11
##################################################
#funções probabilísticas
?runif
#vinte observações no intervalo de 0 a 10, distribuição uniforme
#random uniform
runif(20000000, min=0, max=10)
#vinte observações, distribuição normal
rnorm(20, mean=0, sd=10)
?sample
#uma permutação envolvendo o intervalo 1:5
sample(5)
#permutação intervalo 1:10
sample(1:10)
#com reposição
sample(1:10, replace=T)
#especificando quantidade, com reposição
sample(1:100, 6, replace=T)
##################################################
x <- "Hello, Strings"
y <- "Análise de dados"
#número de caracteres de cada string
nchar(c(x,y))
#quebra usando um símbolo especificado
strsplit(c(x, y), split = " ")
#substring
#ell
substr(x, start=2, stop=4)
#e
substr(x, start=2, stop=2)
#cadeia vazia
substr(x, start=2, stop=1)
#se start=0, começa do 1 mesmo assim
substr(x, start=0, stop=5)
#qualquer valor negativo faz começar do 1
substr(x, start=-1, stop=2)
substr(x, start=-12, stop=2)
?chartr
#substituição de caracteres
#tr: translate
#Hello, StringS
chartr('hs', 'HS', 'hello, strings')
?strtrim
#recebe um vetor e um valor inteiro de "width"
#normal para o nosso alfabeto, por exemplo
strtrim("ABC", 2)
#width é a largura
#em japonês, por exemplo, há caracteres de
#全角: largura completa
#半角: metade do tamanho
#Esse é um half width: ﾣ
#Esse é um full width: ￥
#mostra ﾣ pois ele é half width 
strtrim('ﾣ', 1)
#mostra a cadeia vazia pois ele é full width
strtrim('￥', 1)
#mostra ￥
strtrim('￥', 2)

#letras maiúsculas e minúsculas
toupper('Hello, Strings')
tolower("Hello, Strings")
#Title Case
tools::toTitleCase('josé da silva')
#também dá pra fazer assim
library(tools)
toTitleCase("maria silva")

#busca padrões baseados em expressões regulares
?sub
#substitui somente o primeiro da esquerda para a direita
#An* Maria
sub("a", "*", "Ana Maria")
#globalsub: substitui todos
?gsub
#An* M*ri*
gsub("a", "*", "Ana Maria")
##################################################
#Funções lógicas
x <- c(T, F)
y <- c(T, T)
z <- c(F, F)
#alguém resulta em TRUE?
#TRUE
any(x)
#TRUE
any(y)
#FALSE
any(z)

#todos resultam em T?
#FALSE
all(x)
#T
all(y)
#F
all(z)
#################################################################
#Exercícios resolvidos
#################################################################
#1. Abra o arquivo cancer.txt como um data frame e faça um sumário estatístico dos dados.
arq <- read.table(file = "cancer.txt", header = T);arq
#################################################################
#2. Faça o histograma das variáveis LDH, ALB e N. Use a descrição da coluna como título de cada um. Use cores diferentes.
#parâmetro para os gráficos
#disposição de uma linha e três coluna (mfrow: posicionamento da esquerda para a direita. Se usar mfcol: posicionamento de cima para baixo)
par(mfrow = c(1,3))

hist(arq[, 'LDH'], main = 'Enzima, lactate dehydrogenase', xlab = 'LDH', ylab = 'frequência absoluta', col = 'red')

hist(arq[, 'ALB'], main = 'Albumina', xlab = 'ALB', ylab = 'frequência absoluta', col = 'blue')

hist(arq[, 'N'], main = 'Nitrogênio na uréia', xlab = 'N', ylab = 'frequência absoluta', col = 'green')

#volta configurações de gráfico ao normal
par(mfrow = c(1, 1))
#################################################################
#3. Médicos afirmam que o grupo dos falso-positivos é mais jovem do que o dos falso negativos. O que você diria a respeito? Justifique sua resposta baseando-se em gráficos e medidas de tendência central.
par(mfrow = c(1, 2))
#idade de falsos positivos
boxplot(arq[arq$Grupo==4, 'Idade'], main = 'Falso positivo', ylab = 'Idade', col = 'lightblue')
#idade de falsos negativos
boxplot(arq[arq$Grupo==1, 'Idade'], main = 'Falso negativo', ylab = 'Idade', col = 'lightgreen')
par(mfrow = c(1, 1))
#pelos boxplots, vemos que a mediana de falso negativos é maior do que a de falsos positivos
#resumo de idade de falsos positivos
summary(arq[arq$Grupo==4, 'Idade']) #Média: 50.94
summary(arq[arq$Grupo==1, 'Idade']) #Média: 53.27
#Observe que tanto mediana quanto média de falsos negativos é maior
#Assim os falsos positivos são mais jovens
#################################################################
#4. Compare a glicose dos pacientes falso positivos e dos falso negativos. Para 
#isso, use a média, a mediana, a variância e o desvio padrão. O que você conclui?
#glicose de falsos positivos
gfp <- arq[arq$Grupo==4, 'GL'];gfp
#glicose de falsos negativos
gfn <- arq[arq$Grupo==1, 'GL'];gfn

#resultado
sfp <- sprintf('Resultados\nMédia(gfp): %.2f\nMédia(gfn): %.2f\nMediana(gfp): %.2f\nMediana(gfn): %.2f\nVariância(gfp): %.2f\nVariância(gfn): %.2f\nDesvio padrão(gfp): %.2f\nDesvio padrão(gfn): %.2f\n', mean(gfp), mean(gfn), median(gfp), median(gfn), var(gfp), var(gfn), sd(gfp), sd(gfn))

#para pular linha com \n
cat(sfp)
print ("Falsos positivos têm nível de glicose maior, bem como maior variabilidade")
#################################################################
#5. Obtenha as medidas de posição e variabilidade para a variável Idade do conjunto 
#de dados como um todo. #faça um teste com arq['Idade'] para ver o problema qdo o retorno é um data frame
#tipo é dataframe
arq['Idade']
class(arq['Idade'])
#não dá
mean(arq['Idade'])
#class é integer
class(arq[,'Idade'])
#assim dá
mean(arq[,'Idade'])
#assim também dá
idade_tot <- arq$Idade;idade_tot
#class também é integer com essa notação
class(idade_tot)
s_idade_total <- sprintf (
    "Média: %.2f\nMediana: %.2f\nVariância: %.2f\nDesvio Padrão: %.2f\n",
    mean(idade_tot),
    median(idade_tot),
    var(idade_tot),
    sd(idade_tot)
)
#exibe \n literal
print(s_idade_total)
#\n pula linha
cat(s_idade_total)
#################################################################
#6. Faça o mesmo do exercício 5, mas agora para cada tipo de diagnóstico. Compare os resultados obtidos. Construa um data frame para facilitar a visualização e a comparação
#a ideia é montar um dataframe assim:
#             total falso_negativo, negativo, positivo, falso_positivo
#media            1               2 e assim por diante
#mediana
#variância
#desvio padrão
#FN: 1
#N: 2
#P: 3
#FP: 4
#pegamos os conjuntos
idade_fn <- arq[arq$Grupo==1, 'Idade']
idade_n <- arq[arq$Grupo==2, 'Idade']
idade_p <- arq[arq$Grupo==3, 'Idade']
idade_fp <- arq[arq$Grupo==4, 'Idade']
idade_tot <- arq[, 'Idade']

#linha (vetor) para as medidas de todos
v_tot <- c(mean (idade_tot), median (idade_tot), var(idade_tot), sd(idade_tot));v_tot
#linha (vetor) para cada subconjunto
v_fn <- c(mean(idade_fn), median (idade_fn), var(idade_fn), sd (idade_fn));v_fn
v_n <- c(mean(idade_n), median(idade_n), var(idade_n), sd(idade_n));v_n
v_p <- c(mean(idade_p), median(idade_p), var(idade_p), sd(idade_p));v_p
v_fp <- c(mean(idade_fp), median(idade_fp), var(idade_fp), sd(idade_fp));v_fp
#titulos das linhas
v_linhas <- c("média", "mediana", "variância", "desvio padrão");v_linhas
#dataframe
df_idade <- data.frame(
              total=v_tot, 
              falso_negativo=v_fn, 
              negativo=v_n, 
              positivo=v_p, 
              falso_positivo=v_fp,
              row.names = v_linhas
            );
df_idade
#lembre que os positivos incluem falso_negativos e positivo de fato
# assim como os negativos são os falso_positivos e negativos de fato

#7. Crie uma amostra aleatória do arquivo câncer.txt com 100 linhas e faça o sumário de medidas de posição. Compare as medidas de posição da variável Idade da amostra com as medidas de posição da variável Idade do conjunto completo. O que você observa?
#medidas de posição: media, mediana e quartis
#medidas de dispersão: variância e desvio padrão

#100 identificadores aleatórios
sample(arq$Ident, 100)
#vetor de booleanos que indica quais idents estão na amostra e quais não estão
is.element(arq$Ident, sample(arq$Ident, 100))
#pegamos as 100 observações aleatórias
arq100 <- arq[is.element(arq$Ident, sample(arq$Ident, 100)), ];arq100
#mostra medidas de posição (media, mediana e quartis para cada variável)
summary(arq100)
summary(arq)

