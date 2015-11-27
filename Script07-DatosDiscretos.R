#UNIDAD 2: Práctica 07-Análisis estadístico de datos univariados discretos con R.
# Crear el vector de datos.
Hijos <- c(2, 1) 
data.entry(Hijos) 
Hijos 
length(Hijos)

# Guardar el vector de datos en un archivo de texto. 
write(Hijos, "Hijos.txt") 

# Leer o recuperar el vector de datos o archivo de texto 
X <- scan("Hijos.txt", what = integer(0), na.strings = "NA", flush=FALSE)
ls()

#Elaborar el gráfico de puntos y diagrama de tallo-hojas (stem-and-leaf) 
stripchart(Hijos, method="stack", vertical=FALSE, col="blue", pch=1, main="Gráfico de\n
puntos", xlab="Número de hijos")

# Crear la tabla de frecuencias completa 
# frecuencias individuales 
fab <- table(Hijos); fab # frecuencias absolutas 
fre <- fab/length(Hijos); fre # frecuencias relativas 
Fac <- cumsum(fab); Fac # frecuencias acumuladas 
Far <- Fac/length(Hijos); Far # frecuencias acumuladas relativas

# tabla de frecuencias completa 
options(digits=2) 
tabla <- data.frame(fab=fab, fre=fre, Fac=Fac, Far=Far) 
names(tabla) <- c("X", "fab", "free.X", "fre", "Fac", "Far") 
tabla 
tfre <- data.frame(X=tabla$X, fab=tabla$fab, fre=tabla$fre, Fac=tabla$Fac, Far=tabla$Far) 
tfre 

# Calcular los estadísticos descriptivos de la variable 
# Estadísticos de tendencia central de los datos 
media <- mean(Hijos, na.rm = FALSE); media

# R no tiene incorporada una función para la moda
for(i in 1:length(Hijos)) if (fab[i] == max(fab)) break() 
moda <- names(fab[i]); moda

#Función para la moda
mediana <- median(Hijos); mediana 

# Estadísticos de dispersión o variabilidad de los datos 
# Devuelve el valor mínimo y máximo del conjunto de datos.
range(Hijos)

# Devuelve la cuasivarianza y la cuasivarianza muestral 
cuasivar <- var(Hijos); cuasivar 
s <- sd(Hijos); s

# Cálculo de Q1, Q2, Q3
quantile(Hijos,c(0.25, 0.5, 0.75))

# En general se pueden encontrar cualquier percentil
quantile(Hijos, 0.6)

# Conocer un resumen de los datos Min, Q1, Median, Mean, Q3, Max 
resumen <- summary(Hijos); resumen 

# min, cuartil menor, mediana, cuartil mayor, max
fivenum(Hijos) 

#Elaborar los gráficos que se le pueden aplicar a la variable discreta 
# Gráfico de barras (por ser pocos valores) 
barplot(tfre[[2]], main="Gráfico de barras", xlab="X = Número Hijos\n", ylab="frecuencia", 
col=c("yellow", "blue", "white", "orange", "cyan", "red"), sub="Agosto-2012")

# Gráfico de pastel (por ser pocos valores) 
pie(tfre[[2]], main="Gráfico de pastel", xlab="Número Hijos \n", 
col=c("yellow", "blue","white", "orange", "cyan", "red"), sub="Agosto-2012")

# Se puede especificar nombres para las categorías 
names(fab) = c("Cero", "Uno", "Dos", "Tres", "Cuatro", "Cinco") 
pie(fab, main="Gráfico de pastel", xlab="X = Número Hijos\n", 
col=c("yellow", "blue","white", "orange", "cyan", "red"), sub="Agosto-2012")

# Gráfico de cajas (box-plot) es la representación gráfica de los cinco números 
# Horizontal 
boxplot(Hijos, main="Gráfico de caja", ylab="Número de hijos\n")

# Vertical 
boxplot(Hijos, main="Gráfico de caja", xlab=" Número de hijos\n", 
plot=TRUE, border="red",col="yellow", horizontal=TRUE)
