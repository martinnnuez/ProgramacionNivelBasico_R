#Práctico N°1
#Actividad 1. A partir de la siguiente lista de números genere un vector para cada variable
#(X e Y).

x <- c(10, 20, 5, 15 , 9 ,23, 32,12 , 40)

y <- c(100, 149, 75,125, 93, 166, 211, 108, 251)

#Actividad 2. A partir de los vectores creados en la Actividad 1, calcule la media y desvío
#estándar para la variable Y.

mean(y)
sd(y)

#Actividad 3. Calcule otras medidas resúmenes para la variable Y

summary(y)

#Actividad 4. Escriba cada uno de los vectores como matrices cuadradas. Llame matriz A al
#vector X y matriz B al vector Y.

matrizA <- matrix(x,nrow=3,ncol=3, byrow=T)

matrizB <- matrix(y,nrow=3,ncol=3, byrow=T)



#Actividad 5. Obtenga un vector de medias y de varianza para cada matriz.
#obtuve medias y varianzas por columnas, no entendi si ese era el ejercio.

?apply

va1<-apply(matrizA,2,mean)
va2<-apply(matrizA,2,sd)
va1
va2

vb1<-apply(matrizB,2,mean)
vb2<-apply(matrizB,2,sd)
vb1
vb2

#Actividad 6. Obtenga el producto de las matrices A y B.

prodM<-matrizA%*%matrizB
prodM

#Actividad 7. Calcule la inversa del producto de la matriz A y B.

invM<-solve(prodM)
invM

Ident <-invM%*%prodM
Ident


#Verifique que este bien con otra forma de resolver
I=diag(1,nrow=3) # Matriz diagonal de dimension 3
I

solve(prodM,I) # Matriz inversa de A

