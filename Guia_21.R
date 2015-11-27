#UNIDAD 5: Práctica 21 - Prueba de hipótesis estadísticas y prueba de normalidad.

#  PRUEBAS DE NORMALIDAD DE UNA MUESTRA
#A continuación procedemos a contrastar normalidad para los datos del IMC en 
#los grupos de Control y de Pacientes

# se digitan los datos del grupo de control 
IMC_Control <- c(23.6, 22.7, 21.2, 21.7, 20.7, 22.0, 21.8, 24.2, 20.1, 21.3, 20.5, 21.1, 21.4, 22.2, 22.6, 20.4, 23.3, 24.8)
par(mfrow=c(1,2))

# se genera el histograma de la variables de interés 
hist(IMC_Control,main="A",xlab="IMC (kg/m2)",ylab="Frecuencia") 

# se genera el diagrama de caja de la variable de interés y se muestra en la misma ventana 
boxplot(IMC_Control,main="B", lab="IMC (kg/m2)",ylim=c(20,25)) 

# los commandos para contrastar normalidad son los siguientes 
sw <- shapiro.test(IMC_Control) 
sw 

#La prueba de Kolmogorov
ks <- ks.test(IMC_Control,"pnorm",mean=mean(IMC_Control),sd=sd(IMC_Control)) 
ks

# luego se digitan los datos para pacientes y se ejecutan las mismas instrucciones 
IMC_Pacientes <- c(25.6, 22.7, 25.9, 24.3, 25.2, 29.6, 21.3, 25.5, 27.4, 22.3, 24.4, 23.7, 20.6, 22.8)

# se genera el histograma de la variables de interés 
hist(IMC_Pacientes,main="A",xlab="IMC (kg/m2)",ylab="Frecuencia") 

# se genera el diagrama de caja de la variable de interés y se muestra en la misma ventana 
boxplot(IMC_Pacientes,main="B", lab="IMC (kg/m2)",ylim=c(20,25)) 

# los commandos para contrastar normalidad son los siguientes 
sw <- shapiro.test(IMC_Pacientes) 
sw

#La prueba de Kolmogorov
ks <- ks.test(IMC_Pacientes,"pnorm",mean=mean(IMC_Pacientes),sd=sd(IMC_Pacientes)) 
ks