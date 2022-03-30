## If 
f(<condition>) {
  ## do something
} else {
  ## do something else
}
if(<condition1>) {
  ## do something
} else if(<condition2>) {
  ## do something different
} else {
  ## do something different
}

## For

x <- c("a", "b", "c", "d")
for(i in 1:4) { #forma 1
  print(x[i])
}
for(i in seq_along(x)) { #forma 2
  print(x[i])
}
for(letter in x) { #forma 3
  print(letter)
}
for(i in 1:4) print(x[i]) #forma 4


x <- matrix(1:6, 2, 3) #Anidado
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  } 
}

##While
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}


z <- 5
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  } 
}

## Repeat
x0 <- 1
tol <- 1e-8
repeat {
  x1 <- computeEstimate()
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  } 
}


## Next, Return
for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next
  }
  ## Do something here
}

## Funciones

f <- function(<arguments>) {
  ## Do something interesting
}

f <- function(a, b) {
  print(a)
  print(b)
}
f(45,42)

z<-3
f<-function(x,y){ s<-x+y+z
                  z<-3
                  s
                 }
f(3,3)

#Functions nesting
make.power <- function(n) {
  pow <- function(x) {
    x^n 
  }
  pow 
}

cube <- make.power(3)
square <- make.power(2)
cube(3) #27
square(3)#9

ls(environment(cube))
get("n", environment(cube))
## Todo lo que se defina en la función no se registra en el environment
##las variables libres se toman del environment si no se han definido en la función, o de la función si se redefine en esta
##la funcion da error si la variable libre se define después que es llamada dentro de la funcion
        
## Fechas
