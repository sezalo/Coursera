data<-read.csv("C:/Users/szapatal/Documents/RStudio/Coursera/Scripts/hw1_data.csv")#Lee hw1_data
dim(data) # Da dimensiones del DF 
names(data) # Nombre de las variables
View(data)# Visualiza datos
##--
sum(is.na(data$Ozone)) # Da numero de NA en columna Ozone
##--
sol<-subset(data, Ozone>31 & Temp>90) #Crear sub DF según condiciones
solmean<-mean(solar$Solar.R) # Promedio de columna Solar.R en DF sol
##--
may<-subset(data, Month==5) # sub DF con datos de mayo
max(na.omit(may$Ozone))# Toma ozono de sub DF, elimina NA y halla su maximo.
##--
abr<-subset(data, Month==6)# su DF de mes de abril
mean(na.omit(abr$Temp)) #Promedio de los datos de temperatura de abril excluyendo NA.