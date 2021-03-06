#UNIDAD 6: Pr�ctica 24 - An�lisis de Varianza (ANOVA). 
#EJEMPLO 1. 
#El Ministerio de Educaci�n est� interesado en implementar tres programas de estudio; con el objetivo 
#de medir la habilidad de lectura en los alumnos. Para ello, se eligen alumnos del sexto grado de un 
#Colegio de San Salvador, 27 alumnos fueron asignados al azar, a cada uno de los tres grupos. Se 
#utiliz� un programa diferente en cadagrupo, se llev� a cabo un examen al inicio y al final de la 
#implementaci�n de los programas, los valores obtenidos representan la diferencia que hay entre la 
#nota del examen que se hizo al inicio y al finalde la implementaci�n del programa.

#Contraste a un nivel de significancia del 5% de que los tres m�todos de lectura producen el mismo 
#efecto en la habilidad de lectura de los alumnos. 

# Se digitan las observaciones 
notas <- c(20,18,18,23,22,17,15,13,21,15,20,13,12,16,17,21,15,13,12,15,18,20,18,17,10,24,16) 

# Se crea un vector de datos en el cual se diferencia cada uno de los programas de estudio
programas <- gl(n=3, k=9, labels=c("P1", "P2", "P3"))

#Crea la matriz de datos que contendr� la informaci�n del experimento
datos <- data.frame(notas = notas, programas = programas);datos

#Aplicando el an�lisis de varianza 
mod1 <- aov(notas ~ programas, data = datos)

#Mostrando la tabla ANOVA 
summary(mod1)


