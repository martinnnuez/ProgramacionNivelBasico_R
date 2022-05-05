@
########################################################
# Cuarta sesion de R                                   #
# Taller de Introducción al manejo de R                #
# Maestría en Estadística Aplicada. UNC                #
#                                                      #
########################################################

#es importente concoer el directorio de trabajo o seleccionarlo
getwd()
# Si estan trabajando sobre windows, getwd() indica el directorio de trabajo usando / como separador de carpetas
setwd(choose.dir())
setwd("C:/Users/Jose Maria/Desktop/Taller de software")
# otra opción para especificar el directorio de trabajo es setwd("dir").
# choose.dir() abre una nueva ventana de window para seleccionar el directorio de trabajo interactivamente.

# como leer un archivo desde una tabla y convertirla en un dataframe?
datos <- read.table("Archivo1.txt",header=T)
datos
class(datos)

plant <- read.csv("PlantGrowth.csv", header=T)
dim(plant) #cantidad de elementos
plant

#leer archivos desde la memoria de la máquina al copiar
datos2 <- read.table("clipboard",header=T,sep="\t")
datos2


dim(datos)
# generar una secuencia desde el 1 hasta el 10

 seq(10)

# genera una secuencia comenzando en 3 hasta el 10

seq(3,10)

# genera una secuencia comenzando en 2 hasta 8 saltando de 0.5 en 0.5

seq(2,8,0.5)


# repite el 1, 10 veces

rep(1,10)

# genere un vector donde el 1 se repita 5 veces, el 2 tres veces y el 3 o veces


c(rep(1,5),rep(2,3),rep(3,8))

# genere un vector con un caracter que se repita 7 veces

rep("A",7)

#quiero agregar un elemento al data frame
datos1 <- data.frame(datos, rep("A",9))
datos1

# Ejercicio 1. Convertir los siguientes datos en un dataframe, la primer columna corresponde a
# dos variedades de una planta y la segunda la número de flores por planta. Guardar el dataframe como geranio

variedad <- c("A","A","A","A","A","A","A","B","B","B","B","B","B","B")
Nflor <- c(4,3,7,5,2,9,1,6,4, 10, 7,12,5,10)

geranio  <- data.frame(variedad, Nflor)
geranio

planta2  <- c(rep("A",7),rep("B",7))

geranios.andy <- read.table("clipboard",header=T)

geranios.andy
class(geranios.andy)

# Ejercicio 2. Asegurarse que la columna 1 lleva por nombre variedad y la columna dos Nflores.
geranio2  <- data.frame(variete=variedad, numflor=Nflor)
geranio2

#no pude cambiar nombre #geranio <- data.frame(planta = "variedad", numflor = "Nflores")

geranio$variedad
# La primer columna es un factor?
is.factor(geranio$variedad)

#Ejercicio 3. Calcular una estadística descriptiva con media, desvío estándar, mínimo y máximo del archivo geranio

mean(geranio$Nflor)
min(geranio$Nflor)
max(geranio$Nflor)
sd(geranio$Nflor)

mean(geranio$Nflor)

#No andawhich.mean(geranio$Nflor)

# otra forma de cargar "Inline" un conjunto de datos es usando text=

inline <- read.table(header = TRUE, text = "
a b
1 2
3 4
")
inline

class(inline)
# ordenar  filas de un archivo, sort? u order?
order(inline)

# ordenar el geranio por el número de flores por planta y guardar el archivo ordenada como geranio.orden

geranio.orden <- sort(geranio$Nflor, decreasing=F)#ordena como vector
geranio.orden

geranio.order <-geranio[order(geranio$Nflor)] #deja un data frame ordenado
geranio.order

# usar la función order para más de un criterio

geranio.orden2 <- geranio[order(-geranio$Nflor, geranio$variedad),]
geranio.orden2

#eliminar filas
geranio
geranio.nuevo <- geranio[-3, ]
geranio.nuevo

dim(geranio)

# La familia apply

#creamos una matriz en un arreglo de 3 columnas  y la llamamos A

A=matrix(seq(9),byrow=T,ncol=3)
A

apply(A,2,mean)

#repasemos algunas cosas

# remplaza el valor de la fila 3, columna 2 por 80

A[3,2]=80

# Que dimensión tiene la matriz A?

dim(A)

# Cuantas filas y cuantas columnas tiene la matriz A?

ncol(A)
nrow(A)

# El uso del which como indice de valores
# Cuál es el máximo valor de la matriz A?

A[which.max(A)]

which.max(A)

# Cuales son los valores ubicados en posiciones mayores de ?

which(A>6)

# 

# la familia apply

# calcular la media por filas de la matriz A

medias.por.fila <- apply(A, 1, mean)

# calcular medias por columnas de la matriz A

medias.por.columna <-apply(A, 2, mean)

# calcular medias de la matriz A por fila considerando que puede haber falores faltantes

por.si.na <- apply(A, 1, mean, na.rm=TRUE)



sample.row <- apply(A,1, sample)
sample.row

help("sample") #sample takes a sample of the specified size from the elements of x using either with or without replacement.
# usamos la función apply para armar una tabla de resultados

mitabla=cbind(
apply(A,2,mean,na.rm=T),
round(apply(A,2,sd,na.rm=T),1),
apply(A,2,min,na.rm=T),
apply(A,2,max,na.rm=T))
colnames(mitabla)=c("Media","DS","Min","Max")
mitabla

# La función tapply(x, y, funcion) calcula la función especificada sobre el objeto x
# según las categorías de Y

geranio.media <-tapply(geranio$Nflor, geranio$variedad, mean)
geranio.media

#tarea calcular para sd min max
geranio.min <-tapply(geranio$Nflor, geranio$variedad, min)
geranio.min

geranio.max <-tapply(geranio$Nflor, geranio$variedad, max)
geranio.max

geranio.sd <-tapply(geranio$Nflor, geranio$variedad, sd)
geranio.sd

#otra forma
mean(geranio[(geranio$variedad=="A"),2])
mean(geranio[(geranio$variedad=="B"),2])

mean(geranios[which(geranios$variedad=="A"),2])
mean(geranios[which(geranios$variedad=="B"),2])

#funciona con y sin el which porque

