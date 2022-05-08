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
