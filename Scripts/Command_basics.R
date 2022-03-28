## DEclarar y mostrar
x <- 5 ## nothing printed
x## auto-printing occurs
print(x) # explicit printing

##Vectores
vector()#Vector vacio
vector("numeric", levector("numeric",length = 4))# De cierto tamaño
x<-c(0.5,0.6) # Vector con esas dos entradas, C concatena lo que sea

## Cambio de tipos
as.character(x) # Funciones as cambian propiedad del vector.

##Matrices
m <- matrix(nrow = 2, ncol = 3) #Vacia
dim(m) #Dimension
mn=matrix(1:6,nrow = 2,ncol = 3) # Llena columna completa 

##Vector a matrix
m <- 1:10
dim(m) <- c(2, 5) #Llena todas las filas de una columna antes de la sig. columna

##Unir vectores en matrix
x <- 1:3
y <- 10:12
cbind(x, y) #Como columnas
rbind(x, y) # Como filas

#Listas
x <- list(1, "a", TRUE, 1 + 4i) # Cada elemento puede contener dimensiones.

##Factores
x <- factor(c("yes", "yes", "no", "yes", "no")) # Vectores con variables caracteres que reemplazan logicos
table(x)#Cuenta la frecuencia de las variables
unclass(x)# Convierte caracteres a logicos numericos

x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes","no")) # Define el orden de los niveles

##Valores faltantes
x <- c(1, 2, NA, 10, 3)
is.na(x)#Caracteres  y numerico
is.nan(x) #Solo 

##Data frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
#read.table() o read.csv() para crearlos desde externos
# data.matrix() lo convierte a matrix

##Nombrar variables de un objeto
x <- 1:3 #En vectores
names(x)
names(x) <- c("foo", "bar", "norf") 
names(x)

x <- list(a = 1, b = 2, c = 3) #En listas
x[1] #Nombra elemento
x$bar#Nombra elemento

m <- matrix(1:4, nrow = 2, ncol = 2)#En matrices
dimnames(m) <- list(c("a", "b"), c("c", "d")) 

#Extraer elementos de matrices
x <- matrix(1:6, 2, 3)
x[2, 1] #Posicion especifica
x[1, ] #Toda la fila 
x[,2 ] #Toda la columnas 2 
x[1, 2, drop = FALSE]
