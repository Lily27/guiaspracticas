#Pr�ctica 11-An�lisis de una variable bidimensional cuantitativa

#Crea los dos vectores para las dos variables 
# N�mero de usuarios = Variable explicativa o independiente 
usuarios <- c(10, 15, 20, 20, 25, 30, 30); usuarios 
tiempo = c(1.0, 1.2, 2.0, 2.1, 2.2, 2.0, 1.9); tiempo

#Crea una hoja de datos que tenga comocomponentes o columnas los dos vectores. 
Sistema <- data.frame(Usuarios=usuarios, Tiempo=tiempo);Sistema 

# Para editar o ampliar los datos puede utilizar la funci�n fix() 
fix(Sistema)

#Guarda la hoja de datos en un archivo. 
write.table(Sistema, file="Sistema.txt", append=FALSE, quote=TRUE, sep=" ", 
na="NA",col.names = TRUE)

#Elimina los objetos almacenados enel �rea de trabajo (Workspace). 
ls(); rm(list=ls(all=TRUE)); ls()

#Recupera la hoja de datos. 
Sistema <- read.table("Sistema.txt", header=TRUE); Sistema

#Conecta la hoja de datos a la segunda ruta o lista de b�squeda. 
attach(Sistema, pos=2); search()

#Muestra un resumen de principales estad�sticos de las variables. 
summary(Sistema) 
cov(Sistema) # Matriz de covarianzas 
cor(Sistema, use = "all.obs", method="pearson") # Matriz de correlaciones

#Elabora un gr�fico de dispersi�n para analizar alguna relaci�n entre las variables. 
plot(Usuarios, Tiempo, xlim= c(5, 35), ylim= c(0.0, 2.5), type = "p", pch=1, col = "blue", main = 
"Gr�fico de dispersi�n (Usuarios, Tiempo)", xlab="N�mero de usuarios", ylab="Tiempo de ejecuci�n")

#Para identificar un punto arbitrario
identify(Usuarios, Tiempo, n=1) # n=1
# Y luego selecciona un punto en el gr�fico haciendo clic con el rat�n. Esto es �til para identificar puntos que podr�an ser at�picos. 
# Deber� aparecer en la R-Console el �ndice que corresponde a este punto.

#Encontrar el modelo lineal que se ajusta a los datos.
reg.Y.X <- lm(Tiempo ~ -1 + Usuarios, Sistema, 
na.action=NULL, method="qr", model=TRUE)

#Agrega la recta de regresi�n al gr�fico de dispersi�n. 
abline (reg.Y.X) 

#Observaci�n: Alternativamente si quiere una recta m�s "exacta" use: 
lines(Usuarios, 0.079437*Usuarios)

#Efect�a una an�lisis de variabilidad del modelo o descomposici�n de la varianza. 
reg.anova <- anova(reg.Y.X); reg.anova
