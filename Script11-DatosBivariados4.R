#Práctica 11-Análisis de una variable bidimensional cuantitativa

#Crea los dos vectores para las dos variables 
# Número de usuarios = Variable explicativa o independiente 
usuarios <- c(10, 15, 20, 20, 25, 30, 30); usuarios 
tiempo = c(1.0, 1.2, 2.0, 2.1, 2.2, 2.0, 1.9); tiempo

#Crea una hoja de datos que tenga comocomponentes o columnas los dos vectores. 
Sistema <- data.frame(Usuarios=usuarios, Tiempo=tiempo);Sistema 

# Para editar o ampliar los datos puede utilizar la función fix() 
fix(Sistema)

#Guarda la hoja de datos en un archivo. 
write.table(Sistema, file="Sistema.txt", append=FALSE, quote=TRUE, sep=" ", 
na="NA",col.names = TRUE)

#Elimina los objetos almacenados enel área de trabajo (Workspace). 
ls(); rm(list=ls(all=TRUE)); ls()

#Recupera la hoja de datos. 
Sistema <- read.table("Sistema.txt", header=TRUE); Sistema

#Conecta la hoja de datos a la segunda ruta o lista de búsqueda. 
attach(Sistema, pos=2); search()

#Muestra un resumen de principales estadísticos de las variables. 
summary(Sistema) 
cov(Sistema) # Matriz de covarianzas 
cor(Sistema, use = "all.obs", method="pearson") # Matriz de correlaciones

#Elabora un gráfico de dispersión para analizar alguna relación entre las variables. 
plot(Usuarios, Tiempo, xlim= c(5, 35), ylim= c(0.0, 2.5), type = "p", pch=1, col = "blue", main = 
"Gráfico de dispersión (Usuarios, Tiempo)", xlab="Número de usuarios", ylab="Tiempo de ejecución")

#Para identificar un punto arbitrario
identify(Usuarios, Tiempo, n=1) # n=1
# Y luego selecciona un punto en el gráfico haciendo clic con el ratón. Esto es útil para identificar puntos que podrían ser atípicos. 
# Deberá aparecer en la R-Console el índice que corresponde a este punto.

#Encontrar el modelo lineal que se ajusta a los datos.
reg.Y.X <- lm(Tiempo ~ -1 + Usuarios, Sistema, 
na.action=NULL, method="qr", model=TRUE)

#Agrega la recta de regresión al gráfico de dispersión. 
abline (reg.Y.X) 

#Observación: Alternativamente si quiere una recta más "exacta" use: 
lines(Usuarios, 0.079437*Usuarios)

#Efectúa una análisis de variabilidad del modelo o descomposición de la varianza. 
reg.anova <- anova(reg.Y.X); reg.anova
