rm(list = ls())
cat("\014") 

library(ggplot2)
##CARGA DATOS
directorio<-getwd()
directorio<-paste0(directorio,"/DataExploration_assigment") #Establece el directorio
rutas<-list.files(path=directorio,pattern = ".rds",full.names=TRUE) #Enlista los archivos
NEI <- readRDS(rutas[2]) #Lee archivos
SCC <- readRDS(rutas[1])

##SELECCIONA DATOS
BaltData<-subset(NEI,fips=="24510")#BaltaData<-NEI[NEI$fips=="24510",] 
r2plot<- aggregate(Emissions ~ year + type, BaltData, sum) #Suma emisiones por año y tipo de BaltData

##Grafica
g <- ggplot(r2plot, aes(year, Emissions, color = type))
g + geom_line() + xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions [Ton]")) +
  ggtitle("Year total emissions per type in Baltimore")

