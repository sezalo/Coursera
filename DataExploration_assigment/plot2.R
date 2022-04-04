rm(list = ls())
cat("\014") 

##CARGA DATOS
directorio<-getwd()
directorio<-paste0(directorio,"/DataExploration_assigment") #Establece el directorio
rutas<-list.files(path=directorio,pattern = ".rds",full.names=TRUE) #Enlista los archivos
NEI <- readRDS(rutas[2]) #Lee archivos
SCC <- readRDS(rutas[1])

##SELECCIONA DATOS
BaltData<-subset(NEI,fips=="24510")#BaltaData<-NEI[NEI$fips=="24510",] 
 xyear<-tapply(BaltData$Emissions,BaltData$year,sum)
 
 ##GRAFICA
 barplot(xyear,main="Baltimore´s total emision per year",xlab="Year", ylab="Total emissions [Ton]")
 