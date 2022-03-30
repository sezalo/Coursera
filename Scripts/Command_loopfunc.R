cat("\014") 
rm(list = ls())
## Funciones iterativas o loops
# lapplyy recibe una lista, aplica funcion a cada fila de la lista y devuelve lista de resultados. Si es un DF lo aplica a cada columna
x <- list(a = 1:5, b = rnorm(10)) 
y<-lapply(x, mean)
z<-y[1] #Extrae elemento de la lista como otra lista
z<-as.numeric(z) #Cambia de lista a numerico

#lapply toma x como primer argumento de la funcion(e.g. runif), y luego min y max como los otros argmetnos de la funcion.
x <- 1:4
lapply(x, runif, min = 0, max = 10) 

# lapply puede hacer uso de funciones anonimas
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2)) 
lapply(x, function(y) y[,1]) #Se usan anonimas para evitar loops y no hay funcion definida, i.e devuelve primer elemento de una fila

#sapply simplifica resultados de lapply, buscando no entregar listas de ser posible sino vectores, matrices 
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
sapply(x, mean)

##apply evaluas funciones, usualmente sobre un margen de un arreglo (e.g. columnas, filas)
x <- matrix(rnorm(200), 20, 10)
apply(x,1,sum) #Matriz, margen(i.e. 1=por filas, 2,por columnas), funcion
apply(x, 2, mean)
      #rowSums = apply(x, 1, sum)
      #rowMeans = apply(x, 1, mean)
      #colSums = apply(x, 2, sum)
      #colMeans = apply(x, 2, mean)

## apply puede trabajar sobre array (array: guarda datos en R3, array(d,c(x,y,z) con d vector de datos, x,y,z dimensiones // z elementos xy))
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean) # =rowMeans(a, dims = 2)

## mapply permite aplicar una funciones variando el argumento principal y sus opciones en simultaneo
mapply(rep, 1:4, 4:1) # =list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

## mapply puede vectorizar una funcion
noise <- function(n, mean, sd) { #Funcion a vectorizar
   rnorm(n, mean, sd)
  }

noise(1:5, 1:5, 2)#No da el resultado deseado. Da cosa rara de no interes, cinco datos con media y desviacion desconocida
mapply(noise, 1:5, 1:5, 2) #Da el resultado deseado. 1 dato con media 1, 2 datos con media 2, 3 datos con media 3...


## Aplica una funcion sobre un subset de vectores, simplifica en vectores y matrices. Sino devuelve lista 
x<-c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10) #vector de 3x10 columnas donde rpite diez veces 1, 1o veces 2 y 10 veces 3. (subniveles)
tapply(x, f, mean) #Devuelve media de los datos de x en grupos segun indica el número del factor f.


tapply(x, f, range) #Da rango de cada grupo

## split dado un factor; divide un vector, lista o DF en subvectores según ese factor
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

#Se puede acoplar split ocn lapply
lapply(split(x, f), mean)

#Para split con DF se necesita pquete datasets
library(datasets)
head(airquality)
s <- split(airquality, airquality$Month) #Separa por meses
lapply(s, function(x) colMeans(c("Ozone", "Solar.R", "Wind")))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) #Entrega lo de sapply pero organizado en matriz
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],
                               na.rm = TRUE)) #Omite los NA

# vapply(flags, unique, numeric(1)) # es como lapply y sapply pero se le indica el formato de salida y longitud esperado para el resultado