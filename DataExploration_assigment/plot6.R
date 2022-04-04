rm(list = ls())
cat("\014") 
library(ggplot2)

##CARGA DATOS
directorio<-getwd()
directorio<-paste0(directorio,"/DataExploration_assigment") #Establece el directorio
rutas<-list.files(path=directorio,pattern = ".rds",full.names=TRUE) #Enlista los archivos
NEI <- readRDS(rutas[2]) #Lee archivos
SCC <- readRDS(rutas[1])

##COINCIDENCIAS
indice<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)#Vector logico que indica si vehicle aparece en en los nomrbre de SCC$Short
vehiculos<-SCC[indice,] #Toma entradas correspondiente a vehiculos

##EXTRAE POR CIUDAD
BaltData<-subset(NEI,fips=="24510")
BaltData$city <- "Baltimore City"
LAData<-subset(NEI,fips=="06037")
LAData$city <- "Los Angeles Country"

##JUNTA
BaltData<-merge(BaltData,vehiculos, by="SCC")
LAData<-merge(LAData,vehiculos, by="SCC")
completo<-rbind(BaltData,LAData)
r2plot<-aggregate(Emissions~year+city,completo,sum)

##GRAFICA
g<- ggplot(r2plot, aes(year,Emissions,color=city))
g + geom_line()+xlab("Year")+ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Baltimore´s and LA´s total motor sources emissions")