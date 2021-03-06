#UNIDAD 4: Pr�ctica 17 - Inferencia estad�stica, Estimaci�n.

#SIMULACI�N DEL CONCEPTO DE INTERVALO DE CONFIANZA PARA ESTIMAR UN PAR�METRO. 

#Ejemplo 1. 
#Sea la variable aleatoria X = el n�mero de caras obtenidas, al lanzar una moneda 
#balanceada 20 veces. Simulamos 50 muestras para generar intervalos de 95% de 
#confianza y as� poder estimar la proporci�n verdadera de caras (p), y encontrar 
#en cu�ntos de estos intervalos se encuentra el verdadero valor de la proporci�n

simulIntProp <- function(m=5, n=1, p, nivel.conf=0.95) 
{ 
  X <- rbinom(m, n, p) 
  # Matriz con 1000 valores aleatorios binomial(n,p), 50 muestras cada una de tama�o 20 
  pe <<- X/n 
  # Calcula la proporci�n estimada en cada una de las muestras. 
  SE <<- sqrt(pe*(1-pe)/n) 
  # Calcula la desviaci�n est�ndarestimada en cada una de las muestras. 
  alfa <- 1-nivel.conf 
  z <<- qnorm(1-alfa/2) 
  Intervalo <<- cbind(pe - z*SE, pe + z*SE) 
  # genera los extremos del intervalo de confianza 
  nInter <<- 0 
  # un contador para conocer en cu�ntos intervalos se encuentra la verdadera proporci�n. 
  for(i in 1:m) 
    if ((p >= Intervalo[i, 1]) && (p <= Intervalo[i, 2])) 
      nInter <<- nInter + 1 
  # funci�n que cuenta cu�ntos intervalos contienen el verdadero valor del par�metro. 
  return(nInter) 
} 
n=20; m= 50; p=0.5; nivel.conf=0.95 
simulIntProp(m, n, p, nivel.conf)

#Gr�fico que muestra los intervalosde confianza de 95% que contienen y no contienen el verdadero 
#valor del par�metro p. 
matplot(rbind(pe - z*SE, pe + z*SE), rbind(1:m, 1:m), type="l", lty=1) 
abline(v=p)


#Ejercicio 1. 
#Sea la variable aleatoria X = el n�mero que se obtiene al lanzar un dado no cargado 
#30 veces. Simular 56 muestras para generar intervalos de 95%de confianza para 
#estimar el promedio (??), y encontrar cu�ntos de estos intervalos contiene el valor 
#medio verdadero.

simulIntProp <- function(m=5, n=1, p, nivel.conf=0.95) 
{ 
  X <- rbinom(m, n, p) 
  # Matriz con 1000 valores aleatorios binomial(n,p), 50 muestras cada una de tama�o 20 
  pe <<- X/n 
  # Calcula la proporci�n estimada en cada una de las muestras. 
  SE <<- sqrt(pe*(1-pe)/n) 
  # Calcula la desviaci�n est�ndarestimada en cada una de las muestras. 
  alfa <- 1-nivel.conf 
  z <<- qnorm(1-alfa/2) 
  Intervalo <<- cbind(pe - z*SE, pe + z*SE) 
  # genera los extremos del intervalo de confianza 
  nInter <<- 0 
  # un contador para conocer en cu�ntos intervalos se encuentra la verdadera proporci�n. 
  for(i in 1:m) 
    if ((p >= Intervalo[i, 1]) && (p <= Intervalo[i, 2])) 
      nInter <<- nInter + 1 
  # funci�n que cuenta cu�ntos intervalos contienen el verdadero valor del par�metro. 
  return(nInter) 
} 
n=30; m= 56; p=0.5; nivel.conf=0.95 
simulIntProp(m, n, p, nivel.conf)
