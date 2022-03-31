cat("\014") 
rm(list = ls())

#CCARGA DATOS
directorio<-getwd( ) 
outcome_path<-paste0(directorio,"/Hospitals_assigment/outcome-of-care-measures.csv")
hospitals_path<-paste0(directorio,"/Hospitals_assigment/hospital-data.csv")
outcome <- read.csv(outcome_path)
hospitals<-read.csv(hospitals_path)

#PLOT
outcome[, 11] <- as.numeric(outcome[, 11]) # Coniverte rata de ataque cardiacos
hist(outcome[, 11],xlab='Muertes',main='Frecuencia de ratas mensuales de mortalidad por ataque cardiaco en hospitales')

#MEJOR HOSPITAL EN EL ESTADO
best<-function(state= character(),disease=character()){
  return(state)
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)}
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)}
  
}