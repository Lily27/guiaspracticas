#Práctica 09-Análisis de unavariable bidimensional categórica.

#REALICE UN ANÁLISIS ESTADÍSTICO DE LOS DATOS.
#Leer o recuperar este archivo con la función read.table() 
HojaCat <- read.csv("HojaCat.csv", strip.white=TRUE);HojaCat

#Conecta la hoja de datos a la segunda ruta o lista de búsqueda. 
attach(HojaCat, pos=2)
search() 

#Crea una tabla de contigencia o de doble entrada 
tablaCont <- table(HojaCat); tablaCont 
length(HojaCat)

# Encuentra la suma de cada filade la tabla de contingencia 
# Distribución marginal de X=Estado civil 
suma.filas <- apply(tablaCont, 1, sum); suma.filas

# Encuentra la suma de cada filade la tabla de contingencia 
# distribución marginal de Y=Ocupación 
suma.columnas <- apply(tablaCont,2,sum); suma.columnas

# Gráficos de barras para tabla de contingencia. 
# Barras apiladas 
barplot(t(tablaCont), main="Gráfico de barras (Estado, Ocupación)", xlab="Estado civil", 
ylab="Ocupación", legend.text=TRUE)

# Barras agrupadas 
barplot(t(tablaCont), main="Gráfico de barras (Estado, Ocupación)", xlab="Estado civil", 
ylab="Ocupación", beside=TRUE, legend.text=TRUE)

#Al usar beside =FALSE se obtiene el mismo gráfico de la instrucción anterior.
barplot(tablaCont, main="Gráfico de barras (Ocupación, Estado)", xlab="Ocupación\n", 
ylab="Estado civil", beside=TRUE, legend.text=TRUE)

#Calcula tablas de proporciones o de probabilidades. 
op <- options() 
options(digits=3) 
options('digits')

# Proporciones basadas en el total de la muestra, la suma de filas y columnas suman 1. 
propTotal <- prop.table(tablaCont); propTotal 
barplot(t(propTotal), main="Gráfico de barras (Estado, Ocupación)", xlab="Estado civil\n", 
ylab="Ocupación", beside=TRUE, legend.text=TRUE)

# Proporciones basadas en el total por fila, cada fila suma 1. 
propFila <- prop.table(tablaCont, 1); propFila 

# Total por fila se indica en 1 
barplot(t(propFila), main="Gráfico de barras (Estado, Ocupación)", xlab="Estado civil\n", 
ylab="Ocupación", beside=TRUE, legend.text=TRUE)

# Proporciones basadas en el total por columna, cada columna suma 1. 
propColum <- prop.table(tablaCont, 2); propColum 

# Total por columna se indica en 2 
barplot(propColum, main="Gráfico de barras (Ocupación, Estado)", xlab="Ocupación\n", 
ylab="Estado civil", beside=TRUE, legend.text=TRUE)


#Realizar la prueba o contraste Chi-cuadrado de independencia 
prueba <- chisq.test(tablaCont); prueba

# Frecuencias absolutas esperadas para la prueba Chi-cuadrada 
# fij = fi./No. column
prueba$expected
