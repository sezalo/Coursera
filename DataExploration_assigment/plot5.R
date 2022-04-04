rm(list = ls())
cat("\014") 

##CARGA DATOS
directorio<-getwd()
directorio<-paste0(directorio,"/DataExploration_assigment") #Establece el directorio
rutas<-list.files(path=directorio,pattern = ".rds",full.names=TRUE) #Enlista los archivos
NEI <- readRDS(rutas[2]) #Lee archivos
SCC <- readRDS(rutas[1])

##COINCIDENCIAS
indice<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)#Vector logico que indica si coal aparece en en los nomrbre de SCC$Short
vehiculos<-SCC[indice,] #Toma entradas correspondiente al carbon

##EXTRAE
BaltData<-subset(NEI,fips=="24510")

##JUNTA
completo<-merge(BaltData,vehiculos, by="SCC")
xyear<-tapply(BaltData$Emissions,BaltData$year,sum)

##GRAFICA
barplot(xyear, xlab = "Year", ylab = "Total Emissions [Ton]", 
        main = "Baltimore´s yearly total emission from motor sources.")
