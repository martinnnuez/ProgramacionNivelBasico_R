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
#el else no esta pero si se cumple haga lo que dice

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
if(x >= 60 & x < 80) nota = "B" 
if(x >=  80) nota = "A"

nota # para que imprima la nota

# o podemos hacerlo anidado. 

if(x < 60) nota = "C" else if(x >= 60 & x < 80) nota = "B" else if(x >=  80) nota = "A"

#asi con las llaves

x<-25
if (x < 60) {nota = "C" } else { if(x >= 60 & x < 80) { nota="B"}else {if(x >=  80) nota = "A" }}




# "ifelse" es la version vectorizada de "if". 
# Devolvera un valor para cada elemento de un vector
## Ejemplo

nota.num <- c(39, 51, 60, 65, 72, 78, 79, 83, 85, 85, 87, 89, 91, 95, 96, 97, 100, 100)

prueba <- ifelse (nota.num >= 60, "aprobado", "desaprobado")
prueba

?ifelse
length(nota.num)

#  y si quiero poner notas  "A", "B" o "C" como antes usando ifelse

notas <- ifelse (nota.num < 60, "C", ifelse (nota.num>=60 & nota.num<80,"B", "A"))       
notas

#"C" si final_score <60

#"B" si 60 =< final_score < 80

#"A" si 80 =< final_score =< 100

ifelse(final_score <60,"C",ifelse(final_score>=60 &final_score<80,"B","A"))


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

x = numeric(10) # genera un vector con 10 lugares, es un vector de ceros
x
# Para cada elemento (i en este caso) en el vector de 1 hasta 10 (objeto), devuelva la potencia

for (i in 1:10) x[i] = i^2
#con el subindice le digo que especificamente para ese lugar haga esa operacion
# que elementos contiene x ahora?
x

# Que pasa si no utilizamos el indice? [i]

z = numeric(12)
for (i in 1:11) z = z + i
z
#dentro de cada z recorre todos los valores de 1 a 11 y los suma pq nunca salgo de ahi

z = numeric(12)
for (i in 1:12) z[i] = z[i] + i
z

# Que pasa si comenzamos de un elemento y no de un vector? sobre quien se realiza la operacion?
y = 0
for (i in 1:10) y = y + i
y

y = 1
for (i in 1:10) y = y + i
y

#en el primer paso 0+1 en el segundo 1+2 y asi va a acumulando


# Que pasa si y comienza en 1 en lugar de cero?




# Usar un ciclo "for" para contar la cantidad de números mayores a 10 en el vector x:

x <- c(2,5,3,9,8,11,6,8,12,3,57,56)

y=0
for (i in 1:length(x)) y<-y+sum(x[i]>10)
y

y=0
for (i in 1:length(x)) y<-y+(x[i]>10)
y

z <- 0
for ( i in x) if(i >10) z= z+1
z

#va afuera del if lo que tiene que hacer

# Ejercitacion
# usando la funcion for para ciclos, cree una matriz de dimension 30*30 donde
# el elemento de la fila i y de la columna j sea el resultado del producto entre ellos (i*j)

# Recomendaciones: 
# genere primero el "espacio", podría pensar las filas como los elementos de una matriz y 
# las columnas como los elementos de otra matriz para luego realizar el producto de ellos













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

#cuadno i es mayor que 6 entra al break y no se imprime

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

#empieza en 20 y con el x-1 lo va actualizando hasta que x sea menor a 15 entra al break y corta

# Otro ejemplo. Interrumpimos un for cuando i es igual a j 

n=10 
m=10
length(n)
# Asignamos un contador
ctr=0

# Crear una matriz de dimension 10 x 10 cuyos elementos sean cero
mymat <- matrix(0,10,10)
mymat

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

mymat
#empieza conun i entonces para i=1 recorre todas las columnas, cunado i==j corta y por eso no sigue mas con esa fila o columna cuando se cumpla

# Crear una matriz de dimension 10 x 10 cuyos elementos sean cero
mymat <- matrix(0,10,10)
mymat

for(i in 1:m) {
  for(j in 1:n) {   
    if(i==j) { 
      next;
    } else {
      # asignamos valors si i y j son diferentes (i<>j)
      mymat[i,j] = i*j
      ctr=ctr+1
    }
  }
  print(i*j) 
}

mymat
#con el next solo saltea cuando i==j entocnes sigue rellenando pero solo cuando
#i==j no rellena mas, solo diagonal principal con 0


# Imprime el numero de celdas de la matriz a la cual se les asigno un valor distinto de cero
print(ctr)
#cantidad de elementos rellenados

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
