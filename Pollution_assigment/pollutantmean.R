cat("\014") 
rm(list = ls())
 

directorio<-getwd( ) 
directorio<-paste0(directorio,"/Pollution_assigment/specdata/")#Añade restante del directorio, paste0 no deja espacio

pollutantmean <-function(directory,pollutant,id=1:332){  #Promedio de contaminación por contaminante
  fileList<-list.files(path =directory,pattern = ".csv",full.names=TRUE) #Lee todos los archivos
  values<-numeric()#Preloca vector de valores de interes
    for (i in id){
    data<-read.csv(fileList[i])
    #Para obtener un data frame unico: leer 1 archivo como DF y leer su nombre b<-names(DF) fuera del ciclo
    #yData<- data.frame(matrix(nrow = 0, ncol = length(b)))
    #colnames(yData) = b
    # alocar el siguiente codigo dentro de este ciclo u<-merge(u,data,all.x = TRUE)
    values<-c(values,data[[pollutant]])
  }
  resultado1<<-mean(values,na.rm = TRUE)
}

#pollutantmean(directorio,"nitrate",70:72)

complete<-function(directory,id=1:332){  #Cuenta las observaciones completas de cada archivo
  fileList<-list.files(path =directory,pattern = ".csv",full.names=TRUE) #Lee todos los archivos
  resultado<-data.frame(id=numeric(0),nobs=numeric(0)) # Reloca DF de resultados
  for(i in id){
    df<-read.csv(fileList[i])#Lee DF para archivo
    data<-df[!is.na(df$sulfate),] #Elimina NA de sulfito
    data<-data[!is.na(data$nitrate),] #Elimina NA nitrato
    nobs<-nrow(data)# Cuenta observaciones completas para ese archivo
    
    resultado <- rbind(resultado, data.frame(ID=i, nobs=nobs))#Une al DF de resultados
  }
  resultado2<<-resultado # Manda al enviroment
}

#complete(directorio, c(2, 4, 8, 10, 12))

corr<-function(directory,threshold=0){ #Cuando se supera un numero de archivos con datos completos, se saca correlacion de nitrato y sulfato entre los datos completos de cada archivo
  cor_results<-numeric(0) #Realoca
  complete_cases<-complete(directory) #Mira que corridas tienen todos los datos
  
  if(nrow(complete_cases>=threshold)){
    fileList<-list.files(path =directory,pattern = ".csv",full.names=TRUE)
    for (i in complete_cases$ID){
      data<-read.csv(fileList[i]) #Lee el archivo
      df<-data[!is.na(data$sulfate),] #Elimina NA de sulfatos
      df<-df[!is.na(df$nitrate),] #Elimina NA de nitratos
      sulf_data<-df["sulfate"]
      nit_data<-df["nitrate"]
      cor_results<-c(cor_results,cor(sulf_data,nit_data))
      test<<-cor(sulf_data,nit_data) 
      }
  }
  resultado3<<-cor_results #Si no se pone return(cor_results) entrega por defecto la ultima definicion al llamar x<-complete(argumentos)
}
#cr <- corr(directorio, 400) #
#summary(cr) #Da (min, Q1, media, promedio, Q3 y max) de los datos en cr