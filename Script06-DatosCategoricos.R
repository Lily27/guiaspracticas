#Práctica 07 - Análisis de datos categóricos.

#1.  ANÁLISIS ESTADÍSTICO DE DATOS CATEGÓRICOS.
#Preferencias sobre el tipo de gaseosa que se consume: "CC"=Coca Cola, "PC"=Pepsi Cola, "SC"=Salva Cola

#Ejemplo 1: Crear un vector con el tipo de gaseosa y otro con la muestra generada aleatoriamente: 
  Tipo <- c("CC", "PC", "SC"); Tipo 

# crea un vector en las que contiene los tres tipos de refrescos 
Consumo <- sample(Tipo, 20, replace=TRUE); Consumo

#Editar o agregar datos
data.entry(Consumo)

#Guarde el vector en un archivo de datos 
write(Consumo, "Consumo.txt")

#Eliminar los objetos que existen enel espacio de trabajo (Workspace) 
ls() 
rm(list=ls(all=TRUE)) 
ls()

#Leer o recuperar el vector de datos o archivo de texto 
Consumo <- scan("Consumo.txt", what= character(), na.strings = "NA",flush=FALSE)
Consumo 
ls()

#Crear la tabla de distribuciónde frecuencias y proporciones 
frec <- table(Consumo); frec 
prop <- table(Consumo)/length(Consumo); prop

#Conocer un resumen de los datos 
summary(Consumo)

#Realizar un gráfico de barras 
# Para las frecuencias absolutas 
barplot(frec, main="Gráfico de barras", xlab="Consumo", col=c("yellow", "pink", "red"), 
        sub="Agosto-2012") 

# Para las frecuencias relativas 
barplot(prop, main="Gráfico de barras", xlab=" Consumo\n", col=c("yellow", "white", 
"Cyan"), sub="Agosto-2012")

#Realizar un gráfico de pastel 
pie(frec, main="Gráfico de pastel", xlab="Tipo de Consumo", col=c("yellow", "pink", 
"cyan"), sub="Agosto-2012")

#Especificar nombres para las categorías y el color de los sectores 
names(frec) = c("Coca Cola", "Pepsi", "Salva Cola") 
pie(frec, main="Gráfico de pastel", xlab=" Consumo", radius=0.8, col=c("red", 
"gray","cyan"), sub="Agosto-2012")

#Colocar valores numéricos en los sectores del gráfico
n <- length(frec) 
hoja <- data.frame(frec); hoja 
etiq <- c(paste(hoja$Var1, "-", hoja$Freq)); etiq 
pie(frec, main="Gráfico de pastel", labels=etiq, col=rainbow(n), border=TRUE)


