rm(list = ls())
cat("\014") 
library(UsingR);data(galton)

##Regresion lineal con centro en (0,0) e.i. y=mx // b=0
plot(galton$parent,galton$child,pch=19,col="grey")

lm(I(child-mean(child))~I(parent-mean(parent))-1,data=galton) #La resta de la 
#desplaza el cero cero al centro de los datos.El -1 indica intercepto en el origen.
#OJO, hay que añadir las medias para volver a los datos originales desde la regresion
lm(I(child)~I(parent)+1,data=galton) #Sin desplazamientos y con intercepto.
#Para obtener el 