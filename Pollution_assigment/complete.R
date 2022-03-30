rm(list = ls())

directorio<-getwd( ) 
directorio<-paste0(directorio,"/Pollution_assigment/specdata/")#Añade restante del directorio, paste0 no deja espacio

resultado<-data.frame(id=numeric(0),nobs=numeric(0)) # Reloca DF de resultados

complete<-function(directory,id=1:332){
  fileList<<-list.files(path =directory,pattern = ".csv",full.names=TRUE) #Lee todos los archivos
 for(i in id){
   df<-read.csv(fileList[i])#Lee DF para archivo
   data<-df[!is.na(df$sulfate),] #Elimina NA de sulfito
   data<-data[!is.na(data$nitrate),] #Elimina NA nitrato
   nobs<-nrow(data)# Cuenta observaciones completas para ese archivo
   
   resultado <- rbind(resultado, data.frame(id=i, nobs=nobs))#Une al DF de resultados
 }
  resultado<<-resultado # Manda al enviroment
}
complete(directorio, c(2, 4, 8, 10, 12))