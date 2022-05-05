#Resolucion practicos
#Práctico N°1
#Actividad 1. A partir de la siguiente lista de números genere un vector para cada variable
(X e Y).
y <-c(100,149,75,125,93,166,211, 108, 251)
x<- c(10, 20,5 ,15 ,9 ,23 ,32,12 ,40)
#Actividad 2. A partir de los vectores creados en la Actividad 1, calcule la media y desvío
#estándar para la variable Y.
mean(y)
sd(y)
#Actividad 3. Calcule otras medidas resúmenes para la variable Y
summary(y)
#Actividad 4. Escriba cada uno de los vectores como matrices cuadradas. Llame matriz A al
#vector X y matriz B al vector Y.
A<- matrix(y,nrow=3,ncol=3,byrow=T)
B<- matrix(x,nrow=3,ncol=3,byrow=T)
#Actividad 5. Obtenga un vector de medias y de varianza para cada matriz.
mean(A)
mean(B)
sd(A)
sd(B)
#Actividad 6. Obtenga el producto de las matrices A y B.
A%*%B
#Actividad 7. Calcule la inversa del producto de la matriz A y B.
G<-solve(A)
zapsmall(G%*%A)
U<-solve(B)

#PRACTICO N2
#a) Convierta las siguientes sentencias en objetos del tipo matriz en R
A=matrix(c(1,3,3,9,5,9,3,5,6), nrow = 3)
B=matrix(c(1,2,-1,2,-1,3,0,3,4,-1,0,2), nrow=3)
C=matrix(c(2,0,1,0,3,0,1,0,5,0,1,0), nrow=3)
D=matrix(c(-4,-1,-3,4,1,2,1,-1,5,-1,0,3,-2,3,-2,0), nrow=4)
E=matrix(c(-2,3,-1,0), nrow=4)
F=matrix(c(0,1,1,0,1,0,0,0,0,1,0,1,1,0,1,1), nrow=4)
G=matrix(c(1,0,-1,1,1,1,0,1,0), nrow=3)
H=matrix(c(1,1,1), nrow=1)
I=matrix(c(1,0,-3,0,3,0,-9,0,-2,0,6,0), nrow=4)
#b) En las matrices cuadradas indique los elementos de la diagonal
g<-c("A","B","C","D","E","F","G","H","I")
for(i in length(g)) if(nrow(g)==ncol(g)) print("TRUE") else print("FALSE")

nrow(A)==ncol(A)#SI
nrow(B)==ncol(B)
nrow(C)==ncol(C)
nrow(D)==ncol(D)#SI
nrow(E)==ncol(E)
nrow(F)==ncol(F)#SI
nrow(G)==ncol(G)#SI
nrow(H)==ncol(H)
nrow(I)==ncol(I)

diag(A)
diag(D)
diag(F)
diag(G)

dim(A)3 3
dim(B)3 4 
dim(C)3 4
dim(D)4 4
dim(E)4 1
dim(F)4 4
dim(G)3 3
dim(H)1 3
dim(I)4 3 

#c) Utilizando las matrices A hasta I, realizar cuando sea posible las siguientes operaciones:
#- Suma de dos matrices (igual dimencion)
A+G
#- Producto de dos matrices por un escalar (todas)
A*3
#- Producto de dos matrices (igual numero columnas qeu filas)
B%*%D
#- Transpuesta de la matriz (cuadrada)
t(F)
#- Transpuesta de la suma de dos matrices 
t(B%*%D)
#- Determinante
det(G)
#- Autovectores y autovalores por descomposición por valor singular.
eigen(G)

#Práctico N°3
#A. Trabajamos sobre un data frame
#Considere el archivo zapallo que se encuentra en la carpeta de Actividades Prácticas en el Aula Virtual de la Segunda Semana. El mismo se encuentra en formato .txt.
#a) Genere en R un data frame en el directorio c:/TallerSoft/
setwd("C:/Users/Jose Maria/Desktop/Taller de software")
df<- read.table("zapallo.txt", header=T)
df
?read.table
#b) Que dimensión tiene el data frame?
dim(df)
#c) Renombre el objeto original cambiando el nombre del objeto por VarZapallo y la variable Tipo por Variedad
VarZapallo<- read.table("zapallo.txt", header=T)
names(VarZapallo)<-c("Variedad","Rinde")
View(VarZapallo)
#d) Calcule la media, el desvío estándar, el mínimo, el máximo y el coeficiente de variación para la variable Rinde según el Tipo.
tapply(VarZapallo$Rinde,VarZapallo$Variedad,mean)
tapply(VarZapallo$Rinde,VarZapallo$Variedad,sd)
tapply(VarZapallo$Rinde,VarZapallo$Variedad,min)
tapply(VarZapallo$Rinde,VarZapallo$Variedad,max)
tapply(VarZapallo$Rinde,VarZapallo$Variedad,sd)/tapply(VarZapallo$Rinde,VarZapallo$Variedad,mean)

#e) Genere un objeto que tenga el Tipo de zapallo y otro objeto con los Rinde
a<-VarZapallo[,1]
b<-VarZapallo[,2]
a
b
#f) Combine esos dos objetos en una lista. Que diferencias nota con el data frame?
list(a,b)

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
