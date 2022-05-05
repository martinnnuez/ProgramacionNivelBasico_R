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
nrow(A)==ncol(A)#T
nrow(B)==ncol(B)#F
nrow(C)==ncol(C)#F
nrow(D)==ncol(D)#T
nrow(E)==ncol(E)#F
nrow(F)==ncol(F)#T
nrow(G)==ncol(G)#T
nrow(H)==ncol(H)#F
nrow(I)==ncol(I)#F

diag(A)
diag(D)
diag(F)
diag(G)

#c) Utilizando las matrices A hasta I, realizar cuando sea posible las siguientes operaciones:
dim(A);dim(B);dim(C);dim(D);dim(E);dim(F);dim(G);dim(H);dim(I)
# - Suma de dos matrices
A+G
B+C
D+F

#- Producto de dos matrices por un escalar
A*2
B*3
C*4

#- Producto de dos matrices
A%*%B
C%*%D
B%*%I

#- Transpuesta de la matriz
t(A)
t(D)
t(G)

#- Transpuesta de la suma de dos matrices
t(A+G)
t(B+C)
t(D+F)

#- Determinante
det(A)
det(D)
det(F)

#- Autovectores y autovalores por descomposición por valor singular.
qr(A)
qr(B)
qr(C)

#- Autovectores y autovalores propios
eigen(A)
eigen(D)
eigen(F)

#- Inversa de una matriz
solve(A)
solve(D)
solve(G)

#- Diagonal de una matriz
diag(A)
diag(B)
diag(C)

#Nota: Realizar al menos tres operaciones de cada una, por ejemplo, tres sumas de 
#dos matrices usando cualesquiera dos matrices entre las matrices A hasta I.


#B. Seguimos trabajando con matrices:
#Considere el siguiente conjunto de datos en el que se muestra los niveles de Colesterol y Triglicéridos de un conjunto de pacientes.
#a) Genere en R una matriz con estos datos.
x <- c(180,80 ,240 ,180 ,200 ,70 ,300 ,200 ,360 ,240 ,240 ,200 ,200 ,100 ,340 ,220 ,240 ,210)
fila <-c("paciente1","paciente2","paciente3","paciente4","paciente5","paciente6","paciente7","paciente8","paciente9")
columna<-c("Colesterol (mg/dl)","Trigliceridos (mg/dl)")

M<-matrix(x,nrow=9,ncol=2,byrow=T)
M
rownames(M)<-fila
colnames(M)<-columna
M

#b) Calcule el nivel de colesterol y triglicéridos medio.

apply(M,2,mean)

#c) Se cometió un error al ingresar los datos. El nivel de colesterol correcto del Paciente 5 es 340, realice este cambio en su matriz.
M["paciente5",1]<-340
M

#d) Se conoce para cada paciente si realiza o no ejercicio:
#e) Genere el correspondiente factor "ejercicio".
y <- c("si","si","no","si","no","si","si","no","si")
ejercicio<-as.factor(y)


?data.frame
MC<-data.frame(M,ejercicio)
MC

#f) Calcule el nivel medio de colesterol y triglicéridos en los pacientes que hicieron ejercicio y en los que no.

tapply(MC$Colesterol..mg.dl.,MC$ejercicio,mean)
tapply(MC$Trigliceridos..mg.dl.,MC$ejercicio,mean)



#g) En orden de tener los datos organizados, se quiere anexar el factor "ejercicio" a la matriz de datos.
#¿Es posible hacer esto utilizando la misma estructura de datos "matrix"?
#¿Por qué? Utilice la estructura de datos necesaria.
#No es posible realizarlo utilizando la esturctura de matriz, por lo que debemos emplear una estructura de data frame como se realizo anteriormente.