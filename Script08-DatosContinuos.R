#UNIDAD 2: Práctica 08 ANÁLISIS ESTADÍSTICO DE LOS DATOS. 
#Crea el vector que contendrá los datos. 
Notas <- c(4.47, 5.43); Notas 
data.entry(Notas) 
Notas 
length(Notas)

#Guarda el vector de datos en un archivo. 
write(Notas, "Notas.txt")

#Lee o recupera el vector de datos desde el archivo de texto. 
X <- scan("Notas.txt", what = double(0), na.strings = "NA", flush=FALSE) 
ls()

#Crea la tabla de frecuencias. 
# Usa el Método de Herbert A. Sturges para determinar dicho número. 
n <- length(X); n 
k <- 1+3.322*logb(n, 10); k 
k <- round(k); k

# Calcula el ancho o amplitud a de cada intervalo a=rango/k 
rango <- max(X)-min(X); rango 
a=rango/k; a 
a <- round(a, 3); a

# Define los límites y puntos mediosde cada uno de los k intervalos 
limites <- seq(from=min(X)-0.01/2,to=max(X)+0.01/2, by=a); limites 
options(digits=4) 
ci <- cbind(1:k); ci 
for(i in 2:length(limites)) ci[i-1, 1] <- (limites[i] + limites[i-1])/2 
ci

# Encuentra las frecuencias absolutas fi para cada intervalo. 
options(digits=2) 
fi <- cbind(table(cut(Notas, breaks = limites, labels=NULL, include.lowest=FALSE, 
right=FALSE, dig.lab=4))); fi

# Encuentra las frecuencias relativas o proporciones fri. 
options(digits=4) 
fri <- fi/n; fri

# Encuentra las frecuencias acumuladas ascendentes Fi 
options(digits=2) 
Fi <- cumsum(fi); Fi

# Encuentra las frecuencias relativas acumuladas Fri 
options(digits=4) 
Fri <- Fi/n; Fri

#Completa la tabla de frecuencias. 
tablaFrec <- data.frame(ci=ci, fi=fi, fri=fri, Fi=Fi, Fri=Fri); tablaFrec

#Crea el histograma de frecuencias 
h <- hist(X, breaks=c(limites[1]-a, limites, limites[k+1]+a), freq = TRUE, probability = FALSE, 
include.lowest = FALSE,right = TRUE, main = "Histograma de frecuencias", 
col="lightyellow", lty=1, border="purple", xlab="Notas de aspirantes", ylab="Frecuencia (fi)", 
axes=TRUE, labels=FALSE) 
text(h$mids, h$density, h$counts, adj=c(0.5, -0.5), col="red") 
rug(jitter(Notas))  
is.list(h); h

#Aproxima al histograma la función de densidad normal 
h <- hist(X, breaks=c(limites[1]-a, limites, limites[k+1]+a), freq = FALSE, 
probability = TRUE, include.lowest = FALSE, right = TRUE, 
main="Aproximación a una Normal\n", col="lightyellow",lty=1,border="purple", 
xlab="Notas de aspirantes\n", ylab="Frecuencia relativa (fri)", 
axes=TRUE, labels=FALSE) 
text(h$mids, h$density, h$counts, adj=c(0.5, 0.2), col="red") 
rug(jitter(X)) # adiciona marcas de los datos 
curve(dnorm(x, mean=mean(X), sd=sd(X)), col = 2, lty = 2,lwd = 2, add = TRUE) 

#Crea el polígono de frecuencias 
h <- hist(X, breaks=c(limites[1]-a, limites, limites[k+1]+a), freq = TRUE, 
probability=FALSE, include.lowest=FALSE,right=TRUE, 
main = "Polígono de frecuencias",col="lightyellow", lty=1, border="purple", xlab=" 
Notas de aspirantes", ylab="Frecuencia (fi)", axes=TRUE, labels=FALSE) 
text(h$mids, h$density, h$counts, adj=c(0.5, -0.5), col="red") 
rug(jitter(X)) # adiciona marcas de los datos 
vCi <- c(h$mids[1]-a, h$mids, h$mids[k+1]+a); vCi 
vfi <- c(0, h$counts, 0); vfi 
lines(vCi, vfi, col="blue", type="l")

#Crea la Ojiva ascendente o polígono de frecuencias acumuladas ascendentes 
Fia <- c(0, Fi); Fia 
plot(limites, Fia, type = "p", pch=1, col = "blue", main="Ojiva ascendente", 
xlab="Notas de aspirantes",ylab="Frecuencia acumulada (Fi)") 
text(limites, h$density, Fia, adj=c(0.5, -0.5), col="red") 
lines(limites, Fia, col="black", type="l")

#Calcula los principales estadísticos descriptivos de la variable 
# Calcula la moda, ya que el R no proporciona una función para eso. 
options(digits=4) 
for(i in 1:k) if (fi[i] == max(fi)) break() 
if(i > 1) moda <- limites[i]+((fi[i]-fi[i-1])/((fi[i]-fi[i-1])+(fi[i]-fi[i+1]) ))*a 
else {
moda <- limites[i]+(fi[i]/(fi[i]+(fi[i]-fi[i+1])))*a 
moda }

# Calcula los cuartiles: Q1, Q2, Q3 
Q <- 1:3 
for(v in 1:3) for(i in 1:k) if (Fi[i] > (v*25*n)/100) 
{ 
  Q[v] <- limites[i]+(((25*v*n/100)-Fi[i-1])/fi[i])*a 
  break 
} 
Q

# Calcula los principales estadísticos. 
estadisticos <- rbind(media=sum(tabEstad$cifi)/n, moda=moda, Q1=Q[1], Q2=Q[2], Q3=Q[3], 
rango=max(X)-min(X),  varianza=sum(tabEstad$ciMedia2fi)/n, 
Desviacion=sqrt(sum(tabEstad$ciMedia2fi)/n), 
CoeficienteVariacion=sqrt(sum(tabEstad$ciMedia2fi)/n)/(sum(tabEstad$cifi)/n), 
CAfisher=(sum(tabEstad$ciMedia3fi)/n)/sqrt(sum(tabEstad$ciMedia2fi)/n)^3, 
CoeficienteCurtosis=((sum(tabEstad$ciMedia4fi)/n)/sqrt(sum(tabEstad$ciMedia2fi)/n)^4)-3) 
estadisticos 

#Otros gráficos: 
# Gráfico de cajas 
boxplot(2, main="Gráfico de caja", xlab="Notas", notch=FALSE, 
data=parent.frame(), plot=TRUE, border="red", col="yellow",horizontal=TRUE)

