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
