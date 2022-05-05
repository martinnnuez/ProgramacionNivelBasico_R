########################################################
# Tercer sesion de R                                   #
# Taller de Introducción al manejo de R                #
# Maestría en Estadística Aplicada. UNC                #
#                                                      #
########################################################


###############################
#        MATRICES             #
###############################

# Continuamos trabajando con Matrices
## Generar una matriz A de dimensión 5x4 con los datos del vercor x usando la función "matrix":

x <- (1:20)
x
A <- matrix(x, nrow = 5, ncol = 4)        
A

## Obtener medidas resumen para la matriz Z

summary(A)  
mean(A) 
sd(A) 

## Coordenadas de la matriz
# Podemos obtener los elementos de una matriz como con los vectores:

A[1,2]                   # el primer lugar indica la fila y el segundo, la columna


# Calcule la media de la primer columna de A

mean(A[,1])

# Calcule la varianza de la tercera fila de A 

var(A[3,])

## Si queremos un vector con las medias de todas las columnas? 
# Funcion "apply"

apply(A, 2, mean)
summary(A)


# calcule la suma de las filas de A:

apply(A,1,sum)

#suma individual
sum(A[1,])
sum(A[2,])
sum(A[3,])
sum(A[4,])

## Para formar matrices combinando vectores utilizamos
## las funciones "rbind" y "cbind".

x <- seq(5, 10, by = 0.5)
y <- 11:21

W <- rbind(x, y)
Z <- cbind(x, y)

class(W)
class(Z) #dice que son matrices ahora, generan matrices


## "cbind" y "rbind" funcionan para matrices tambien:

A1 <- matrix(0, 2, 2) #llena de ceros
A2 <- matrix(4:6, 2, 3) #vuelve a repetir los valores pq le deje menos numeros que lugares
A3 <- matrix(c(8, -2, 0, -1, 5, 6), 3, 2)


# Realice algunas combinaciones

cbind(A1,A2)
rbind(A1,A3)


## Podemos dar nombre a las filas y columnas.

## Ejemplo: Los siguientes resultados fueron obtenidos durante un 
# estudio sobre la concentracion de zinc (ppm) en muestras de distintas zonas 
# de un lago. 

#        fondo superficie
# Norte   0.43       0.42
# Sur     0.27       0.24
# Este    0.57       0.39
# Oeste   0.53       0.41
# Centro  0.70       0.61

# ?Como generamos esa matriz?

x <- c(0.43,0.42, 0.27, 0.24,0.57, 0.39,0.53, 0.41,0.70, 0.61)

zinc <- matrix(x,5,2,byrow=T)
zinc


## Nos faltan los nombres 

zonas <- c("Norte", "Sur", "Este", "Oeste", "Centro")
variables <- c("fondo", "superficie")

# "rownames" y "colnames"

rownames(zinc) <- zonas #le da los nombres de las filas y las columnas.
colnames(zinc) <- variables
zinc

## Tambien se puede crear directamente la matriz con nombres:

zinc <- matrix(x, nrow = 5, dimnames = list(zonas, variables))


# Seleccione los valores de concentracion de zinc en:
# - zona sur
# - fondo
# - zona sur y fondo 


zinc["Sur",]

zinc[,"fondo"]

zinc["Sur","fondo"]


getwd()
setwd("C:/Users/Jose Maria/Desktop/Taller de software")

# Guardemos esta matriz en el archivo "lago.RData"

save(zinc,file="lago.RData")

##  Operaciones con matrices:

# Operaciones con matrices

# A %*% B : producto de matrices
# t(A) : traspuesta de la matriz A
# solve(A) : inversa de la matriz A 
# solve(A,b) : soluci??n del sistema de ecuaciones  Ax=b.
# svd(A) : descomposici??n en valores singulares
# qr(A) : descomposici??n QR
# eigen(A) : valores y vectores propios
# diag(b) : matriz diagonal.  b  es un vector)
# diag(A) : matriz diagonal. A  es una matriz)
# A %o% B == outer(A,B) : producto exterior de dos vectores o matrices
# outer(X, Y, FUN = "*", ...) proporciona de forma predifinda el producto exterior de los dos arrays. 
# Sin embargo, podemos introducir otras funciones e incluso nuestras propias funciones en el argumento FUN.

##  Ejemplo:
# calcule la inversa y los autovalores y autovectores de A
A  =  matrix(c(1,3,3,9,5,9,3,5,6), nrow = 3)

A1 <- solve(A)

zapsmall(A%*%A1) #deberia dar identidad

?zapsmall #redondea para que la identidad de 1
?round
round(4.65)

###############################################################################
#  LISTAS
#
################################################################################

# Una lista es un vector genérico que contiene otros objetos

# genere un vector numérico de números pares

n <-  c(2, 4, 6) #numeric
n

# genere un vector con caracteres, "aa", "bb", "cc", "dd", "ee"

s <-  c("aa", "bb", "cc", "dd", "ee") #string
s

# genere un vector lógico TRUE, FALSE, TRUE, FALSE, FALSE

b <-  c(TRUE, FALSE, TRUE, FALSE, FALSE) #logico
b


class(n)
class(b)




# combine estos tres objetos y agregue un número 9 en un nuevo objeto usando la función list()


x <-  list(n, s, b, 3)   # x contiene los objetos n, s, b 
x

# llamando los objetos que están dentro de una lista usando []

x[2]  # devuleve una copia del objeto que está en el orden 2 de la lista

x[[2]] #devuelve 2 como vector
x[[2]][2]    # devuelve el segundo objeto del vector 2

# también puedo llamar más de un elemento de la lista

x[c(2,4)]

# otra manera más directa de llamar objetos que están en una lista es usando doble [[]]

x [[2]]  # nos devuelve el objeto de orden 2 de la lista pero no una copia

# para modificar un objeto de la lista en forma directa

x[[2]][1]<- "ta"  #cambiando un objeto, sobreescribo

x[[2]] # muestra el objeto s con un nuevo elemento "ta". Pero no modificó el objeto original

s #el vector original no se modifica

#Poniendo nombres a los objetos que conforman la lista
names(x) <- c("nom1", "nom2", "nom3", "nom4")

x

x$nom1
x$nom2


######################################
#         ARREGLOS                   #
######################################

## Otra forma de generar matrices:

# Las matrices son arreglos ("array") de dimension 2 


## Supongamos que queremos generar una matriz 3x6 con los elementos del
# vector b


b <- seq(-2, by = 2, length.out = 18)

B1 <- array(b, dim = c(3,6))
B1

## Pero "array" nos permite tener arreglos de mas dimensiones.

## Consideremos un arreglo de 3 dimensiones

D <- array(1:24, c(3,4,2))
D

# ?Como seleccionamos los elementos de un arreglo?

# Seleccione el numero 1

D[[1]]
D[1,1,1]

# Seleccione el numero 13

D[[13]]

# Seleccione el numero 15

D[[15]]



## Tambien podemos considerar subconjuntos de un array

D[, , 1]  # es un array de dimension c(3,4)

V<-array(1:16,c(2,2,4))#EJEMPLO 4 DIMENCIONES
V

############################################
#        HOJAS DE DATOS (DATA FRAMES)      #
############################################

## Que pasa si los datos que tenemos son de distinto tipo?
# (variables continuas y categoricas, por ejemplo) 

# Las hojas de datos ("data.frames") son la forma mas usual para almacenar
# los datos experimentales.

# Pueden pensarse como matrices donde las columnas son de diferentes clases.


x1 <- 1:10
x2 <- 24:33
x3 <- gl(2, 5, labels = c("si","no"))
x4 <-letters[1:10]

x1
x2
x3
x4


# Consideremos una matriz X cuyas columnas sean x1, x2 y X3.
# Y una matriz Y cuyas columnas sean x1, x2, x3 y x4.

X <- cbind(x1, x2, x3)
Y <- cbind(x1, x2, x3, x4)


# De que tipo es cada columna de X y de Y? Es eso lo que queriamos? 

#qudan todas como caracteres pq es el requisito de la matriz
class(Y)

class(X[,1])
class(X[,3])#combierte a numerico integer

class(Y[,3])#combierte a caracter



## Lo adecuado es utilizar la funcion "data.frame"

Z <- data.frame(x1, x2, x3, x4)#cada columna tiene su clase correcta
Z

## o, asignando otros nombres a las columnas:

Z <- data.frame(Adad = x1, Bwerw = x2,  ffafa= x3, D = x4) #cambiamos el nombre de las columnas
Z

class(Z[,1])
class(Z[,2])
class(Z[,3])
class(Z[,4])

Z$A
class(Z)

# Podemos convertir una matriz con datos numericos en una hoja de datos. 
# Carguemos el archivo "lago.RData"

setwd("C:/Users/Jose Maria/Desktop/Taller de software")
load("lago.RData")
zinc
class(zinc)

# Convierta la matriz zinc en un data frame, usando el comando "as.data.frame".
# Llamelo zinc.df

zinc.df <- data.frame(zinc)
zinc.df
class(zinc.df)

## Tambien podemos a??adir alguna columna a un data frame:

especialista <- c("Toledo", "Toledo", "Toledo", "Buteler", "Buteler")
zinc.df <- data.frame(zinc.df, especialista)
class(especialista)
zinc.df
zinc.df$especialista

## Operador $

## Es facil acceder y crear nuevas columnas con el operador "$" cuando estas 
# tienen nombre

zinc.df$fondo
zinc.df$superficie

zinc.df$fecha <- factor(c(1,2,1,2,1),labels=c("marzo","abril"))#agregamos columna fecha con abril y marzo

zinc.df

# Tambien puede usarse la notacion matricial para extraer filas y columnas
# Extraiga la columna 2

zinc.df$superficie
zinc.df[,2]


# Extraiga los datos de zona Este

zinc.df["Este",]
zinc.df["Norte",]

# Que informacion nos da "str" y "summary" de un data frame?

str(zinc.df)
summary(zinc.df)

# Le dijimos que "especialista" era factor? 

class(especialista)
class(zinc.df$especialista)


# "data.frame" convierte los vectores de caracteres en factores automaticamente.


## Funcion "attach"  
# Sirve cuando vamos a trabajar con un conjunto de datos y queremos escribir menos!
# Permite que las columnas dentro de un data frame puedan tratarse temporalmente
# como variables con ese nombre.
# Los objetos con el mismo nombre de alguna columna NO son reemplazados.

fondo

zinc.df$fondo

attach(zinc.df)

fondo
especialista

# Calcule la concentracion media de zinc en los valores de la superficie
mean(superficie)

# Para desconectar una hoja de datos, use "detach"

detach(zinc.df)
fondo
superficie
fecha
especialista
