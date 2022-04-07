## EVALUA SI HAY DIFERECIA ENTRE MISMO GRUPO DE SUJETOS AL TRATARLOS RESPECTO A NO TRATARLOS
subject <- c(1,2,3,4,5)
baseline <- c(140,138,150,148,135) #SIN TRATAMIENTO
week2 <- c(132,135,151,146,130) #AL TRATARLOS

examinations <- data.frame(subject, baseline, week2) #CREA DATAFRAME
test <- t.test(x = examinations$baseline, y = examinations$week2, alt = "two.sided", paired = TRUE) #COMO SON LOS MISMOS SUJETOS, ES PAREADO, SE EVALUA QUE LA MEDIA DE LA DIFERENCIA SEA DIFERENTE DE CERO
#test2<-t.test(baseline-week2) # TAMBIEN FUNCIONA, POR DEFAULT ES ALPHA=0.05 A DOS LADOS Y H_0: MU_0=0
pval <- test$p.value
round(pval,3)
#COMO LA PROBABILIDAD DE OPTENER MU_OBS BAJO H_0 (P-VALUE) ES MAYOR QUE ALFA, NO PODEMOS ASEGURAR QUE EL TRATAMIENTO SEA EFECTIVO


## HALLA VALOR DE MU_0 PARA RECHAZAR H_0: MU=MU_0 DADO UN MU Y SIGMA OBSERVADOs EN N=9 con alfa=5% a dos colas
mu_obs<-1100
n<-9
gl<-n-1
s<-30

mu_0<-mu_obs+c(-1,1)*qt(0.975,df = gl)*s/sqrt(n)

#https://rpubs.com/jlbellier/242182
#https://github.com/sezalo/datasciencecoursera/blob/master/6_%20Statistical_Inference/quizzes/quiz4withExplanation.md
