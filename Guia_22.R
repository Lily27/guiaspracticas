#UNIDAD 5: Práctica 22 - Prueba de hipótesis estadísticas. Una población

#1.PRUEBA DE HIPÓTESIS ACERCA DEL VALOR DE UNA PROPORCIÓN

#Una muestra de 100 empleados que habían estado encontacto con sangre o derivados de ésta, fue 
#examinada por presentar evidencia serológica de hepatitis B. Se encontró que 23 de ellos presentaron 
#reacción positiva. ¿Puede concluirse a partir de estos datos que la proporción de los positivos es 
#mayor que 0.15? Tome un nivel de significancia del 5%.

# Construyendo una función en R para realizar la prueba de hipótesis. 
Prueba.prop <- function(x, n, po, H1="Distinto", alfa=0.05) 
{ 
  op <- options(); 
  options(digits=2) 
  pe=x/n #calcula la proporción muestral 
  SE <- sqrt((po * (1-po))/n) # calcula la varianza de la proporción muestral 
  Zo <- (pe-po)/SE #calcula el estadístico de prueba 
  # Si lower.tail = TRUE (por defecto), P[X <= x], en otro caso P[X > x] 
  if (H1 == "Menor" || H1 == "Mayor") 
  { 
    Z <- qnorm(alfa, mean=0, sd=1, lower.tail = FALSE, log.p = FALSE) 
    #calcula los valores críticos de la distribución N(0;1) en el caso de una prueba unilateral 
    valores <- rbind(Prop_Estimada=pe, Prop_Hipotetica=po, Z_critico=Z,Estadistico= Zo) 
  } 
  else 
  { 
    Z <- qnorm(alfa/2, mean=0, sd=1, lower.tail = FALSE, log.p = FALSE) 
    #calcula los valores críticos de la distribuciónN(0;1) en el caso de una prueba bilateral 
    valores <- rbind(Prop_Estimada=pe, Prop_Hipotetica =po, Z_critico_menor=-Z, 
                     Z_critico_mayor =Z, Zo) 
  } # esto es para encontrar los valores críticos 
  if (H1 == "Menor") 
  { 
    if (Zo < -Z) decision <- paste("Como Estadistico <", round(-Z,3), ", entonces rechazamos Ho") 
    else decision <- paste("Como Estadistico>=", round(-Z,3), ", entonces aceptamos Ho") 
  } 
  if (H1 == "Mayor") 
  { 
    if (Zo > Z) decision <- paste("Como Estadistico >", round(Z,3), ", entonces rechazamos Ho") 
    else decision <- paste("Como Estadistico <=", round(Z,3), ", entonces aceptamos Ho") 
  } 
  if (H1 == "Distinto") 
  { 
    if (Zo < -Z) decision <- paste("Como Estadistico <", round(-Z,3), ", entonces rechazamos Ho") 
    if (Zo > Z) decision <- paste("Como Estadistico >", round(Z,3), ", entonces rechazamos Ho") 
    else decision <- paste("Como Estadistico pertenece a [", round(-Z,3), ",", round(Z,3), "], 
                           entonces aceptamos Ho") 
  } # esto para llevar a cabo los contraste de hipótesis 
  print(valores) 
  print(decision) 
  options(op) # restablece todas las opciones iniciales 
} 

Prueba.prop(23, 100, 0.15, H1="Menor", alfa=0.05) 
Prueba.prop(23, 100, 0.15, H1="Mayor", alfa=0.05) 
Prueba.prop(23, 100, 0.15, H1="Distinto", alfa=0.05)

prop.test(x=23, n=100, p=0.15, alternative="less", conf.level=0.95) 
prop.test(x=23, n=100, p=0.15, alternative="greater", conf.level=0.95) 
prop.test(x=23, n=100, p=0.15, alternative="two.sided", conf.level=0.95)

#PRUEBA DE HIPÓTESIS SOBRE UNA MEDIA, VARIANZA DESCONOCIDA. 
#Los siguientes datos corresponden a la longitud medida en centímetros de 18 pedazos de cable 
#sobrantes en cada rollo utilizado:  9.0 3.41 6.13  1.99  6.92  3.12  7.86  2.01  
#5.98 4.15 6.87 1.97  4.01  3.56  8.04  3.24  5.05  7.37

#Una solución podría ser la siguiente: 
Datos = c(9.0,3.41,6.13,1.99,6.92,3.12,7.86,2.01,5.98,4.15,6.87,1.97,4.01,3.56,8.04,3.24,5.05,7.37) 

# digitamos las observaciones 
t.test(Datos,mu=4,alternative="greater")
 
