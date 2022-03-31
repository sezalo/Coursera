cat("\014") 
rm(list = ls())

set.seed(1) #Garabtiza reprodicibulidad

## Normal
ds<-3  #desviacion estandar
prom<-2 #Promedio
v<-rnorm(10, mean=2,sd=3) #Crea 10 valores normales con promedio=mean y desviacion estandar=sd
rnorm(10,prom,ds) #Genera valores normales bajo un mean y sd
#Densidad de probabilidad
f<-dnorm(v,prom,ds) #Para los valores normales con ese mean y sd evalua cual sería su frencuencia
#Probabilidad  acumulada
phi<-pnorm(v,prom,ds)#Probabilidad acumulada de cada valor
# Valor según la probabilidad acumulada
V<-qnorm(phi,prom,ds) 
v==V #True

##Poisson
r<-1 #rata o media esperada
v<-rpois(10,r) #Da diez valores desde 10 probabilidadades según un rata de ocurrencia esperada
phi<-ppois(v,r) # Da probabilidad acumulada de cada evento segun su rata

#Binomial
rbinom(100, 1, 0.5) # Numero de exitos de cien observaciones, de una lanzada cada observacion,con p de  exito de 0.5

#Generar y grafiar modelos lineales
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y) # Se aprecia que son varios puntos poer el efecto del error. Sin este solo serian punto susperpuestos en 0 y 1
