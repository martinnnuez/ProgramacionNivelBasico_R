#PRACTICO NUMERO 3:
#A. Trabajamos sobre un data frame
#Considere el archivo zapallo que se encuentra en la carpeta de Actividades Prácticas en el Aula Virtual de la Segunda Semana. El mismo se encuentra en formato .txt.
#a) Genere en R un data frame en el directorio c:/TallerSoft/
setwd("C:/Users/Jose Maria/Desktop/Taller de software")
datos <- read.table("zapallo.txt",header=T)
datos
#b) Que dimensión tiene el data frame?
dim(datos)
#c) Renombre el objeto original cambiando el nombre del objeto por VarZapallo y la variable Tipo por Variedad
VarZapallo <- datos
colnames(VarZapallo)[1] <- "Variedad"
VarZapallo
#d) Calcule la media, el desvío estándar, el mínimo, el máximo y el coeficiente de variación para la variable Rinde según el Tipo.
a<-tapply(VarZapallo$Rinde,VarZapallo$Variedad,mean)
tapply(VarZapallo$Rinde,VarZapallo$Variedad,min)
tapply(VarZapallo$Rinde,VarZapallo$Variedad,max)
b<-tapply(VarZapallo$Rinde,VarZapallo$Variedad,sd)
cv<-a/b
cv

#e) Genere un objeto que tenga el Tipo de zapallo y otro objeto con los Rinde
#Primero los guardo como data frame
Variedad <- data.frame(VarZapallo$Variedad)
Variedad

Rinde <- data.frame(VarZapallo$Rinde)
Rinde
#Los guardo como vector
VariedadV <- VarZapallo$Variedad
RindeV <- VarZapallo$Rinde

#f) Combine esos dos objetos en una lista. Que diferencias nota con el data frame?
listadf <-list(Variedad,Rinde)
listadf

listavec <- list(VariedadV,RindeV)
listavec

#La diferencia que noto con el data frame del principio es que en las listas los elementos se encuentran diferenciados en dos archivos distintos, mientras que en el data frame se encontraban 
#referenciados a un suceso particular enumerado. 