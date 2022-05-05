#################################################################################
#        Taller de Software I. Introducción a R                                 #
#         Maestría en Estadística Aplicada. UNC                                 #
#################################################################################


#########################
# Ciclos 
#########################

# Ciclos. Ordenes de control

# IF. Construccion condicional.

# Es de la forma
# > if (expr 1) expr 2 else expr 3
# donde expr 1 debe producir un valor logico. Si expr 1 es verdadero (T), se ejecutara expr 2.
# Si expr 1 es falso (F) y se ha escrito la opcion else, que es opcional, se ejecutara expr 3.
# else complementa un if

#Ejemplo con dos condiciones 

if( 3 > 2) print("yes")

if( 2 > 3) print("yes")

if( 2 > 3) print("yes") else print("no")

# En la sintaxis se puede usar llaves {}

if (3 > 2) {print("yes")}

if (2 > 3) {print("yes")} else {print("no")}

# Ejemplo con tres condiciones

x <- 75  #Es la nota numerica de examen de un alumno
# queremos darle nota "A", "B" o "C"
# A si la nota es >=80, B si esta entre 60 y 80 y C si es menor a 60

if(x < 60) nota = "C"
nota
if(x >= 60 & x < 80) nota = "B" 
nota
if(x >=  80) nota = "A"

nota # para que imprima la nota

# o podemos hacerlo anidado. 

# Propuesta Eugenia
x<-83

if(x < 60) nota = "C" else if(x >= 60 & x < 80) nota = "B" else if(x >=  80) nota = "A"

# con llaves

if (x < 60) {nota = "C"} else { if(x >= 60 & x < 80) { nota="B"}  else {  if(x >=  80) {nota = "A"} } }

nota


# "ifelse" es la version vectorizada de "if". 
# Devolvera un valor para cada elemento de un vector
## Ejemplo

nota.num <- c(39, 51, 60, 65, 72, 78, 79, 83, 85, 85, 87, 89, 91, 95, 96, 97, 100, 100)
length(nota.num)

prueba <- ifelse (nota.num >= 60, "aprobado", "desaprobado")
prueba


#  y si quiero poner notas  "A", "B" o "C" como antes usando ifelse

#"C" si final_score <60

#"B" si 60 =< final_score < 80

#"A" si 80 =< final_score =< 100

# Propuesta Eugenia

prueba <- ifelse (nota.num < 60, "C", ifelse (nota.num>=60 & nota.num<80,"B", "A")) 


# FOR. construccion repetitiva (iterativa), pertmite hacer un bucle (loop). 
# Realiza una operación para cada elemento de un conjunto de datos. 
# Es de la forma
#> for (nombre in expr 1) expr 2
# donde nombre es la variable de control de iteracion, es un elemento, expr 1 es un vector (a menudo de la
# forma m:n) o un objeto, y expr 2 es una expresion o una operacion, a menudo agrupada, en cuyas sub-expresiones puede
# aparecer la variable de control (nombre). expr 2 se evalua repetidamente conforme nombre
# recorre los valores del vector expr 1.
# Tambien podriamos pensarlo de la siguiente manera for(elemento in objeto){operacionconeelemento}
# Dicho de otra manera para (for) el elemento en (in) el objeto realice una operacion

# Ejemplo. Para un elemento de i en un vector que contiene una secuencia del 1 al 10 imprima i
for (i in 1:10) print(i)

# Otro ejemplo

x = numeric(10) # genera un vector con 10 lugares, es un vector de 10 elementos

# Para cada elemento (i en este caso) en el vector de 1 hasta 10 (objeto), devuelva la potencia

for (i in 1:10) x[i] = i^2

for(i in c("a", "b"))  {print(i)}

x<-1:10
x2<-x^2
# que elementos contiene x ahora?

x
# Que pasa si no utilizamos el indice? [i]

z = numeric(12)
for (i in 1:11) z[i] = z[i] + i

# Que pasa si comenzamos de un elemento y no de un vector? sobre quien se realiza la operacion?
y = 0
for (i in 1:10) y = y + i

# Que pasa si y comienza en 1 en lugar de cero?

y=1
for (i in 1:10) y = y + i
y

for (i in 1:10) y[i] = y[i] + i
y

# Usar un ciclo "for" para contar la cantidad de números mayores a 10 en el vector x:

x <- c(2,5,3,9,8,11,6,8,12,3,57,56)
length(x)

x1=0

for (i in 1:length(x)) x1<-x1+sum(x[i]>10)
x1

for (i in 1:length(x)) x1<-x1+(x[i]>10)

# Propuesta Danilo


for (i in x) if(i >10)  z = z + 1


# Ejercitacion
# usando la funcion for para ciclos, cree una matriz de dimension 30*30 donde
# el elemento de la fila i y de la columna j sea el resultado del producto entre ellos (i*j)

# Recomendaciones: 
# genere primero el "espacio", podría pensar las filas como los elementos de una matriz y 
# las columnas como los elementos de otra matriz para luego realizar el producto de ellos

mymat <- matrix(nrow=30, ncol=30)

for(i in 1:dim(mymat)[1]) {
  for(j in 1:dim(mymat)[2]) {
    mymat[i,j] = i*j
  }
}


#########################################

# WHILE. 
# >  while (expr1) expr2 
# Queremos que repita la accion u operacion de expr2 mientras que ocurre la condicion expr1
# dicho de otra forma: while(condicion) {operaciones}
# La operacion se realiza (ocurre/itera) hasta que se cumple el criterio (condicion) establecido

# Ejemplo

i = 0
while (i < 15) {print(i)
                        i = i+1} 

# Mientras se cumpla la condicion de que un elemento sea menor a 15, la operacion
# que suma un uno al elemento seguira sumando dado que comenzo en el cero.
# podemos usar i=i+1 o i<-i+1

#############################################################

# BREAK and NEXT

########################################################

# BREAK nos permite interrumpir un bucle & NEXT permite avanzar a la siguiente operacion
# sin realizar la actual. Ambos terminos funcionan para FOR y WHILE
# Ejemplo
# Interrumpimos un for cuando el elemento es mayor a 6

for(i in 1:10) {
                    if(i > 6) {
                                   break
                                           }
                                             print(i)      }

# En este ejemplo, se asignaron valore al elemento i hasta que se cumplio la condicion de 
# que el elemento sea mayor a 6. 

# Otro ejemplo de break con while
# Interrumpimos un while antes de se cumpla la condición de que x sea mayor a 5
# cuando x toma el valor 15.

x <- 20

while(x > 5) {
               if(x < 15) {
                               break
                                      }
                                         x <- x - 1
                                                        }

x

# Otro ejemplo. Interrumpimos un for cuando i es igual a j 

n=10
m=10
#length(n)
# Asignamos un contador
ctr=0

# Crear una matriz de dimension 10 x 10 cuyos elementos sean cero
mymat <- matrix(0,10,10)

for(i in 1:m) {
               for(j in 1:n) {   
                                   if(i==j) { 
                                                   break;
                                                            } else {
      # asignamos valors si i y j son diferentes (i<>j)
      mymat[i,j] = i*j
      ctr=ctr+1
    }
  }
  print(i*j) 
}

mymat #imprime la matriz que conformamos con for

# Imprime el numero de celdas de la matriz a la cual se les asigno un valor distinto de cero
print(ctr)


# NEXT

# Next permite "saltar" una iteración en un bucle. 
# Cuando la condición se cumple, esa iteración es omitida.

for(i in 1:8) {
  if(i == 3) {
    next
  }
  print(i)
}

# Ejemplo

for(i in 1:8) {
  if(i <= 3) {
    next
  }
  print(i)
}

# Reemplazamos BREAK por NEXT en el ejercicio de "corar" cuando i==j. 
# Como queda conformada la nueva matriz?
n=10
m=10

ctr=0

mymat <- matrix(0,10,10)

for(i in 1:m) {
  for(j in 1:n) {   
    if(i==j) { 
                    next;
                              } else {
                                           mymat[i,j] = i*j
      ctr=ctr+1
    }
  }
  print(i*j) 
}
mymat
# Imprime el numero de celdas de la matriz a la cual se les asigno un valor distinto de cero
print(ctr)
