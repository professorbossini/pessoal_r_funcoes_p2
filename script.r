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
  
