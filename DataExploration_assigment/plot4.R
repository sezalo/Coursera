rm(list = ls())
cat("\014") 

##CARGA DATOS
directorio<-getwd()
directorio<-paste0(directorio,"/DataExploration_assigment") #Establece el directorio
rutas<-list.files(path=directorio,pattern = ".rds",full.names=TRUE) #Enlista los archivos
NEI <- readRDS(rutas[2]) #Lee archivos
SCC <- readRDS(rutas[1])

##COINCIDENCIAS
indice<-grepl("coal",SCC$Short.Name,ignore.case=TRUE)#Vector logico que indica si coal aparece en en los nomrbre de SCC$Short
carbones<-SCC[indice,] #Toma entradas correspondiente al carbon

##JUNTA
completo<- merge(NEI,carbones, by="SCC") #Junta data si coiciden en su SCC
xyear<-tapply(completo$Emissions,completo$year,sum)

##GRAFICA

barplot(xyear, xlab = "Year", ylab = "Total Emission [Ton]", main = "Total Emission from coal sources")

