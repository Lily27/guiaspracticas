#UNIDAD 6: Práctica 25 - Diseños por bloques

#EJEMPLO 1. 
#Se probaran 5 raciones respecto a sus diferencias en el engorde de novillos. Se dispone de 20 novillos 
#para el experimento, que se distribuyen en 4 bloques (5 novillos por bloque) con base a sus pesos, al 
#iniciar la prueba de engorde, los novillos más pesados se agruparon en un bloque, en otro se 
#agruparon los 5 siguientes más pesados y así sucesivamente. Los 5 tratamientos (raciones) se 
#asignaron al azar dentro de cada bloque.

#Utilizando un nivel de significancia del 5%, contraste la hipótesis de que las cinco 
#raciones de comida producen el mismo efecto de engorde en los novillos.

# Definiendo el vector que contendrá el bloque al cual pertenecen los novillos.
bloques <- gl(n=4, k=1, length=20);bloques

# Se crea el vector que contendrá los tratamientos de los novillos (raciones de alimento)
tratamientos <- gl(n=5, k=4);tratamientos

# Se digitan los pesos de los novillos 
peso <- c(0.9,1.4,1.4,2.3,3.6,3.2,4.5,4.1,0.5,0.9,0.5,0.9,3.6,3.6,3.2,3.6,1.8,1.8,0.9,1.4 );peso

# Se registra en una hoja de datos los resultados del experimento
datos2 <- data.frame(bloques = bloques, tratamientos = tratamientos, peso = peso);datos2

# Se aplica el análisis de varianza 
mod2 <- aov(peso ~ tratamientos + bloques, data = datos2) 

# Se muestra la tabla ANOVA del experimento 
summary(mod2)