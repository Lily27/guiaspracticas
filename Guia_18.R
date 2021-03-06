#UNIDAD 4: Pr�ctica 18 - Estimaci�n por intervalos de confianza (una poblaci�n) 

#Ejercicio 3. 
#Una encuesta sobre una muestra aleatoria de 1,200 familias salvadore�as, mostr� que 360 de ellas 
#tienen problemas con el suministro de agua. Utilizando el paquete R, encuentre un intervalo de 
#confianza de 95% para la proporci�n de familias, en el pa�s, que tienen problemas con el suministro de agua. 

#Utilizando la funci�n proporcionada por el R. 
prop.test(360, 1200, alternative = "two.sided", conf.level=0.95) 

#Creando nuestra propia funci�n 
intervaloProp <- function(x, n, nivel.conf=0.95) 
{ 
  pe <- x/n 
  alfa <- 1-nivel.conf 
  z <- qnorm(1-alfa/2) 
  SE <- sqrt(pe*(1-pe)/n) 
  print(rbind(pe, alfa, z, SE))  LInf <- pe-z*SE 
  LSup <- pe+z*SE 
  print(" ") 
  print(paste("Intervalo para p es: [", round(LInf, 2), ",", round(LSup, 2), "]")) 
} 
x=360; n=1200; nivel.conf=0.95 
intervaloProp(x, n, nivel.conf)

