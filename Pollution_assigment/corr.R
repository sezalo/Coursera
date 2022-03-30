rm(list = ls())

directorio<-getwd( ) 
directorio<-paste0(directorio,"/Pollution_assigment/specdata/")#Añade restante del directorio, paste0 no deja espacio

resultado<-data.frame(id=numeric(0),nobs=numeric(0)) # Reloca DF de resultados

complete<-function(directory,id=1:332){
  fileList<<-list.files(path =directory,pattern = ".csv",full.names=TRUE) #Lee todos los archivos
  correlacion<-numeric(0) #Preloca las relaciones
  for(i in id){}
}