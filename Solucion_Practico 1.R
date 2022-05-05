
### Practico 1 - Taller R - Maestría en Estadística Aplicada

#  Actividad 1
x <- c(10,20,5,15,9,23,32,12,40) 

y <- c(100,149,75,125,93,166,211,108,251) 


#  Actividad 2
mean(y)
sd(y) 

#  Actividad 3
summary(y) # otras medidas resumen: mínimo, 1er cuartil, mediana, media, 3er cuartil  y máximo
var(y) #  varianza

#  Actividad 4
A <- matrix(x, nrow=3) # matriz cuadrada A con x
# otra forma:
#   A <- matrix(x, nrow=3, byrow= T)

B <- matrix(y, nrow=3) # matriz cuadrada B con y


#  Actividad 5: Obtenga un vector de medias y de varianzas para cada matriz:

mediasA <- c(mean(A[,1]),mean(A[,2]),mean(A[,3]))  # vector con las medias de las columnas de A
mediasA
#otra forma:
mediasA2 <- apply(A, 2, "mean")
mediasA2


varA <- c(var(A[,1]),var(A[,2]),var(A[,3])) # vector con varianzas de las columnas de A
varA 
# o
varA2 <- apply(A, 2, "var")

### CUIDADO!!!!  ########################
# Qué hace var(A)?
var(A)  # Es una matriz! Es la matriz de varianzas covarianzas de A, no es lo que se pide!!!
################################################

#  Actividad 6
ab <- A%*%B # producto de  A y B
ab

#  Actividad 7
inv_ab <- solve(ab) # inversa del producto de A y B

#verificación

ab%*%inv_ab
zapsmall(ab%*%inv_ab)


### CUIDADO!!!!  ########################
# Qué hace ab^{-1}?
# No es lo que buscamos!!!
################################################





