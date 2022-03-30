cat("\014") 
rm(list = ls())

#Crea una lista de funciones que puede ser llamada como se ve en cachemean
#Los datos contenidos y creados en estas no se ven en el Enviroment, se guardan en
#un caché que no se ve. 
makeVector <- function(x = numeric()) {    #a<- makeVector(c(j:k)) Lista con funciones einformación del vector en cache
  m <- NULL                         #Define la  media como nula para que la busque en el cache y no acá
  set <- function(y) {
    x <<- y                         #Guarda el valor del vector en el caché
    m <<- NULL                      #Guarda el valor de la media como nula vez que se establecen entradas nuevas.
  }
  get <- function() x               # Simplemente da el valor del vector desde el cache
  setmean <- function(mean) m <<- mean  #Establece el valor de la media en el cache
  getmean <- function() m               #Da el valor de la media el cache
  list(set = set, get = get,            #Crea una lista de funciones, como es el último comando, es lo que devuelve makeVector
       setmean = setmean,              #Cada entrada de la lista lo llama como la funcion, para que al llamar por nombre con $ llame la funcion
       getmean = getmean)              #Como set mean está de primera, al solo llamar makeVector(c(i:j)) llama la función set y crea el vector y borra la media
}                                      # a$set recibe vector, a$get no recibe nada. Respectivamente con a$setmean y a$getmean

cachemean <- function(x, ...) {   #recibe la lista con info y funciones del vector en cache (e.g. a)
  m <- x$getmean()                #obtiene media e "if" verifica si es nula y saca mensaje de no serlo. 
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()                 #Obtiene valores del vector desde cache y la establece
  m <- mean(data, ...)
  x$setmean(m)
  m
}



