#UNIDAD 3: Pr�ctica 14 - Distribuciones de probabilidad discreta 

#C�LCULO DE PROBABILIDADES.

#Ejemplo 1:
#Si un estudiante responde al azar a un examen de 8 preguntas de verdadero o falso. 
#a) �Cu�l es la probabilidad de que acierte 4?
dbinom(4,8,0.5)

#b) �Cu�l es la probabilidad de que acierte a lo sumo 2?
x <- 2; n=8; p=1/2
pbinom(x, size = n, prob = p, lower.tail=TRUE)

#c) �Cu�l es la probabilidad de que acierte 5 o m�s?
x <- 4; n=8; p=1/2

#primera forma 
F <- 1 - pbinom(x, n, p, lower.tail=TRUE); F
#segunda forma 
pbinom(4, size=8, prob=0.5, lower.tail=FALSE)

#Ejemplo 2: 
#Una cierta �rea de Estados Unidos es afectada, en promedio, por 6 huracanes al a�o. 
#Encuentre la probabilidad de que en un determinado a�o esta �rea sea afectada por: 

#a) Menos de 4 huracanes.
x <- 3; mu <- 6 
ppois(x, lambda = mu, lower.tail=TRUE)

#b) Entre 6 y 8 huracanes
#primera forma 
sum(dpois(c(6,7,8),lambda = 6))

# segunda forma restar las probabilidades acumuladas
F8 <- ppois(8, lambda = 6, lower.tail=TRUE) 
F5 <- ppois(5,lambda = 6, lower.tail=TRUE) 
F8 - F5

#c) Represente gr�ficamente la funci�n de probabilidad 
#de la variable aleatoria X que mide el n�mero de huracanes por a�o.
#n <- 30 
#genera 30 valores de una distribuci�n de Poisson con ??=6
x <- rpois(n, lambda=mu)

#calcula las probabilidades para cada valor generado 
y <- dpois(x, lambda=mu)

#genera el gr�fico de distribuci�n 
plot(x, y, xlab="x", ylab="Funci�n de probalidad", 
main="Distribuci�n de Poisson: lambda = 6",type="h")

#une los puntos a las l�neas 
points(x, y, pch=21)

#Ejemplo 3: 
#En un juego se disponen 15 globos llenos de agua, delos que 4 tienen premio. Los participantes en el 
#juego, con los ojos vendados, golpean los globos con un bate por orden hasta que cada uno consigue romper2.

#a) �Cu�l es la probabilidad de que elprimer participante consiga un premio?
# x define el n�mero de globos con premio
x <- 0:2; m = 11; n <- 4; k=2

# se construye la distribuci�n de frecuencias del n�mero de premios 
Tabla <- data.frame(Probabilidad=dhyper(x, m, n, k)) 
rownames(Tabla) <- c("Ning�n premio","Solamente uno", "Dos premios") 
Tabla 

#b) Si el primer participante ha conseguido s�lo un premio, �cu�l es la probabilidad de que el 
#segundo participante consiga otro?
x = 1; m= 10; n= 3; k= 2; 
dhyper(x, m, n, k)

#Ejemplo 4: 
#Un vendedor de alarmas de hogar tiene �xito enuna casa de cada diez que visita. 
#Calcula:

#a) La probabilidad de que en un d�a determinado consiga vender la primera alarma en la sexta 
#casa que visita.
# x define el n�mero de intentos fallidos 
x <- 0:5; p=0.1

# creando la tabla de distribuci�n de frecuencias del n�mero de intentos fallidos antes de 
#obtener la primera venta. 
Tabla <- data.frame(Probabilidad=dgeom(x, prob=p))

# nombrando las filas de la distribuci�n de frecuencias 
rownames(Tabla) <- c("Venta en el primer intento", "Venta en el segundo intento", 
"Venta en el tercer intento", "Venta en el cuarto intento", 
"Venta en el quinto intento", "Venta en el sexto intento") 
Tabla

#b) La probabilidad de que no venda ninguna despu�s de siete viviendas visitadas.
x=0; n=7; p=0.1 
dbinom(x, n, p, log = FALSE)

#c) Si se plantea vender tres alarmas, �cu�l es la probabilidad deque consiga su objetivo en la 
#octava vivienda que visita?
y <- 0:5; r=3; p <- 0.1 
Tabla <- data.frame(Probabilidad=dnbinom(y, size=r, prob=p)) 
rownames(Tabla) <- 0:5 
Tabla

#GENERACI�N DE MUESTRAS ALEATORIAS DE LAS DISTRIBUCIONES 
#Ejemplo 1: 
#Generar 100 n�meros aleatorios de una distribuci�n Binomial de par�metros n= 15 ensayos o pruebas 
#y una probabilidad de �xito de 0.25. 
# Definir los par�metros apropiados 
n <- 15; p <- 0.25 

# generar 100 n�meros aleatorios binomiales 
x = rbinom(100, n, p); x 

# Histograma para la muestra aleatoria de tama�o 100 
hist(x, main="X ~ Binomial(n=15, p=0.25)", xlab="X = N�mero de �xitos", 
ylab="masa de probabilidad", probability=TRUE, col="Cyan")

# Graficar la funci�n de probabilidad te�rica, use la funci�n points(), 
#no debe cerrar el gr�fico obtenido con la instrucci�n anterior 
xvals=0:n; points(xvals, dbinom(xvals, n, p), type="h", lwd=3) 
points(xvals, dbinom(xvals, n, p), type="p", lwd=3)

#Ejemplo 2: 
#Generar 100 n�meros aleatorios de una distribuci�n Poisson con 200000 
#ensayos o pruebas y una probabilidad de �xito de 3/100000 

# Definir los par�metros apropiados 
n <- 200000; p <- 3/100000; lambda=n*p 

# generar 100 n�meros aleatorios de la distribuci�n 
x = rpois(100, lambda); x 

# Histograma para la muestra aleatoria de tama�o 100 
hist(x, main=expression(paste("X ~ Poisson( ", lambda, " = 6 )")), xlab="X = N�mero de eventos a 
una tasa constante", ylab="masa de probabilidad", probability=TRUE, col="pink") 

# Graficar la funci�n de probabilidadte�rica, use la funci�n points() 
xvals=0:n; points(xvals, dpois(xvals, lambda), type="h", lwd=3) 
points(xvals, dpois(xvals, lambda), type="p", lwd=3)

