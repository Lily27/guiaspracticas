#Práctica 05-Estructuras de control y definición de función en R.
#1.  ESTRUCTURA CONDICIONAL: LA ORDEN IF() Y IFELSE().

#Ejemplo 1: 
if(x>0) y<-1 else y<-0

#Ejemplo 2:
x <- c(6:-4); x 
sqrt(x)  
sqrt(ifelse(x >= 0, x, NA)) 
ifelse(x >= 0, sqrt(x), NA)  

#2. ESTRUCTURAS ITERATIVAS O DE REPETICIÓN: FOR(), WHILE() Y REPEAT()

#Ejemplo 1: 
x <- c(2, 6, 4, 7, 5, 1) 
suma<-0; for(i in 1:3) suma = suma+x[i]; suma

#3.  FUNCIONES ESCRITAS POR EL USUARIO.
#Ejemplo 1: Definir en R la función cuadrática  y=f(x)3x^2-5x+2
func.cuadratica <- function(x) 
{ 
  3*x^2-5*x+2 
}

#Ejemplo: calcular f(2)
y <- func.cuadratica(2);y

#Ejemplo 2: Se quiere definir una función para calcular la media de un vector de datos. 
 
  media <- function(x) 
  { 
    n = length(x) 
    suma <- 0.0 
    for(i in 1:n) suma = suma + x[i] 
    media = suma/n 
  }
  
#Guarde este objeto  
save(media, file= "media.RData")

#Borre todos los objetos del área de trabajo
rm(list=ls(all=TRUE))

#Cargue el objeto con
load("media.RData")

#Pruebe la función media() con los siguientes vectores:
x <- 1:5;(media(x))

y <- c(5, NA , 4, 9)
  

#Ejemplo 3: Se quiere definir una función para graficar la función seno de x. 

Seno <- function(x) 
{ 
  y = sin(x) 
  plot(x, y, main="Ejemplo de gráficos en R", 
       xlab="x", ylab="y = Seno(x)", col="blue", pch=1) 
} 
#Pruebe la función con el siguiente vector: 
  x<-seq(-pi, pi, len=100) 
Seno(x)

