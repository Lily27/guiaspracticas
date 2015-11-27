#UNIDAD 6: Práctica 26 - Diseños bifactoriales

#EJEMPLO 1. 
#Se llevó a cabo un estudio del efecto de la temperatura sobre el porcentaje de encogimiento
#de telas teñidas, con dos réplicas para cada uno de cuatro tipos de tela en un diseño totalmente 
#aleatorizado. Los datos son el porcentaje de encogimiento de dos réplicas de tela 
#secadas a cuatro temperaturas.

#Utilizando un nivel de significancia del 5%
# Definiendo el vector que contendrá el factor A.
FactorA <- gl(n=4, k=8, length=32);FactorA

# Se crea el vector que contendrá los tratamientos de los novillos (raciones de alimento).
FactorB<- gl(n=4, k=2,length=32);FactorB

# Se digitan los pesos de los novillos 
Porcentaje <- c(1.8, 2.1, 2.0, 2.1, 4.6, 5.0, 7.5, 7.9, 2.2, 2.4,4.2, 4.0, 5.4, 5.6, 
9.8, 9.2, 2.8, 3.2, 4.4, 4.8, 8.7, 8.4, 13.2, 13.0, 3.2, 3.6, 3.3, 3.5, 5.7, 5.8, 
10.9, 11.1);Porcentaje

# Se registra en una hoja de datos los resultados del experimento 
datos3 <- data.frame(FactorA = FactorA, FactorB = FactorB, Porcentaje=Porcentaje);datos3 

# Se aplica el análisis de varianza 
mod3 <- aov(Porcentaje ~ FactorA * FactorB, data = datos3) 

# Se muestra la tabla ANOVA del experimento 
summary(mod3)
