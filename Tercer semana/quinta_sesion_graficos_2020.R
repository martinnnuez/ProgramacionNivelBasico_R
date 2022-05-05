
#################################################################################
#        Cuarta sesión de R . Taller de Software I. Introducción a R            #
#         Maestría en Estadística Aplicada. UNC                                 #
#                             2020                                              #
#################################################################################


# Graficando en R
# No olvidar elegir el directorio de trabajo
getwd() #para saber que directorio de trabajo lee
setwd(choose.dir()) #para seleccionar un nuevo directorio de trabajo

help(iris) #para ver la descripción del archivo de Fisher

attach(iris)
# Usando el comando plot
# plot(x,y) represente el gráfico de dispersión
# del largo de pétalo en función del largo de sépalo con

names(iris)
#"Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"   
Sepal.Length

plot(Petal.Length,Petal.Width)
View(iris)

# Este comando por defecto coloca etiquetas en los ejes, escala, densidad de línes, et.

# colocar un título al gráfico

plot(Petal.Length,Petal.Width, main="gráfico de dispersión")

# cambiar las etiquetas de los ejes y el título

plot(Petal.Length,Petal.Width, main="Iris", xlab= "Largo del Pétalo", ylab="Ancho del Pétalo" )

#cambiar el tipo de punto con "pch"

plot(Petal.Length,Petal.Width, main="Iris", xlab= "Largo", ylab="Ancho", pch=16 )

         
plot(Petal.Length,Petal.Width, main="Iris", xlab= "Largo", ylab="Ancho" , xlim=c(0,20), ylim=c(0,10) )

# cambiar el tamaño de la leyenda del eje
plot(Petal.Length,Petal.Width, main="Iris", xlab= "Largo", ylab="Ancho", cex.lab=2,cex.axis= 1.0)

# para adicionar puntos al gráfico

points(Petal.Length,Petal.Width, main="Iris",  xlab= "Largo", ylab="Ancho", type="p", pch=3, col="red")

#colores tanto con numeros como con letra

#o un punto cualquiera:
points(3,1.8, pch=12, col=3)

#Podemos graficar cada especie de un color distinto
# y agregar leyendas

plot(Petal.Length,Petal.Width, main="Iris", xlab= "Largo", ylab="Ancho",  col=Species, pch=16)

especie <- levels(iris$Species) # función levels devuelve niveles de un argumento
legend("bottomright", especie , col = c(1,2,3), pch=16)


# ggplot

library(ggplot2)

ggplot(data = iris) + 
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width))

#cambiando algunas cosas:
ggplot(data = iris) + 
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width))+
  xlab("Largo del Pétalo")+
  ylab("Ancho del Pétalo")+
  ggtitle("Iris")+
  theme_bw()

#theme_bw() para ponerle el fondo blanco

## aes: "aesthetics": cualidades visuales del gráfico: forma, color, tamaño, etc. 

# agregamos color por especie
ggplot(data = iris) + 
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color=Species))



# cambiamos tamaño por el largo del sépalo

ggplot(data = iris) + 
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color=Species, size=Sepal.Length))


# o en diferentes gráficos (uno por especie):
ggplot(data = iris) + 
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color=Species))+
  facet_wrap(~Species)


#podemos suavizar:
ggplot(data = iris, mapping = aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point() + 
  geom_smooth(method="lm")

?geom_smooth

#o suavizar por especie
ggplot(data = iris, mapping = aes(x = Petal.Length, y = Petal.Width, color=Species)) + 
  geom_point() + 
   geom_smooth(se=FALSE)

# Ejercicio

# Inspeccione los datos mpg

help(mpg)

# Grafique la eficiencia de los autos en la autovía (hwy) con respecto al tamaño del motor (displ)
# cambiando tipo de punto relleno y  con distintos  colores, formas o tamaños para las clases de autos (class). 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = displ, color=class))+
  theme_bw()

####### Histogrmas y Boxplots

# Trabajaremos con el archivo Ajoblanc
Ajoblanc<-read.table("Ajoblanc.txt", header=TRUE, dec = ",")
View(Ajoblanc)

# histograma de frecuencias

hist(Ajoblanc$perim)

# Y si queremos otros intervalos?

interv <- seq(5,30,0.5)
hist(Ajoblanc$perim, breaks = interv)

# Cambiar el título del gráfico a Histograma del perimetro
# y las leyendas de los ejes a "perimetro" y "Frecuencias" y
# pintarlo de rojo
hist(Ajoblanc$perim, breaks = interv, main="Histograma del perimetro", xlab= "perimetro", ylab="Frecuencias",col=2)


## ggplot

ggplot(data=Ajoblanc, aes(x=perim))+
  geom_histogram(binwidth=1)

ggplot(data=Ajoblanc, aes(x=perim))+
  geom_histogram(binwidth=1, color="black", fill="lightblue")

# año como factor para que haga un histograma por año
Ajoblanc$Año<-as.factor(Ajoblanc$Año)
ggplot(data=Ajoblanc, aes(x=perim,  fill=Año))+
  geom_histogram(binwidth=1,color = "black")
#fill adentro del aes diferencia por años.

# boxplot

# gráfico de caja de la variable peso

boxplot(Ajoblanc$peso)

# gráfico de caja de la variable perimetro para cada año

boxplot(perim~Año, data=Ajoblanc)

# pintar la caja de cada año

boxplot(perim~Año, data=Ajoblanc, col=c("red", "blue"))

# Para ver los dos gráficos en la misma ventana
# par(mfrow=c(filas, columnas))

par(mfrow=c(1,2))

boxplot(Ajoblanc$perim,col= 5,  main= "boxplot", ylab= "perímetro", las=1)
hist(Ajoblanc$perim, col=5, main="histograma", xlab="perímetro", ylab= "frecuencia", las=1)

par(mfrow=c(1,1))

## ggplot

ggplot(data=Ajoblanc, aes(x=Año, y=perim))+
  geom_boxplot()

ggplot(data=Ajoblanc, aes(x=Año, y=perim))+
  geom_boxplot(fill = c("pink","lightgreen") )+
  theme_bw()+
  ylab("perímetro")+
  ggtitle("Ajoblanc") 

###########################
# Algo de Variables cualitativas

# barplot

library(MASS)                 # cargamos el paquete MASS 
help(painters) 

school = painters$School      # Escuela del pintor
school.freq = table(school)   # hacemos una tabla

school.freq

# El gráfico de barras pide una tabla como argumento
par(mfrow=c(1,1))

barplot(school.freq)
barplot(school.freq,col= rainbow(8)) 

# colocar titulo y nombres a los ejes. 
barplot(school.freq,col= rainbow(8),main="Escuela pintores", ylab="Frecuencia absoluta", xlab="Escuela") 

# Vamos con ggplot:

# barplot por las escuelas:
ggplot(data = painters) + 
  geom_bar(mapping = aes(x = school))

ggplot(data = painters) + 
  geom_bar(mapping = aes(x = school, fill=school))

#proporciones:
ggplot(data = painters) + 
  geom_bar(mapping = aes(x = school, y = stat(prop), group = 1))


# Ejemplo: graficar una media con una medida de variabilidad (desvios estándar o error estándar)

# Abrir el archivo PlantGrowth y llamarlo plant
# Los datos son el resultado de un experimento que compara el rendimiento (medido en peso seco de las plantas) 
# de plantas obtenido bajo un control y dos condiciones diferentes de tratamientos. 
# El archivo contiene 30 filas y dos variables (weight y group). Los niveles de grupo son 'ctrl', 'trt1' y 'trt2'.
# Fuente:Dobson, A. J. (1983) An Introduction to Statistical Modelling. London: Chapman and Hall.


plant <- read.csv("PlantGrowth.csv", header=T)

# leyó el archivo correctamente? Cuantas filas y columnas tiene?

dim(plant)

# Cómo se llaman las columnas del archivo plant?

names(plant)

# resumen:

summary(plant)

# La función tapply(x, y, funcion) calcula la función especificada sobre una variable (por ejemplo weight)
# según las categorías de otra variable (por ejemplo group)

plant.media <-tapply(plant$weight, plant$group, mean)
plant.media

?tapply

plant.de<-tapply(plant$weight, plant$group, sd)
plant.de

# vamos a graficar tradicionalmente:

barplot(plant.media, ylab="Peso", xlab="Tratamientos", col="red")

# Grafico de barras usando ggplot usando el eje x como categorías

# cuantos de cada grupo?
ggplot(data=plant)+
  geom_bar(mapping = aes(x=group))

#hay 10 en cada categoria
summary(plant)

# Gráfico de medias con barra de error

Tablaggplot<-stack(plant.media) # la función stack arma una tabla con los valores
plant$group<-as.factor(plant$group)

Tablaggplot
#tabla con grupos y valores medios
plant$group

ggplot(data=Tablaggplot, aes(x=ind, y=values)) +
  geom_bar(stat="identity",  fill="red")+
  theme_minimal()+
  geom_errorbar(aes(ymin = plant.media-plant.de, ymax = plant.media+plant.de), width = 0.2)

#geom_errorbar agrega la medicion de las sd.
#geom_bar( debemos avisar que lo que le damos son frecuencias)
#theme_minimal()




