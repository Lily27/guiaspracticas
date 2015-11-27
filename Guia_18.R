#UNIDAD 4: Práctica 18 - Estimación por intervalos de confianza (una población) 

#Ejercicio 3. 
#Una encuesta sobre una muestra aleatoria de 1,200 familias salvadoreñas, mostró que 360 de ellas 
#tienen problemas con el suministro de agua. Utilizando el paquete R, encuentre un intervalo de 
#confianza de 95% para la proporción de familias, en el país, que tienen problemas con el suministro de agua. 

#Utilizando la función proporcionada por el R. 
prop.test(360, 1200, alternative = "two.sided", conf.level=0.95) 

#Creando nuestra propia función 
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

