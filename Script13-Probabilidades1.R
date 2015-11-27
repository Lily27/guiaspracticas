#UNIDAD 3: Práctica 13 - Espacios muestrales

#GENERACIÓN DE ESPACIOS MUESTRALES Y DE MUESTRAS ALEATORIAS.

#Simular 10 lanzamientos de una moneda 
# vector del cual se tomará la muestra 
moneda <- c("C", "+"); moneda

# tamaño de la muestra 
n <- 10; n 

#generando la muestra aleatoria con reemplazamiento
lanzamientos <- sample(moneda, n, replace=TRUE); lanzamientos

#Elegir 6 números de una lotería de 54 números 
# se define el espacio muestral del cual se tomará la muestra
espacio <- 1:54;espacio 
# se define el tamaño de la muestra 
n <- 6; n 

#seleccionando la muestra sin reposición 
muestra <- sample(espacio, n); muestra

#Simular 4 lanzamientos de dos dados 
espacio = as.vector(outer(1:6, 1:6, paste)); espacio

# se define el tamaño de la muestra 
n <- 4; n

# finalmente se selecciona la muestra 
muestra <- sample(espacio, n, replace=TRUE); muestra

#Seleccionar cinco cartas de un naipe de 52 cartas 
naipe = paste(rep(c("A", 2:10, "J", "Q", "K"), 4), 
c("OROS","COPAS", "BASTOS","ESPADAS"));naipe

# se define el tamaño de la muestra 
n <- 5; n 

# se obtiene la muestra sin reemplazo (aunque no se especifique con replace=FALSE) 
cartas <- sample(naipe, n) ; cartas

#Generar una muestra aleatoria de tamaño 120,con los números del 1 al 6 en el que las probabilidades de cada uno de los números son respectivamente los siguientes valores: 0.5, 0.25, 0.15, 0.04, 0.03 y 0.003.
sample(1:6,120,replace=TRUE, c(0.5,0.25,0.15,0.04,0.03,0.03))

#Escriba una función que reciba los números enteros entre 1 y 500 inclusive, la función retornará el 
#espacio formado por los números divisibles entre 7.Después de llamar a esta función se extraerá 
#aleatoriamente 12 de estos números, con reemplazo.

# definiendo la función que generará el espacio formado 
espacio <- function(num) 
{ 
 numDiv7 <- numeric(0) 
 ind <- 0 
 for(i in 1:length(num)) 
   if ((num[i] %% 7)==0) 
    { 
     ind <- ind+1 
     numDiv7[ind]=num[i] 
    } 
 return(numDiv7) 
}
numeros <- 1:500
espacio

# generando el espacio muestral 
s <- espacio(numeros); s

# seleccionando la muestra 
muestra <- sample(s, 12, replace=TRUE); muestra 

