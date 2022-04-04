rm(list = ls())
cat("\014") 

##CARGA DATOS
directorio<-getwd()
directorio<-paste0(directorio,"/DataExploration_assigment") #Establece el directorio
rutas<-list.files(path=directorio,pattern = ".rds",full.names=TRUE) #Enlista los archivos
NEI <- readRDS(rutas[2]) #Lee archivos
SCC <- readRDS(rutas[1])

##SELECCIONA DE INTERES
xyear<-tapply(NEI$Emissions,NEI$year,sum) #Suma las emisiones por año

##PLOTEA
barplot(xyear,main="Total emision per year",xlab="Year", ylab="Total emissions [Ton]")
