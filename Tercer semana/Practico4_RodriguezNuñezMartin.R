#Practico 4
#1) Use un ciclo "for" (o dos) para mostrar la tabla de multiplicar:
n=10 
m=10

mymat <- matrix(0,10,10)
mymat

for(i in 1:m) {
  for(j in 1:n) {
      mymat[i,j] = i*j
    }
  }

mymat

#2) Considere la secuencia que empieza por 1 y luego el elemento n-ésimo x(n) está definido
#a partir del anterior, x(n-1) por la fórmula: x(n+1) = 2*(x(n) + 2).
#Muestre los elementos de la secuencia que son menores o iguales a 250.
i = 1
while (i <= 250) {print(i)
  i = 2*(i+ 2)} 
