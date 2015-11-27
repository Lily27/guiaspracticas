#Práctica 03 - Tipos de objetos: factores, listas y hojas de datos, operadores y funciones que operan sobre ellos.

#1.FACTORES NOMINALES Y ORDINALES.
#Ejemplo 1:
 
sexo <- c("M", "F", "F", "M", "F", "F", "M")
sexo 
edad <- c(19, 20, 19, 22, 20, 21, 19)
edad 

FactorSexo = factor(sexo)
FactorSexo

mediaEdad <- tapply(edad, FactorSexo, mean) 
mediaEdad

#2. CREACIÓN Y MANEJO DE LISTAS.
#Ejemplo 1: 
lista1<-list(padre="Pedro", madre="María", no.hijos=3, edad.hijos=c(4,7,9)) 
lista1

#Ejemplo 3: 
lista1[[4]][2] 

#jemplo 4:  
lista1["padre"]

#Ejemplo 5: 
lista1[["nombre"]] 
x <- "nombre" 
lista1[x]

#Ejemplo 6: 
subLista <- lista1[4]
subLista

#Ejemplo 7: 
lista1[5] <- list(sexo.hijos=c("F", "M", "F"))
lista1

#Ejemplo 8: Funciones que devuelven una lista. 
S <- matrix(c(3, -sqrt(2), -sqrt(2), 2), nrow=2, ncol=2)
S 
autovS <- eigen(S)
autovS

evals <- eigen(S)$values
evals

#Ejemplo 9: Crear una matriz dando nombres a las filas y columnas 
Notas <- matrix(c(2, 5, 7, 6, 8, 2, 4, 9, 10),  ncol=3,
dimnames=list(c("Matemática","Álgebra","Geometría"), 
c("Juan","José","René"))); Notas

#3.  CREACIÓN Y MANEJO DE HOJAS DE DATOS (DATA FRAME).
#Ejemplo 1: Creación de un data frame teniendo como columnas tres vectores: 

#log <- sample(c(TRUE, FALSE), size = 20, replace = T); log

comp <- rnorm(20) + runif(20) * (1i); comp

num <- rnorm(20, mean=0, sd=1); num

#Data frame compuesto por los tres vectores anteriores 
#df1 <- data.frame(log, comp, num); df1

#Crear un vector de nombres de los tres vectores anteriores 
nombres <- c("logico", "complejo", "numerico") 
nombres

#Define los nombres de las filas del data frame asignándoles un vector de 20 elementos correspondientes a las 20 primeras letras del abecedario 
#row.names(df1) <- letters[1:20]; df1 

edad <- c(18, 21, 45, 54); edad 
datos <- matrix(c(150, 160, 180, 205, 65, 68, 65, 69), ncol=2, dimnames=list(c(),                                                                            c("Estatura","Peso"))); datos 
sexo <- c("F", "M", "M", "M"); sexo 
hoja1 <- data.frame(Edad=edad, datos, Sexo=sexo); hoja1


