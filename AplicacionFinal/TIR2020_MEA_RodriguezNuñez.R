#-------------------------------------------------------------------------
#  Ejercicio integrador del Taller de Introducción al software R 
#   Maestría en Estadística Aplicada - UNC
#                 2020
#-------------------------------------------------------------------------

# Consigna:
# Resolver los ejercicios que se describen a continuación escribiendo las sentencias correspondientes
# El ejercicio integrador es individual
# Guardar el script colocando el siguiente nombre TIR2020_MEA_Apellido.r
# Subir el script al aula virtual

# Los datos del archivo bioenv.txt corresponden a 30 observaciones biológicas y ambientales sobre el lecho marino.
# Las columnas denominadas a, b, c, d y e son cinco de las especies identificadas y contienen recuentos de las mismas. 
# Las variables contaminación, profundidad y Temperatura representan variables ambientales y son del tipo continuas. 
# La columna denominada sedimento es una variable categorizada en función de la clasificación del sedimento: 
# S= arcilla/limo, S=arena y G=grava/piedra (Greenacre y Primicerio, 2013). 

# 1) a) Cargue los datos del archivo "bienv.txt". Tenga en cuenta que las columnas tienen nombre. 
#    b) Asegurese de que la variable "Sedimento" sea un factor. 
#a)
setwd("C:/Users/Jose Maria/Desktop/Taller de software/parcial")
datos<-read.table("bioenv.txt",header=T)
head(datos)

#b)
is.factor(datos$Sedimento)
as.factor(datos$Sedimento)

# 2) Trabaje sobre el objeto creado a partir del archivo bienv.txt

#   a) Obtenga medidas descriptivas de la variable Contaminación (Media, Desvio Estándar, Mínimo y Máximo).
media = mean(datos$Contaminación)
desvio = sd(datos$Contaminación)
maximo = max(datos$Contaminación)
minimo= min(datos$Contaminación)
media
desvio
maximo
minimo


#   b) Obtenga la media y el desvío estandar de la variable profundidad según el tipo de sedimento.
medias<-tapply(datos$Profundidad,datos$Sedimento,mean)
desvios<-tapply(datos$Profundidad,datos$Sedimento,sd)
medias
desvios

class(medias)
dim(medias)

#   c) Escriba una función que calcule el coeficiente de variación  y lo exprese en porcentaje.

#Imprime una frase previa al valor deseado 
fcv<- function(x,y){
  med=x
  des=y
  cv=des/med
  p=cv*100
  print(paste("Desvio Estandard(%):",p))
}

fcv(4,2)

#Imprime directamente el valor deseado
fcv2<- function(x,y){
  med=x
  des=y
  cv=des/med
  p=cv*100
  return(p)
}

fcv2(4,2)

#   d) Use la función de d) para calcular el CV de la Profundidad para cada sedimento

#Imprime las frases
cvgrupoC=fcv(medias[[1]],desvios[[1]])
cvgrupoG=fcv(medias[[2]],desvios[[2]])
cvgrupoS=fcv(medias[[3]],desvios[[3]])

#Cree una lista de valores por si se desea utilizar en el futuro los valores calculados
coefvar <-list(fcv2(medias[[1]],desvios[[1]]),fcv2(medias[[2]],desvios[[2]]),fcv2(medias[[3]],desvios[[3]]))
coefvar

#Obtencion cv a traves de un bucle for
cv=numeric(dim(medias))

for(i in 1:dim(medias)){
  c=desvios[i]/medias[i]
  cv[i]=100*c
  }

cv

# 3) Realice un grafico de dispersión de la Temperatura en función de la profundidad
#    coloree cada tipo de sedimento
#    coloque las leyendas para cada tipo de sedimento
#    Utilice puntos redondos como símbolos

library(ggplot2)
ggplot(data = datos) + 
  geom_point(mapping = aes(x = Temperatura, y =Profundidad, color=Sedimento),shape=16)+
  xlab("Profundidad")+
  ylab("Temperatura")+
  ggtitle("Temperatura vs Profundidad")+
  theme_bw()
