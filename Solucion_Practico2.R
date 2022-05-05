### Practico 2 - Taller R - Maestría en Estadística Aplicada

## Actividad A 

A<-matrix(c(1,3,3,9,5,9,3,5,6),nrow=3)
B<-matrix(c(1,2,-1,2,-1,3,0,3,4,-1,0,2),nrow=3)
C<-matrix(c(2,0,1,0,3,0,1,0,5,0,1,0),nrow=3)
D<-matrix(c(-4,-1,-3, 4, 1, 2, 1, -1, 5, -1, 0, 3, -2, 3, -2, 0), nrow=4)
E<-matrix(c(-2,3,-1,0),nrow=4)
F<-matrix(c(0,1,1,0,1,0,0,0,0,1,0,1,1,0,1,1),nrow=4)
G<-matrix(c(1,0,-1,1,1,1,0,1,0),nrow=3)
H<-matrix(c(1,1,1),nrow=1)
I<-matrix(c(1,0,-3,0,3,0,-9,0,-2,0,6,0), nrow=4)

##  Algunos ejemplos:

# b)

diag(A)
diag(D)

## c)

#Suma de dos matrices#
J <- A + G
J

# uno que no funciona: por qué?:
A + C



## Producto  por un escalar
A*2
3*B

## Producto de dos matrices#
C%*%D

# uno que no funciona: por que?

C%*%A

## Traspuesta de una matrix
t(H)


#Traspuesta de la suma de dos matrices#
t(A + B)


#Determinante de una matriz
det(A)
det(B)

# Uno que no funciona, por qué?:
det(C)


#Autovectores y autovalores por descomposicion por valor singular
svd(A)


#Autovectores y autovalores propios#
eigen(A)


#Inversa de una matriz#
solve(A)

# Uno que no funciona, por qué?:
solve(C)



##Actividad B

# a)
X <- matrix(c(180,80,240,180,200,70,300,200,360,240, 240, 200, 200, 100, 340, 220, 240, 210),nrow=9,byrow=TRUE)

colnames(X) <- c("Colesterol", "Trigliceridos")

rownames(X)<-c("P1","P2","P3", "P4", "P5", "P6", "P7", "P8", "P9")

X

# b)
colMeans(X)
apply(X, 2, mean)

# c)
X[5,1] <- 340
X

 
#e)
ejercicio <- c("si","si","no","si","no","si","si","no","si")
ejercicio <-as.factor(ejercicio)

# f) 

ejsi <- ejercicio == "si"   # lo que sí hicieron ejercicio -> TRUE

Xsi <- X[ejsi,]
apply(Xsi, 2, mean)

Xno <- X[!ejsi,]  ## !ejsi me da los que NO hicieron ejercicio ! es negación
apply(Xno, 2, mean)

# g)

X2 <- data.frame(X, ejercicio)
class(X2)



