#################################################################################
#        Taller de Software I. Introducción a R                                 #
#         Maestría en Estadística Aplicada. UNC     - 2020                      #
#################################################################################

###########################
# FUNCIONES
###########################


# R es un lenguaje que permite crear nuevas funciones. 
#Una funcion se define con una asignacion de la forma

# nombre <- function(arg1, arg2, ...) {expresion}

# La expresion es una formula o grupo de formulas que utilizan los argumentos para calcular
# su valor. El valor de dicha expresion es el valor que proporciona R en su salida y 
# este puede ser un simple numero, un vector, una grafica, una lista o un mensaje. 

#Ejemplo. 

funcion1 <- function(x){ y = x + 4}
#le paso lista de x y guarde en y la suma de lo que le doy mas 4.

a  = funcion1(5)
a

x<-c(1,2,4,3)
b = funcion1(x)
b

e<-c(1,2,4,3)
c = funcion1(e)
c

funcion1 <- function(x){ x + 4}
#ahora no guarde en y pero calcula lo mimso es lo mimso

#Ejemplo
#Una función que devuelve los elementos de un vector que son mayores a 10

mayora10 <- function(x){
  idx <- x > 10   #vector logico
  #guardo en este vectoricito
  x[idx]
  #mando a buscar x[idx] cuando sea TRUE me devuelve ese x                    
}
#guardo en vectorizito los true y false de esa prueba x>10, y luego lo mando a buscar esos true

mayora10(1:20)

# Ejemplo con más argumentos

## Una función que devuelve los elementos de un vector que son mayores a n 
 

mayoran <- function(x, n=10){
  idx <- x > n   #vector logico
  x[idx]
  #esta ultima sencentia devuelve cuando x toma los valores TRUE
}

mayoran(1:20,n=12)   #qué pasó?
#hacen falta dos argumentos para que funcione
#function(x, n = 10), aca si le escribo n=10 lo que pasa es que el deffault cuando no le especifique es 10.

mayoran(1:20)
#por eso ahora anda esto, compara con 10 por default

# Cómo damos valores por defecto?  
#function(x, n = 10)



# Otros Ejemplos. 

#qué hace esta función?

funcion2 <- function(muestra){     #El unico argumento es una muestra de de datos
  media = mean(muestra, na.rm = T)
  varianza = var(muestra, na.rm = T)
  rango = max(muestra, na.rm = T) - min(muestra, na.rm = T)
  print(media);
  print(varianza) ;
  print(rango)
}

j<-funcion2(1:20)
#devuelve solo de los ultimos valores CUIDADO
#no me lo guarda para usarlo despues en cambio con la lista me guarda si lo quiero usar luego
j
#aca se ve j devuelve solo el ultimo valor, con lista devuevo lista y puedo ingresar a esos valores.


# Ojo que así definida si le pedimos que guarde el resultado en un objeto solo guarda el último,
#para que guarde los tres hay que decirle que haga una lista!!!

funcion3 <- function(muestra){     #El único argumento es una muestra de de datos
  med <- mean(muestra, na.rm = T)
  vari<- var(muestra, na.rm = T)
  DE <- sd(muestra, na.rm=T)
  rang <- max(muestra, na.rm = T) - min(muestra, na.rm = T)
  CV <- DE/med*100
  list(media = med, varianza = vari , "Desvio Estandar"= DE,rango = rang, "Coeficiente de variacion"=CV)
}

ej <- funcion3(1:20)
ej

ej$media#ahi puedo entrar al valor que quiera de la lista con esta funcion que me los guarda 
ej$varianza


# Ejemplo.  Qué hace esta función?

funcion4 <- function(a,b,c = 4,d = FALSE){
  if (d == FALSE) x1 <- a*b else x1 <- a*b + c
  x1}
#Cuatro argumentos a, b, c, d = 
#si le doy dos argumentos toma a y b, hasta que le diga que d= TRUE ahi calcula a*b+c

funcion4(2,3)
#6 pq d es false hasta que indique lo contrario

funcion4(2,3,4,T)
#aca da  10 pq entra en el else pq d =T 


# Genere una función que grafique una variable en función de otra y coloque 
# nombre al eje x que por defecto sea: "mi eje x"


funcion5 <- function(x, y, label = "mi eje x", ...) {   # qué hacen los tres puntitos?
  plot(x, y, xlab = label, ...)
}

#Cuando tengo que hacer grafico muchas veces
#le doy 2 vectores y me devuelve grafico y si quiero label tambien
funcion5(1:5, 1:5)
funcion5(1:5, 1:5, "X")#aca le escribe x

#los tres puntitos permiten que si quiero agregarle mas cosas al grafico puedo, pq reconoce la funcion plot
funcion5(1:5, 1:5, "X", pch=16, main="titulo")
#poner en los dos lugares los 3 puntitos y reconoce, argumentos validos para el plot

x <- 1:5

funcion5(x, x^2, label = "otro nombre para el eje x")



#Ejercicios
# Cree una función que calcule las medias de las columnas de una matriz usando un búcle "for" dentro de la función.
# apliquela a la matriz:
D<-matrix(1:9, 3)

fp<-function(x){
  
  medias<-numeric(ncol(x))#vector vacio para rellenar, con ncol(x) creo vector con tamaño justo
  
  for (i in 1:ncol(x)){
    medias[i]<-mean(x[,i])
  }
  return(medias)
}

fp(D)
funcion4(D)

# Repita usando apply
funcion4 <- function(a){
  x1<-apply(a,2,mean)
  x1}

mediascol<-apply(D,2,mean)

funcelem<-apply(D,2,funcion1)
funcelem
#me hace la funcon elemento a elemento
#lo que me permite con apply meter una fucion que yo diseñe

#Genere una funcion que tome como argumento un numero real x y un numero natural n
# y devuelva

#  1 + x + 2*x + ... + n*x

funcionej <- function(x,n){
  num=1
  for (i in 1:n){
    num = num + i * x
  }
  return(num)
  }

funcionej(4,5)

#danilo
fp1 <- function( x, n) {
  valor = 1
  for (i in 1:n) {
    valor = valor + i * x
  }
  return (valor)
}                   

#Ejercicio
# Cargue los dats Ajoblanco
Ajoblanc <- read.delim("Ajoblanc.txt", dec=",", header=T)
Ajoblanc
# Escriba una función que, dado un punto de corte,  calcule una la media para cualquiera
# de las variables.

fp<-function(M,var,corte){
  dat = M[,var] #nos quedamos con la columna var
  idx <- dat < corte #me dice cuales son los menores al corte, guardo como TRUE, los que cumplen
  m1<-mean(dat[idx]) #agarro los valores de dat, que estan en TRUE de idx y les hago la media
  m2<-mean(dat[!idx]) #agarro los valores de dat que estan en FALSE de idx y les hago la media
  print(paste("media", var, "menor a", corte, ":", m1))
  print(paste("media", var, "mayor o igual a", corte, ":", m2))
}

fp(Ajoblanc,"peso",20)

###############################
# Ejecucion no interactiva
###############################

# Con "source" abrimos una sesion de R y ejecutamos todo el codigo dentro un archivo determinado:

# Guardamos la funcion en un fichero aparte 

# Ejemplos: guardar la funcion MiFuncion en un archivo aparte.

# Podemos ejecutarlo sin abrirlo con

source("MiFuncion.R")


