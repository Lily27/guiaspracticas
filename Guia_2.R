#1.  CREACI�N Y MANEJO DE VECTORES DE DATOS.
#1.1 VECTORES NUM�RICOS 

#FORMA 1-Crear un vector num�rico vac�o y a�adirle luego sus elementos.

#Ejemplo 1: 
v <- numeric(3)
v 

#Ejemplo 2:  
v[3] <- 17 
v

#FORMA 2-Crear un vector num�rico asign�ndole todos sus elementos o valores.
#Ejemplo 1:
x <- c(2, 4, 3.1, 8, 6)
length(x) 

#Ejemplo 2:
x <- edit(x)

#FORMA 3-Crear un vector num�rico dando un rango de valores. 
#Ejemplo 1: 
y = 1:4; y

#Ejemplo 2:
y[2] <- 5
y

# Ejemplo 3:
u <- 1:12 
u1=u[2 * 1:5]
u

#FORMA 4-Crear un vector num�rico utilizando la funci�n assign()
#Ejemplo 1: 
assign("z", c(x, 0, x)) 
z

#FORMA 5-Crear un vector num�rico generando una sucesi�n de valores. 
#Ejemplo 1: 
s1 <- seq(2, 10)
s1

#Ejemplo 2: 
s2 = seq(from=-1, to=5) 
s2

#Ejemplo 3: 
s3<-seq(to=2, from=-2)
s3

#Ejemplo 4: 
s4=seq(from=-3, to=3, by=0.2) 
s4 

#Ejemplo 5. 
s5 <- rep(s3, times=3) 
s5

#1.1.1  OPERACIONES CON VECTORES NUM�RICOS
#Ejemplo 
1: 1/x 

#Ejemplo 
2: v=2*x+z+1 
v

#Ejemplo 3: 
e1 <- c(1, 2, 3, 4) 
e2<-c(4, 5, 6, 7) 
crossprod(e1, e2)  
t(e1)%*%e2

#1.1.2  OPERACIONES DE FUNCIONES SOBRE VECTORES NUM�RICOS.
#Ejemplo 1:
x: xt = t(x) 
xt

#Ejemplo 2: 
u = exp(y)
u

#OTRAS OPERACIONES: 
#Ejemplo 1: 
resum <- c(length(y), sum(y), prod(y), min(y), max(y)) 
resum 
#Ejemplo 2: 
yo <- sort(y) 
yo

#1.2 VECTORES DE CARACTERES 
#FORMA 1-Crear un vector de caracteres vac�o y a�adirle luego sus elementos.
#Ejemplo 1: 
S<-character()

#FORMA 2-Crear un vector de caracteres asign�ndole todos sus elementos.
#Ejemplo 1: Crear el vector de caracteres: 
deptos <- c("Santa Ana", "Sonsonate", "San Salvador")
deptos

#Ejemplo 2: Agregue el elemento "Ahuachap�n" en la cuarta posici�n. 
deptos[4]="Ahuachap�n" 
deptos 

#FORMA 3-Crear un vector de caracteres d�ndole nombres a los elementos para identificarlos m�s f�cilmente. 
#Ejemplo 1: 
codDeptos <- c(11, 12, 13, 14) 
names(codDeptos) <- c("Usulut�n", "San Miguel", "Moraz�n", "La Uni�n")
codDeptos 
Oriente <- codDeptos [c("La Uni�n", "San Miguel")]
Oriente 

#Ejemplo 2: Crear un vector con las etiquetas X1, Y2, ... , X9, Y10 
etiqs<-paste(c("X", "Y"), 1:10, sep="") 
etiqs 

#2.  CREACI�N Y MANEJO DE MATRICES.
#2.1 CREACI�N DE MATRICES NUM�RICAS. 
#FORMA 1-Crear una matriz num�rica vac�a y a�adirle luego sus elementos. 
#Ejemplo 1: 
M <- matrix(numeric(), nrow = 3, ncol=4) 
#Ejemplo 2:
M[2,3] <- 6
M

#FORMA 2-Crear una matriz num�rica asign�ndole todos sus elementos o valores. 
#Ejemplo 1: 
A <- matrix(c(2, 4, 6, 8, 10, 12), nrow=2, ncol=3); A

#FORMA 3-Crear una matriz num�rica dando un rango de valores 
#Ejemplo 1: 
B <- matrix(1:12, nrow=3, ncol=4)
B

#FORMA 4-Crear una matriz a partir de la uni�n de vectores 
# Crear tres vectores 
x1 <- seq(0, 10, 2); x1 
x2 <- seq(1, 11, 2); x2 
x3 <- runif(6); x3 

# Unir los tres vectores en una matriz por columnas. 
Xcol <- cbind(x1, x2, x3)
Xcol 

#Unir los tres vectores en una matriz por filas. 
Xfil <- rbind(x1, x2, x3)
Xfil 

# Acceso a las filas y columnas de una matriz. 
X <- Xfil[1:3, c(2, 3)]
X 

#2.2 OPERACIONES CON MATRICES NUM�RICAS. 
#MULTIPLICACI�N DE MATRICES MATRICES NUM�RICAS: 
#Ejemplo 1:
v<-c(1, 2) 
v %*%A 

#Ejemplo 2: 
P <- A %*% B
P 

#OPERACIONES DE FUNCIONES SOBRE MATRICES NUM�RICAS: 
#Ejemplo 1:
length(A) 

#Ejemplo 2: 
T=sqrt(B) 
T  
#Ejemplo 3: Transpuesta de una matriz
t(B) 

#Ejemplo 4: Determinante de una matriz: 
C <- matrix(c(2, 1, 10, 12), nrow=2, ncol=2) 
C 
det(C) 

#Ejemplo 5: Inversa de una matriz 
InvC <- solve(C)
InvC
b=diag(2)
InvC<-solve(C, b) 
InvC 

#Ejemplo 6: Autovalores y autovectores de uma matriz sim�trica
eigen(C) 

#Ejemplo 7: 
diag(C)

#Ejemplo 8:
diag(C)
 
#Ejemplo 9: 
diag(C)
 
#OTRAS OPERACIONES: 
#Ejemplo 1: 
c(length(C), sum(C), prod(C), min(C), max(C)) 

#Ejemplo 2: 
O <- matrix(sort(C), nrow=2, ncol=2)
O 

#CREACI�N DE UNA MATRIZ DE CADENAS 
#Ejemplo 1: 
nombres <- matrix(c("Carlos", "Jos�", "Ana", "Ren�", "Mar�a", "Mario"),nrow=3, ncol=2)
nombres

#3.  CREACI�N Y MANEJO DE MATRICES INDEXADAS (ARRAY).
#Ejemplo 1: 
X <- array(c(1, 3, 5, 7, 9, 11), dim=c(2, 3)) 
X 

#Ejemplo 2: 
Z <- array(1, c(3, 3)) 
Z 

#Ejemplo 3: 
W <- 2*Z+1
W 

#Ejemplo 4:
TX <- t(X)
TX 

#Ejemplo 5:
a <- c(2, 4, 6); a 
b <- 1:3;b 
M <- a %o% b; M

#Ejemplo 6:  
Arreglo3 <- array(c(1:8, 11:18, 111:118), dim = c(2, 4, 3))
Arreglo3
