#Pr�ctica 10-An�lisis de una variable bidimensional (categ�rica, continua)

#EJEMPLO 1
#Crea un vector de datos para cada proceso descrito en el problema. 
A <- c(100,96,92,96,92); A 
B <- c(76,80,75,84,82); B 
C <- c(108,100,96,98,100); C

#Crea una hoja de datos teniendo como componentes (columnas) los tres vectores
Baterias <- data.frame(procesoA=A, procesoB=B, procesoC=C); Baterias 
# Para editar los datos puede utilizar la funci�n fix() 
fix(Baterias)

#Guarda la hoja de datos en un archivo. 
write.table(Baterias, file="Baterias.txt", append=FALSE, quote=TRUE, sep=" ", 
na="NA", col.names=TRUE)

#Elimina todos objetos que existen en el espacio de trabajo (Workspace) 
ls(); rm(list=ls(all=TRUE)); ls()

#Recupera la hoja de datos,para probar si fue guardada. 
Baterias <- read.table("Baterias.txt", header=TRUE); Baterias

#Conecta o adjunta la hoja de datos a la segunda ruta o lista de b�squeda. 
attach(Baterias, pos=2) 
search()

#Dibuja un gr�fico horizontal depuntos para los tres procesos. 
stripchart(Baterias, main="Gr�fico de puntos para los tres procesos", 
method = "stack", vertical = FALSE, col="blue", pch=1, xlab="Duraci�n (semanas)", ylab="Proceso")

#Muestra un resumen estad�stico para los tres procesos. 
summary(Baterias)

#Dibuja un gr�fico horizontal de cajas (box-plot) para los tres procesos. 
boxplot(Baterias, width=NULL, varwidth=TRUE,names, add= FALSE, horizontal = TRUE, 
main="Gr�fico de caja por proceso", border=par("fg"), col=c("yellow", "cyan", "red"), xlab = 
"Duraci�n (semanas)", ylab="Proceso")

# Vertical 
boxplot(Baterias, width=NULL, varwidth=TRUE,names, add= FALSE, horizontal = FALSE, 
main="Gr�fico de caja por proceso", border=par("fg"), col=c("yellow", "cyan", "red"), xlab = 
"Duraci�n (semanas)", ylab="Proceso")

#Presenta la matriz de covarianzas muestral. 
options(digits=3)
S <- var(Baterias); S 

#Presenta la desviaci�n est�ndar de cada proceso. 
#desv <- sd(Baterias); desv

# Concatena los tres vectores dentro de un vector simple, junto con un vector factor indicador de 
#la categor�a o tratamiento (A, B, C) que origina cada observaci�n.
Baterias <- stack(Baterias); Baterias

# Prueba de igualdad de medias por descomposici�n de la varianza en dos fuentes de variaci�n:
aov.Baterias <- aov(values~ind, data=Baterias)

# Prueba de igualdad de medias en un dise�o de una v�a
oneway.test(values~ind, data=Baterias, var.equal = TRUE)

#Deshace la concatenaci�n del vector de valores y el vector indicador de categor�a. 
Baterias = unstack(Baterias);Baterias

#Desconecta la hoja de datos de la segunda ruta o lista de b�squeda. 
detach(Baterias, pos=2); search()