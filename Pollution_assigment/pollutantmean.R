rm(list = ls())

directorio<-getwd( ) 
directorio<-paste0(directorio,"/Pollution_assigment/specdata/")#Añade restante del directorio, paste0 no deja espacio

pollutantmean <-function(directory,pollutant,id=1:332){
  fileList<<-list.files(path =directory,pattern = ".csv",full.names=TRUE) #Lee todos los archivos
  values<-numeric()#Preloca vector de valores de interes
  
  for (i in id){
    data<-read.csv(fileList[i])
    #Para obtener un data frame unico: leer 1 archivo como DF y leer su nombre b<-names(DF) fuera del ciclo
    #yData<- data.frame(matrix(nrow = 0, ncol = length(b)))
    #colnames(yData) = b
    # alocar el siguiente codigo dentro de este ciclo u<-merge(u,data,all.x = TRUE)
    values<-c(values,data[[pollutant]])
  }
  mean(values,na.rm = TRUE)
}


pollutantmean(directorio,"nitrate",70:72)