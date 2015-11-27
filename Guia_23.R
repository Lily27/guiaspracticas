#UNIDAD 5: Práctica 23 - Prueba de hipótesis estadísticas. Dos poblaciones. 

#PRUEBAS SOBRE DOS MUESTRAS INDEPENDIENTES
#Volviendo al problema de la importancia del estadonutricional (introducido en la practica 21) en 
#pacientes diabéticos (pacientes) y saludables (grupo control) con complicaciones. Los datos se 
#muestran en los siguientes cuadros.

#Las hipótesis a contrastar son:
#H0:??1=??2
#H1:??1?????2

#En lenguaje R está implementada la prueba t, el siguiente código ejemplo la calcula para las dos 
#muestras:

# Primero digitamos las observaciones correspondientes a ambas muestras 
IMC_Control <- c(23.6, 22.7, 21.2, 21.7, 20.7, 22.0, 21.8, 24.2, 20.1, 21.3, 20.5, 21.1, 21.4, 22.2, 22.6, 
                 20.4, 23.3, 24.8)
IMC_Pacientes <- c(25.6, 22.7, 25.9, 24.3, 25.2, 29.6, 21.3, 25.5, 27.4, 22.3, 24.4, 23.7, 20.6, 22.8)

# Realizamos el contraste de igualdad de medias 
t.test(IMC_Control, IMC_Pacientes, var.equal=TRUE, mu=0)

#Se concluye entonces que existe diferencia significativa en el IMC para ambos grupos de pacientes, 
#pues el p valor de la prueba resulta ser muy pequeño.

#PRUEBAS SOBRE DOS MUESTRAS PAREADAS 
#Se cuenta con los datos simulados (con fines didácticos), de las observaciones de la presión 
#arterial sistólica (PAS) en un grupo de 10 pacientes antes y después de un tratamiento consistente en 
#una dieta especial de bajosodio y medicamentos.

#Las hipótesis a contrastar son:
#H0:??1=??2
#H1:??1?????2

#El código en lenguaje R para calcular la prueba t para dos muestras apareadas es el siguiente: 
PAS.antes <- c(160,155,180,140,150,130,190,192,170,165) 
PAS.despues <- c(139,135,175,120,145,140,170,180,149,146)

#verificando la normalidad 
shapiro.test(PAS.antes) 
shapiro.test(PAS.despues)

ks.test(PAS.antes,"pnorm",mean=mean(PAS.antes),sd=sd(PAS.antes)) 
ks.test(PAS.despues,"pnorm",mean=mean(PAS.despues),sd=sd(PAS.despues))

#realizando la prueba t
t.test(PAS.antes, PAS.despues, paired=TRUE, mu=0)
#El valor del estadístico t es 4.0552, con gl = 9, P = 0.0029. Con estos resultados se rechaza  0 Hy por lo 
#tanto se concluye que la PAS antes y después del tratamiento es distinta, es decir, el tratamiento ha 
#sido efectivo.


#PRUEBA DE HIPÓTESIS ACERCA DE LA VARIANZA DE DOS POBLACIONES 
#El director de una sucursal de una compañía deseguros espera que dos de sus mejores agentes 
#consigan formalizar por término medio el mismo número de pólizas mensuales.
#Los datos indican las pólizas formalizadas en los últimos 5 meses por ambos agentes. 


#introduciendo los datos 
Agente_A <- c(12, 11, 18, 16, 13) 
Agente_B <- c(14, 18, 18, 17, 16)
# realizando el contraste de igualdad de varianzas 
var.test(Agente_A, Agente_B) 

