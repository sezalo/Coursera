cat("\014") 
rm(list = ls())
data(iris)


#promedio de longitud de petalos por especie
tapply(iris$Petal.Length,iris$Species,mean)

#Pomedio de las mediciones por caracteristica
apply(iris[,1:4],2,mean)
colMeans(iris[,1:4])

data(mtcars)

#Millas por galon promedio por tipo de cilindro
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)

# diferencia absoluta del promedio de caballos de fuerza entre carros de 4 y 8 cilindrada
tapply(mtcars$mpg, mtcars$cyl, mean)
a<-tapply(mtcars$hp,mtcars$cyl,mean)
a[1]-a[3]
