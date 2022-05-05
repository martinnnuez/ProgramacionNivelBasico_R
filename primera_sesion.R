
########################################################
# Una primera sesion de R
########################################################

# El "#" indica que lo que viene es un comentario y por lo tanto no 
# realiza ninguna acción


#################################
# R como calculadora

#################################

#R no reconoce espacios. 
#El uso de espacios facilita la organizacion y lectura de codigos.

# Calcule 2 + 3
2 + 3



# Calcule la raiz cuadrada de 10
sqrt(10)


# Calcule el perimetro del circulo de radio 5
2*pi*5


# Calcule 270 dividido la suma entre 12 y 78 
270/(12+78)



# Calcule el cuadrado de 8
8**2

# Calcule el logaritmo de 10
log10(10)


## Obtener ayuda 

?log
help("log")

log(10, base = 10)

log(10,10)

log10(10)

?log



###############################
# Asignaciones
###############################

# R distingue entre minusculas y mayusculas. "A" y "a" son simbolos
# distintos.
#radio <-

radio <- 5     # asignamos el numero 5 al objeto "radio"
radio          # vemos su valor
print(radio)   # otra forma de ver su valor


## Otras formas de hacer asignaciones

radio = 5      # es mas conveniente utilizar <-
radio
5 -> radio     # raramente se usa asi 
radio

# Podemos operar con los objetos y crear objetos que contengan los resultados 
# de un calculo (o de un analisis estadistico)

# Ejemplo: Calcule el perimetro del circulo de radio 5 y guardelo en el objeto "per" 


per  <- 2*pi*radio
per

radio <- 7

rm(radio) #rm de remove


## Asignamos un vector a un objeto 

a <- c(1,2,3,4,5) #le cargue a a esos datos.

# Podemos ver el contenido de "a"

a

## Aritmetica vectorial

# Creamos el vector de coordenadas 6,7,8,9,10 y lo llamamos "b"

b <- c(6,7,8,9,10)
b

# Suma de dos vectores. Calcule la suma de a y b
c=a+b
c

d <- c(2,3,4)

a+d #me avisa que esta pasando algo malo

# Producto de un escalar por un vector. Calcule el doble de a 

2*a


## ¿Que se obtiene haciendo el siguiente producto entre los vectores a y b?
# el producto se usa con el asterisco *

a*b #multiplica coordenada a coordenada pero eso no esta bien para vectores, 
#pero si para datos quiza.
 

######################################
# R como herramienta estadística
######################################


## Queremos generar 40 numeros aleatorios de una
# distribucion normal estandar

x<-rnorm(40)
x

help("rnorm") # no funciona!
?normal
??normal

help.search("normal")
apropos("normal")
apropos("norm")

#  MUY UTIL: GOOGLE!!!!
# "R: normal random number generator"

# generamos un vector de tamaño 40 de esta distribucion

x<-rnorm(40)
x

## Algunas medidas descriptivas basicas 

mean(x); sd(x); var(x)

summary(x)

# Genere un vector "y" con 20 realizaciones de una normal con media 5 y 
# desvio estandar 2. Calcule la media y la varianza de y

y <- rnorm(20,0,2)

y
summary(y)
summary(x)

#####################################
# R como herramienta grafica
#####################################

# Ejemplos

hist(x) #r hace histograma, vemos distribucion normal.

boxplot(x)


## La funcion "plot"

x <- c(-4,-3,-2,-1,0,1,2,3,4)  # Observar que hemos reemplazado el objeto "x" 
                               # que definimos arriba
y <- x^2

plot(x,y)

plot(x,y, type="b", col="red")

plot(x,y, type="l", col="green") #linea continua


#################################
# Objetos 
#################################

a <- 4  # asignamos el numero 4 al objeto "a"
        
class(a)


b <- c(1,2,3)  # asignamos un vector (numerico) al objeto "b" 

class(b)
str(b)
str(a)

calle1 <- "Rafael Nuñez"  

# ¿Que tipo de objeto es calle1?

class(calle1)

# Formermos el vector calles, agregando a calle1 la calle "Octavio Pinto"

calle2 <- "Octavio Pinto"

calles <- c(calle1,calle2)

calles <- c(calle1,"Octavio Pinto")

calles

class(calles)



## ¿Es calles un objeto de tipo numerico? 
is.numeric(calles)        # da como resultado TRUE (si el objeto es de tipo numerico)
                          # o FALSE (si no lo es)    is.numeric

# ¿Es de tipo "character"?

is.character(calles) 


## La clase "logical"
   # Un objeto en esta clase toma valores TRUE (cuando una condicion es verdadera)
   # o FALSE (cuando la condicion es falsa)

a <- c(1,2,3)
b <- c(2,1,3)

r <- a < b
r

class(r)

# Operadores logicos

# ¿Que hacen los operadores "==", "!=", ">="
# == si es identico 
# != distitnto
# mayor o igual

r1 <- a==b
r1

r2  <- a!=b
r2


# Hay otros que veremos mas adelante: "&" y "|"
# and que cumpla las dos condiciones
#palito |



## Existe tambien la clase "factor":
   # variable categorica con un numero finito de categorias/niveles, 
   # que R "reconoce", "guarda" y "sabe" trabajar

a <- c("A", "A", "B", "A", "B") 

class(a)
levels(a)   # funcion que muestra los niveles de un factor

is.factor(a)
a <- as.factor(a)    # tambien podemos definirlo con otro nombre

is.factor(a)

a

plot(a)

# ¿De que clase es ahora "a"?
class(a)


# Ahora veamos cuales son los niveles de "a"

levels(a)


# Calculemos el numero de observaciones en cada nivel, usando la funcion "table"


table(a)

### Datos faltantes 

## "NA" nos permite indicar que falta un dato 

z <- c(1,2,3,NA,4)

# Calcular la media de los valores en z

mean(z,na.rm=TRUE)#AHORA FUNCIONA
?mean

# ¿Que hace la funcion "is.na()"? 
#me dice si hay algun faltante

is.na(z)

## Otro tipo de datos que se consideran "NA" son los "NaN" (Not a Number)

a <- 0/0   # Estos no son valores faltantes sino indeterminaciones
a
is.nan(a)
is.na(a)

is.nan(z)

is.na(Inf - Inf)
is.nan(Inf - Inf)


### Tipos de objetos 

# Vectores: Coleccion ordenada de elementos del MISMO tipo.


# Arreglos (?array): Generalizacion de vectores a mas dimensiones,
  # por ejemplo, matrices (?matrix).
class(z)

# Hojas de datos (?data.frame): Como las matrices, pero con columnas de diferentes 
  # tipos. Es el objeto más habitual para los datos experimentales.


# Listas (?list):  Forma generalizada de vector en la que cada componente puede ser 
  # de distinto tipo (numero, vector, matriz, LISTA, etc...).
  # Son contenedores generales de datos. Muy flexibles, pero sin estructura.
  # Muchas funciones devuelven un conjunto de resultados de distinta longitud y 
  # distinto tipo en forma de lista. 


# Funciones (help("function"))



## Si queremos ver cuales son los objetos del espacio de trabajo

ls()  
objects()

## Podemos borrar todos los objetos del espacio de trabajo

rm(list = ls())

# o algunos. Por ejemplo, x e y
rm(x)

getwd()

################################################
#  No nos olvidemos de guardar el script      ##
#  y la sesion, o los objetos que queramos  ##
################################################

## Cambiar de directorio

setwd("C:/")  # Tambien puede hacerse desde el menu (Session -> Set working directory)


## Guardar todo el espacio de trabajo:

save.image("primera_sesion.RData")  # ¿Como lo hacemos desde el menu?


## Guardar solo algunos objetos 

save(a, b, r, file = "prim_ses.RData") 


## Podemos cargar un espacio de trabajo

load("prim_ses.RData")            # ¿Como lo hacemos desde el menu?


## Podemos crear un Proyecto en R Studio
# Un proyecto es un directorio de trabajo con  un archivo cuya extensión .RProj
# Cuando se abre un proyecto (usando Archivo/AbrirProyecto o File/Open Project)
# o haciendo doble click en el archivo .Rproj
# el directorio de trabajo quedará automáticamente
# configurado donde localizó su .RProj
# Se pueden crear carpetas en dicho directorio, archivos, notas u otro material