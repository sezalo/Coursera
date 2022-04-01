cat("\014") 
rm(list = ls())



##CARGA DATOS
directorio<-getwd( ) 
outcome_path<-paste0(directorio,"/Hospitals_assigment/outcome-of-care-measures.csv")
hospitals_path<-paste0(directorio,"/Hospitals_assigment/hospital-data.csv")
outcome <- read.csv(outcome_path)
#hospitals_info<-read.csv(hospitals_path)



##PLOT
outcome[, 11] <- as.numeric(outcome[, 11]) # Coniverte rata de ataque cardiacos
hist(outcome[, 11],xlab='Muertes',main='Frecuencia de ratas mensuales de mortalidad por ataque cardiaco en hospitales')



##MEJOR HOSPITAL EN EL ESTADO
best<-function(state= character(),disease=character()){
  
  #Datos de interes
  ratas <- as.data.frame(cbind(outcome[, 2],  # hospital 
                               outcome[, 7],   # estado
                               outcome[, 11],  # corataq: ataque al corazon
                               outcome[, 17],  # corafa: falla del corazon
                               outcome[, 23]), # pneumonia
                         stringsAsFactors = FALSE) #Evita conversion de numericos a factor al unir con cbind
  #Renombra las columnas
  colnames(ratas)<-c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  #Testea los entradas sumistradas
  if(!state %in% ratas[,"state"]){
    stop('invalid state')
  }
  
  if(!disease %in% c("heart attack", "heart failure", "pneumonia")){
    stop('invalid outcome')
  }
  
  ratas<-ratas[ratas[,"state"]==state,] #Exluye hospitales del estado de interes
  ratas[,disease]=as.numeric(ratas[,disease]) #Cambia de character a numeric
  ratas<-ratas[!is.na(ratas[,disease]),] #Elimina los NA
  ratas<-ratas[order(ratas[, disease]), ] #Organiza por orden, arriba quedan los puntajes mas bajas pero mejores
  
  Hosp <- ratas[ratas[, disease] == min(ratas[,disease]),1] #Obtiene los nombres que tienen el menor puntaje pero mejor
  sort(Hosp)[1]
}
    #best("TX", "heart attack") # e.g
    #best("MD", "pneumonia") #e.g



## OBTIENE EL HOSPITAL EN DETERMINADA POSICION DEL RANKING
rankhospital<-function(state= character(),disease=character(),num="best"){
  
  #Datos de interes
  ratas <- as.data.frame(cbind(outcome[, 2],  # hospital 
                               outcome[, 7],   # estado
                               outcome[, 11],  # corataq: ataque al corazon
                               outcome[, 17],  # corafa: falla del corazon
                               outcome[, 23]), # pneumonia
                         stringsAsFactors = FALSE) #Evita conversion de numericos a factor al unir con cbind
  #Renombra las columnas
  colnames(ratas)<-c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  #Testea los entradas sumistradas 
  if(!state %in% ratas[,"state"]){
    stop('invalid state')
  }
  
  if(!disease %in% c("heart attack", "heart failure", "pneumonia")){
    stop('invalid outcome')
  }
  
  ratas<-ratas[ratas[,"state"]==state,] #Exluye hospitales del estado de interes
  ratas[,disease]=as.numeric(ratas[,disease]) #Cambia de character a numeric
  ratas<-ratas[!is.na(ratas[,disease]),] #Elimina los NA
  
  #Convierte la entrada de posicion a numerica y evalua si la posicion es valida
  if(num == "best") {
    num <- 1 
  }
  
  if (num == "worst") {
    num <- nrow(ratas)
  }
  
  ratas<-ratas[order(ratas[, disease]), ] #Organiza por orden, arriba quedan los puntajes mas bajas pero mejores
  ratas[num,1] #Obtiene el hospital en la posicion
}
#best("TX", "heart attack")
#best("MD", "pneumonia")

rankall<-function(disease=character(),num="best"){
  Hlist <- data.frame()
  
  for (i in sort(unique(outcome[,"State"]))){
  Hospital<-rankhospital(i,disease,num)
  Hlist<- rbind(Hlist,data.frame(hospital = Hospital,state = i))
  }
  Hlist
}
#rankall("heart attack", 20)