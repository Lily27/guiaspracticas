#Práctica 04-Importación y exportación de datos en R.

#1. USO DE LA FUNCIÓN READ.TABLE().
Entrada1 <- read.table("datos01.txt", header=T);Entrada1

#2. USO DE LA FUNCIÓN SCAN().
#Ejemplo 1:
Edat1 <- scan("datos01.txt", list(X1=0, X2=0), skip = 1, flush = TRUE, quiet = TRUE);Edat1

#Ejemplo 2:
cat("TITULO Línea extra", "2 3 5 7", "11 13 17", file="datos02.txt", sep="\n")

#El archivo lo recuperamos con la función scan():
pp <- scan("datos02.txt", skip = 1, quiet= TRUE)
pp

#3. USO DE LA FUNCIÓN READ.CSV().
hojaR <- read.csv("HojaE1.csv", sep = ";", strip.white = TRUE)
hojaR



#Investigar el tipo de objeto que es hojaR
is.matrix(hojaR); is.list(hojaR); is.data.frame(hojaR)

#Acceda a la componente Producto de hojaR
hojaR$Producto
is.vector(hojaR$Producto); is.factor(hojaR$Producto)
is.vector(hojaR$Cantidad.S1); is.factor(hojaR$Cantidas.S1)

#5. IMPORTAR DATOS DE SPSS HACIA R.
install.packages(c("foreign"))
library(foreign