
setwd("C:/Users/Julian_Hdez/Desktop/Especializaión econometría/Fundamentos de programación/clase 08.10.21/Material clase")

base2017_2019 <- readRDS("base_2017_2019.rds")
names(base2017_2019)
table(base2017_2019$departamento)
table(base2017_2019$AREA) #13 areas metropolitanas
table(is.na(base2017_2019$departamento))
table(is.na(base2017_2019$AREA))

table(is.na(base2017_2019$salario))
table(is.na(base2017_2019$INGLABO))

## Eliminamos  variables que no usaremos
base2017_2019<-base2017_2019[,c("llave","DIRECTORIO","SECUENCIA_P","ORDEN","HOGAR",
                                "contador","AREA","departamento","salario","INGLABO",
                                "fex_c_2011","año")]

#Eliminamos los datos inexistentes
base2017_2019$logica<-0
base2017_2019$logica[is.na(base2017_2019$INGLABO)==TRUE]<-1
base2017_2019<-base2017_2019[which(base2017_2019$logica==0),]

library("dplyr")

base2017<-base2017_2019[which(base2017_2019$año==2017),]

table(base2017$AREA)

##############################################################################################################
##############################################################################################################
##############################################################################################################
######departamento 05

base2017_5<-base2017[which(base2017$AREA=="05"),]
base2017_5<-arrange(base2017_5,INGLABO)
filas2017_5<-nrow(base2017_5)
base2017_5$obs<-c(1:filas2017_5)
base2017_5$decil<-0
base2017_5$decil[which(base2017_5$obs<=(filas2017_5/10))]<-1
base2017_5$decil[which(base2017_5$obs>filas2017_5/10&base2017_5$obs<=filas2017_5/10*2)]<-2
base2017_5$decil[which(base2017_5$obs>filas2017_5/10*2&base2017_5$obs<=filas2017_5/10*3)]<-3
base2017_5$decil[which(base2017_5$obs>filas2017_5/10*3&base2017_5$obs<=filas2017_5/10*4)]<-4
base2017_5$decil[which(base2017_5$obs>filas2017_5/10*4&base2017_5$obs<=filas2017_5/10*5)]<-5
base2017_5$decil[which(base2017_5$obs>filas2017_5/10*5&base2017_5$obs<=filas2017_5/10*6)]<-6
base2017_5$decil[which(base2017_5$obs>filas2017_5/10*6&base2017_5$obs<=filas2017_5/10*7)]<-7
base2017_5$decil[which(base2017_5$obs>filas2017_5/10*7&base2017_5$obs<=filas2017_5/10*8)]<-8
base2017_5$decil[which(base2017_5$obs>filas2017_5/10*8&base2017_5$obs<=filas2017_5/10*9)]<-9
base2017_5$decil[which(base2017_5$obs>=filas2017_5/10*9)]<-10
table(base2017_5$decil)
table(is.na(base2017_5$decil))
suma_ing_5<-sum(base2017_5$INGLABO)
suma_pob_5<-sum(base2017_5$contador)
#Miremos los datos atipicos
limitesup_5<-mean(base2017_5$INGLABO)+1.96*sd(base2017_5$INGLABO)
limiteinf_5<-mean(base2017_5$INGLABO)-1.96*sd(base2017_5$INGLABO)
base2017_5$atipico<-0
base2017_5$atipico[which(base2017_5$INGLABO>=limitesup_5)]<-1
table(base2017_5$atipico) #personas que ganan mucho mas que la desviación. Ricos.

base2017_5$por_ing<-base2017_5$INGLABO/suma_ing_5
base2017_5$por_pob<-base2017_5$contador/suma_pob_5
resumen_curva2017_5<-doBy::summaryBy(por_ing+por_pob~decil,data = base2017_5,FUN = sum)
resumen_curva2017_5$AREA<-"05"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######departamento 08

base2017_8<-base2017[which(base2017$AREA=="08"),]
base2017_8<-arrange(base2017_8,INGLABO)
filas2017_8<-nrow(base2017_8)
base2017_8$obs<-c(1:filas2017_8)
base2017_8$decil<-0
base2017_8$decil[which(base2017_8$obs<=(filas2017_8/10))]<-1
base2017_8$decil[which(base2017_8$obs>filas2017_8/10&base2017_8$obs<=filas2017_8/10*2)]<-2
base2017_8$decil[which(base2017_8$obs>filas2017_8/10*2&base2017_8$obs<=filas2017_8/10*3)]<-3
base2017_8$decil[which(base2017_8$obs>filas2017_8/10*3&base2017_8$obs<=filas2017_8/10*4)]<-4
base2017_8$decil[which(base2017_8$obs>filas2017_8/10*4&base2017_8$obs<=filas2017_8/10*5)]<-5
base2017_8$decil[which(base2017_8$obs>filas2017_8/10*5&base2017_8$obs<=filas2017_8/10*6)]<-6
base2017_8$decil[which(base2017_8$obs>filas2017_8/10*6&base2017_8$obs<=filas2017_8/10*7)]<-7
base2017_8$decil[which(base2017_8$obs>filas2017_8/10*7&base2017_8$obs<=filas2017_8/10*8)]<-8
base2017_8$decil[which(base2017_8$obs>filas2017_8/10*8&base2017_8$obs<=filas2017_8/10*9)]<-9

base2017_8$decil[which(base2017_8$obs>=filas2017_8/10*9)]<-10
table(base2017_8$decil)
table(is.na(base2017_8$decil))
suma_ing_8<-sum(base2017_8$INGLABO)
suma_pob_8<-sum(base2017_8$contador)
limitesup_8<-mean(base2017_8$INGLABO)+1.96*sd(base2017_8$INGLABO)
limiteinf_8<-mean(base2017_8$INGLABO)-1.96*sd(base2017_8$INGLABO)
base2017_8$atipico<-0
base2017_8$atipico[which(base2017_8$INGLABO>=limitesup_8)]<-1
table(base2017_8$atipico)
base2017_8$por_ing<-base2017_8$INGLABO/suma_ing_8
base2017_8$por_pob<-base2017_8$contador/suma_pob_8
resumen_curva2017_8<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_8,FUN=sum)
resumen_curva2017_8$AREA<-"08"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 50

base2017_50<-base2017[which(base2017$AREA=="50"),]
base2017_50<-arrange(base2017_50,INGLABO)
filas2017_50<-nrow(base2017_50)
base2017_50$obs<-c(1:filas2017_50)
base2017_50$decil<-0
base2017_50$decil[which(base2017_50$obs<=(filas2017_50/10))]<-1
base2017_50$decil[which(base2017_50$obs>filas2017_50/10&base2017_50$obs<=filas2017_50/10*2)]<-2
base2017_50$decil[which(base2017_50$obs>filas2017_50/10*2&base2017_50$obs<=filas2017_50/10*3)]<-3
base2017_50$decil[which(base2017_50$obs>filas2017_50/10*3&base2017_50$obs<=filas2017_50/10*4)]<-4
base2017_50$decil[which(base2017_50$obs>filas2017_50/10*4&base2017_50$obs<=filas2017_50/10*5)]<-5
base2017_50$decil[which(base2017_50$obs>filas2017_50/10*5&base2017_50$obs<=filas2017_50/10*6)]<-6
base2017_50$decil[which(base2017_50$obs>filas2017_50/10*6&base2017_50$obs<=filas2017_50/10*7)]<-7
base2017_50$decil[which(base2017_50$obs>filas2017_50/10*7&base2017_50$obs<=filas2017_50/10*8)]<-8
base2017_50$decil[which(base2017_50$obs>filas2017_50/10*8&base2017_50$obs<=filas2017_50/10*9)]<-9
base2017_50$decil[which(base2017_50$obs>=filas2017_50/10*9)]<-10
table(base2017_50$decil)
table(is.na(base2017_50$decil))
suma_ing_50<-sum(base2017_50$INGLABO)
suma_pob_50<-sum(base2017_50$contador)
limitesup_50<-mean(base2017_50$INGLABO)+1.96*sd(base2017_50$INGLABO)
limiteinf_50<-mean(base2017_50$INGLABO)-1.96*sd(base2017_50$INGLABO)
base2017_50$atipico<-0
base2017_50$atipico[which(base2017_50$INGLABO>=limitesup_50)]<-1
table(base2017_50$atipico)
base2017_50$por_ing<-base2017_50$INGLABO/suma_ing_50
base2017_50$por_pob<-base2017_50$contador/suma_pob_50
resumen_curva2017_50<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_50,FUN=sum)
resumen_curva2017_50$AREA<-"50"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 52

base2017_52<-base2017[which(base2017$AREA==52),]
base2017_52<-arrange(base2017_52,INGLABO)
filas2017_52<-nrow(base2017_52)
base2017_52$obs<-c(1:filas2017_52)
base2017_52$decil<-0
base2017_52$decil[which(base2017_52$obs<=(filas2017_52/10))]<-1
base2017_52$decil[which(base2017_52$obs>filas2017_52/10&base2017_52$obs<=filas2017_52/10*2)]<-2
base2017_52$decil[which(base2017_52$obs>filas2017_52/10*2&base2017_52$obs<=filas2017_52/10*3)]<-3
base2017_52$decil[which(base2017_52$obs>filas2017_52/10*3&base2017_52$obs<=filas2017_52/10*4)]<-4
base2017_52$decil[which(base2017_52$obs>filas2017_52/10*4&base2017_52$obs<=filas2017_52/10*5)]<-5
base2017_52$decil[which(base2017_52$obs>filas2017_52/10*5&base2017_52$obs<=filas2017_52/10*6)]<-6
base2017_52$decil[which(base2017_52$obs>filas2017_52/10*6&base2017_52$obs<=filas2017_52/10*7)]<-7
base2017_52$decil[which(base2017_52$obs>filas2017_52/10*7&base2017_52$obs<=filas2017_52/10*8)]<-8
base2017_52$decil[which(base2017_52$obs>filas2017_52/10*8&base2017_52$obs<=filas2017_52/10*9)]<-9
base2017_52$decil[which(base2017_52$obs>=filas2017_52/10*9)]<-10
table(base2017_52$decil)
table(is.na(base2017_52$decil))
suma_ing_52<-sum(base2017_52$INGLABO)
suma_pob_52<-sum(base2017_52$contador)
limitesup_52<-mean(base2017_52$INGLABO)+1.96*sd(base2017_52$INGLABO)
limiteinf_52<-mean(base2017_52$INGLABO)-1.96*sd(base2017_52$INGLABO)
base2017_52$atipico<-0
base2017_52$atipico[which(base2017_52$INGLABO>=limitesup_52)]<-1
table(base2017_52$atipico)
base2017_52$por_ing<-base2017_52$INGLABO/suma_ing_52
base2017_52$por_pob<-base2017_52$contador/suma_pob_52
resumen_curva2017_52<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_52,FUN=sum)
resumen_curva2017_52$AREA<-"52"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 54

base2017_54<-base2017[which(base2017$AREA==54),]
base2017_54<-arrange(base2017_54,INGLABO)
filas2017_54<-nrow(base2017_54)
base2017_54$obs<-c(1:filas2017_54)
base2017_54$decil<-0
base2017_54$decil[which(base2017_54$obs<=(filas2017_54/10))]<-1
base2017_54$decil[which(base2017_54$obs>filas2017_54/10&base2017_54$obs<=filas2017_54/10*2)]<-2
base2017_54$decil[which(base2017_54$obs>filas2017_54/10*2&base2017_54$obs<=filas2017_54/10*3)]<-3
base2017_54$decil[which(base2017_54$obs>filas2017_54/10*3&base2017_54$obs<=filas2017_54/10*4)]<-4
base2017_54$decil[which(base2017_54$obs>filas2017_54/10*4&base2017_54$obs<=filas2017_54/10*5)]<-5
base2017_54$decil[which(base2017_54$obs>filas2017_54/10*5&base2017_54$obs<=filas2017_54/10*6)]<-6
base2017_54$decil[which(base2017_54$obs>filas2017_54/10*6&base2017_54$obs<=filas2017_54/10*7)]<-7
base2017_54$decil[which(base2017_54$obs>filas2017_54/10*7&base2017_54$obs<=filas2017_54/10*8)]<-8
base2017_54$decil[which(base2017_54$obs>filas2017_54/10*8&base2017_54$obs<=filas2017_54/10*9)]<-9
base2017_54$decil[which(base2017_54$obs>=filas2017_54/10*9)]<-10
table(base2017_54$decil)
table(is.na(base2017_54$decil))
suma_ing_54<-sum(base2017_54$INGLABO)
suma_pob_54<-sum(base2017_54$contador)
limitesup_54<-mean(base2017_54$INGLABO)+1.96*sd(base2017_54$INGLABO)
limiteinf_54<-mean(base2017_54$INGLABO)-1.96*sd(base2017_54$INGLABO)
base2017_54$atipico<-0
base2017_54$atipico[which(base2017_54$INGLABO>=limitesup_54)]<-1
table(base2017_54$atipico)
base2017_54$por_ing<-base2017_54$INGLABO/suma_ing_54
base2017_54$por_pob<-base2017_54$contador/suma_pob_54
resumen_curva2017_54<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_54,FUN=sum)
resumen_curva2017_54$AREA<-"54"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 66

base2017_66<-base2017[which(base2017$AREA==66),]
base2017_66<-arrange(base2017_66,INGLABO)
filas2017_66<-nrow(base2017_66)
base2017_66$obs<-c(1:filas2017_66)
base2017_66$decil<-0
base2017_66$decil[which(base2017_66$obs<=(filas2017_66/10))]<-1
base2017_66$decil[which(base2017_66$obs>filas2017_66/10&base2017_66$obs<=filas2017_66/10*2)]<-2
base2017_66$decil[which(base2017_66$obs>filas2017_66/10*2&base2017_66$obs<=filas2017_66/10*3)]<-3
base2017_66$decil[which(base2017_66$obs>filas2017_66/10*3&base2017_66$obs<=filas2017_66/10*4)]<-4
base2017_66$decil[which(base2017_66$obs>filas2017_66/10*4&base2017_66$obs<=filas2017_66/10*5)]<-5
base2017_66$decil[which(base2017_66$obs>filas2017_66/10*5&base2017_66$obs<=filas2017_66/10*6)]<-6
base2017_66$decil[which(base2017_66$obs>filas2017_66/10*6&base2017_66$obs<=filas2017_66/10*7)]<-7
base2017_66$decil[which(base2017_66$obs>filas2017_66/10*7&base2017_66$obs<=filas2017_66/10*8)]<-8
base2017_66$decil[which(base2017_66$obs>filas2017_66/10*8&base2017_66$obs<=filas2017_66/10*9)]<-9
base2017_66$decil[which(base2017_66$obs>=filas2017_66/10*9)]<-10
table(base2017_66$decil)
table(is.na(base2017_66$decil))
suma_ing_66<-sum(base2017_66$INGLABO)
suma_pob_66<-sum(base2017_66$contador)
limitesup_66<-mean(base2017_66$INGLABO)+1.96*sd(base2017_66$INGLABO)
limiteinf_66<-mean(base2017_66$INGLABO)-1.96*sd(base2017_66$INGLABO)
base2017_66$atipico<-0
base2017_66$atipico[which(base2017_66$INGLABO>=limitesup_66)]<-1
table(base2017_66$atipico)
base2017_66$por_ing<-base2017_66$INGLABO/suma_ing_66
base2017_66$por_pob<-base2017_66$contador/suma_pob_66
resumen_curva2017_66<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_66,FUN=sum)
resumen_curva2017_66$AREA<-"66"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 68

base2017_68<-base2017[which(base2017$AREA==68),]
base2017_68<-arrange(base2017_68,INGLABO)
filas2017_68<-nrow(base2017_68)
base2017_68$obs<-c(1:filas2017_68)
base2017_68$decil<-0
base2017_68$decil[which(base2017_68$obs<=(filas2017_68/10))]<-1
base2017_68$decil[which(base2017_68$obs>filas2017_68/10&base2017_68$obs<=filas2017_68/10*2)]<-2
base2017_68$decil[which(base2017_68$obs>filas2017_68/10*2&base2017_68$obs<=filas2017_68/10*3)]<-3
base2017_68$decil[which(base2017_68$obs>filas2017_68/10*3&base2017_68$obs<=filas2017_68/10*4)]<-4
base2017_68$decil[which(base2017_68$obs>filas2017_68/10*4&base2017_68$obs<=filas2017_68/10*5)]<-5
base2017_68$decil[which(base2017_68$obs>filas2017_68/10*5&base2017_68$obs<=filas2017_68/10*6)]<-6
base2017_68$decil[which(base2017_68$obs>filas2017_68/10*6&base2017_68$obs<=filas2017_68/10*7)]<-7
base2017_68$decil[which(base2017_68$obs>filas2017_68/10*7&base2017_68$obs<=filas2017_68/10*8)]<-8
base2017_68$decil[which(base2017_68$obs>filas2017_68/10*8&base2017_68$obs<=filas2017_68/10*9)]<-9
base2017_68$decil[which(base2017_68$obs>=filas2017_68/10*9)]<-10
table(base2017_68$decil)
table(is.na(base2017_68$decil))
suma_ing_68<-sum(base2017_68$INGLABO)
suma_pob_68<-sum(base2017_68$contador)
limitesup_68<-mean(base2017_68$INGLABO)+1.96*sd(base2017_68$INGLABO)
limiteinf_68<-mean(base2017_68$INGLABO)-1.96*sd(base2017_68$INGLABO)
base2017_68$atipico<-0
base2017_68$atipico[which(base2017_68$INGLABO>=limitesup_68)]<-1
table(base2017_68$atipico)
base2017_68$por_ing<-base2017_68$INGLABO/suma_ing_68
base2017_68$por_pob<-base2017_68$contador/suma_pob_68
resumen_curva2017_68<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_68,FUN=sum)
resumen_curva2017_68$AREA<-"68"

#############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 73

base2017_73<-base2017[which(base2017$AREA==73),]
base2017_73<-arrange(base2017_73,INGLABO)
filas2017_73<-nrow(base2017_73)
base2017_73$obs<-c(1:filas2017_73)
base2017_73$decil<-0
base2017_73$decil[which(base2017_73$obs<=(filas2017_73/10))]<-1
base2017_73$decil[which(base2017_73$obs>filas2017_73/10&base2017_73$obs<=filas2017_73/10*2)]<-2
base2017_73$decil[which(base2017_73$obs>filas2017_73/10*2&base2017_73$obs<=filas2017_73/10*3)]<-3
base2017_73$decil[which(base2017_73$obs>filas2017_73/10*3&base2017_73$obs<=filas2017_73/10*4)]<-4
base2017_73$decil[which(base2017_73$obs>filas2017_73/10*4&base2017_73$obs<=filas2017_73/10*5)]<-5
base2017_73$decil[which(base2017_73$obs>filas2017_73/10*5&base2017_73$obs<=filas2017_73/10*6)]<-6
base2017_73$decil[which(base2017_73$obs>filas2017_73/10*6&base2017_73$obs<=filas2017_73/10*7)]<-7
base2017_73$decil[which(base2017_73$obs>filas2017_73/10*7&base2017_73$obs<=filas2017_73/10*8)]<-8
base2017_73$decil[which(base2017_73$obs>filas2017_73/10*8&base2017_73$obs<=filas2017_73/10*9)]<-9
base2017_73$decil[which(base2017_73$obs>=filas2017_73/10*9)]<-10
table(base2017_73$decil)
table(is.na(base2017_73$decil))
suma_ing_73<-sum(base2017_73$INGLABO)
suma_pob_73<-sum(base2017_73$contador)
limitesup_73<-mean(base2017_73$INGLABO)+1.96*sd(base2017_73$INGLABO)
limiteinf_73<-mean(base2017_73$INGLABO)-1.96*sd(base2017_73$INGLABO)
base2017_73$atipico<-0
base2017_73$atipico[which(base2017_73$INGLABO>=limitesup_73)]<-1
table(base2017_73$atipico)
base2017_73$por_ing<-base2017_73$INGLABO/suma_ing_73
base2017_73$por_pob<-base2017_73$contador/suma_pob_73
resumen_curva2017_73<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_73,FUN=sum)
resumen_curva2017_73$AREA<-"73"

#############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 76

base2017_76<-base2017[which(base2017$AREA==76),]
base2017_76<-arrange(base2017_76,INGLABO)
filas2017_76<-nrow(base2017_76)
base2017_76$obs<-c(1:filas2017_76)
base2017_76$decil<-0
base2017_76$decil[which(base2017_76$obs<=(filas2017_76/10))]<-1
base2017_76$decil[which(base2017_76$obs>filas2017_76/10&base2017_76$obs<=filas2017_76/10*2)]<-2
base2017_76$decil[which(base2017_76$obs>filas2017_76/10*2&base2017_76$obs<=filas2017_76/10*3)]<-3
base2017_76$decil[which(base2017_76$obs>filas2017_76/10*3&base2017_76$obs<=filas2017_76/10*4)]<-4
base2017_76$decil[which(base2017_76$obs>filas2017_76/10*4&base2017_76$obs<=filas2017_76/10*5)]<-5
base2017_76$decil[which(base2017_76$obs>filas2017_76/10*5&base2017_76$obs<=filas2017_76/10*6)]<-6
base2017_76$decil[which(base2017_76$obs>filas2017_76/10*6&base2017_76$obs<=filas2017_76/10*7)]<-7
base2017_76$decil[which(base2017_76$obs>filas2017_76/10*7&base2017_76$obs<=filas2017_76/10*8)]<-8
base2017_76$decil[which(base2017_76$obs>filas2017_76/10*8&base2017_76$obs<=filas2017_76/10*9)]<-9
base2017_76$decil[which(base2017_76$obs>=filas2017_76/10*9)]<-10
table(base2017_76$decil)
table(is.na(base2017_76$decil))
suma_ing_76<-sum(base2017_76$INGLABO)
suma_pob_76<-sum(base2017_76$contador)
limitesup_76<-mean(base2017_76$INGLABO)+1.96*sd(base2017_76$INGLABO)
limiteinf_76<-mean(base2017_76$INGLABO)-1.96*sd(base2017_76$INGLABO)
base2017_76$atipico<-0
base2017_76$atipico[which(base2017_76$INGLABO>=limitesup_76)]<-1
table(base2017_76$atipico)
base2017_76$por_ing<-base2017_76$INGLABO/suma_ing_76
base2017_76$por_pob<-base2017_76$contador/suma_pob_76
resumen_curva2017_76<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_76,FUN=sum)
resumen_curva2017_76$AREA<-"76"

#############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 23

base2017_23<-base2017[which(base2017$AREA==23),]
base2017_23<-arrange(base2017_23,INGLABO)
filas2017_23<-nrow(base2017_23)
base2017_23$obs<-c(1:filas2017_23)
base2017_23$decil<-0
base2017_23$decil[which(base2017_23$obs<=(filas2017_23/10))]<-1
base2017_23$decil[which(base2017_23$obs>filas2017_23/10&base2017_23$obs<=filas2017_23/10*2)]<-2
base2017_23$decil[which(base2017_23$obs>filas2017_23/10*2&base2017_23$obs<=filas2017_23/10*3)]<-3
base2017_23$decil[which(base2017_23$obs>filas2017_23/10*3&base2017_23$obs<=filas2017_23/10*4)]<-4
base2017_23$decil[which(base2017_23$obs>filas2017_23/10*4&base2017_23$obs<=filas2017_23/10*5)]<-5
base2017_23$decil[which(base2017_23$obs>filas2017_23/10*5&base2017_23$obs<=filas2017_23/10*6)]<-6
base2017_23$decil[which(base2017_23$obs>filas2017_23/10*6&base2017_23$obs<=filas2017_23/10*7)]<-7
base2017_23$decil[which(base2017_23$obs>filas2017_23/10*7&base2017_23$obs<=filas2017_23/10*23)]<-8
base2017_23$decil[which(base2017_23$obs>filas2017_23/10*8&base2017_23$obs<=filas2017_23/10*9)]<-9
base2017_23$decil[which(base2017_23$obs>=filas2017_23/10*9)]<-10
table(base2017_23$decil)
table(is.na(base2017_23$decil))
suma_ing_23<-sum(base2017_23$INGLABO)
suma_pob_23<-sum(base2017_23$contador)
limitesup_23<-mean(base2017_23$INGLABO)+1.96*sd(base2017_23$INGLABO)
limiteinf_23<-mean(base2017_23$INGLABO)-1.96*sd(base2017_23$INGLABO)
base2017_23$atipico<-0
base2017_23$atipico[which(base2017_23$INGLABO>=limitesup_23)]<-1
table(base2017_23$atipico)
base2017_23$por_ing<-base2017_23$INGLABO/suma_ing_23
base2017_23$por_pob<-base2017_23$contador/suma_pob_23
resumen_curva2017_23<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_23,FUN=sum)
resumen_curva2017_23$AREA<-"23"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 11

base2017_11<-base2017[which(base2017$AREA==11),]
base2017_11<-arrange(base2017_11,INGLABO)
filas2017_11<-nrow(base2017_11)
base2017_11$obs<-c(1:filas2017_11)
base2017_11$decil<-0
base2017_11$decil[which(base2017_11$obs<=(filas2017_11/10))]<-1
base2017_11$decil[which(base2017_11$obs>filas2017_11/10&base2017_11$obs<=filas2017_11/10*2)]<-2
base2017_11$decil[which(base2017_11$obs>filas2017_11/10*2&base2017_11$obs<=filas2017_11/10*3)]<-3
base2017_11$decil[which(base2017_11$obs>filas2017_11/10*3&base2017_11$obs<=filas2017_11/10*4)]<-4
base2017_11$decil[which(base2017_11$obs>filas2017_11/10*4&base2017_11$obs<=filas2017_11/10*5)]<-5
base2017_11$decil[which(base2017_11$obs>filas2017_11/10*5&base2017_11$obs<=filas2017_11/10*6)]<-6
base2017_11$decil[which(base2017_11$obs>filas2017_11/10*6&base2017_11$obs<=filas2017_11/10*7)]<-7
base2017_11$decil[which(base2017_11$obs>filas2017_11/10*7&base2017_11$obs<=filas2017_11/10*8)]<-8
base2017_11$decil[which(base2017_11$obs>filas2017_11/10*8&base2017_11$obs<=filas2017_11/10*9)]<-9
base2017_11$decil[which(base2017_11$obs>=filas2017_11/10*9)]<-10
table(base2017_11$decil)
table(is.na(base2017_11$decil))
suma_ing_11<-sum(base2017_11$INGLABO)
suma_pob_11<-sum(base2017_11$contador)
limitesup_11<-mean(base2017_11$INGLABO)+1.96*sd(base2017_11$INGLABO)
limiteinf_11<-mean(base2017_11$INGLABO)-1.96*sd(base2017_11$INGLABO)
base2017_11$atipico<-0
base2017_11$atipico[which(base2017_11$INGLABO>=limitesup_11)]<-1
table(base2017_11$atipico)
base2017_11$por_ing<-base2017_11$INGLABO/suma_ing_11
base2017_11$por_pob<-base2017_11$contador/suma_pob_11
resumen_curva2017_11<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_11,FUN=sum)
resumen_curva2017_11$AREA<-"11"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 13

base2017_13<-base2017[which(base2017$AREA==13),]
base2017_13<-arrange(base2017_13,INGLABO)
filas2017_13<-nrow(base2017_13)
base2017_13$obs<-c(1:filas2017_13)
base2017_13$decil<-0
base2017_13$decil[which(base2017_13$obs<=(filas2017_13/10))]<-1
base2017_13$decil[which(base2017_13$obs>filas2017_13/10&base2017_13$obs<=filas2017_13/10*2)]<-2
base2017_13$decil[which(base2017_13$obs>filas2017_13/10*2&base2017_13$obs<=filas2017_13/10*3)]<-3
base2017_13$decil[which(base2017_13$obs>filas2017_13/10*3&base2017_13$obs<=filas2017_13/10*4)]<-4
base2017_13$decil[which(base2017_13$obs>filas2017_13/10*4&base2017_13$obs<=filas2017_13/10*5)]<-5
base2017_13$decil[which(base2017_13$obs>filas2017_13/10*5&base2017_13$obs<=filas2017_13/10*6)]<-6
base2017_13$decil[which(base2017_13$obs>filas2017_13/10*6&base2017_13$obs<=filas2017_13/10*7)]<-7
base2017_13$decil[which(base2017_13$obs>filas2017_13/10*7&base2017_13$obs<=filas2017_13/10*8)]<-8
base2017_13$decil[which(base2017_13$obs>filas2017_13/10*8&base2017_13$obs<=filas2017_13/10*9)]<-9
base2017_13$decil[which(base2017_13$obs>=filas2017_13/10*9)]<-10
table(base2017_13$decil)
table(is.na(base2017_13$decil))
suma_ing_13<-sum(base2017_13$INGLABO)
suma_pob_13<-sum(base2017_13$contador)
limitesup_13<-mean(base2017_13$INGLABO)+1.96*sd(base2017_13$INGLABO)
limiteinf_13<-mean(base2017_13$INGLABO)-1.96*sd(base2017_13$INGLABO)
base2017_13$atipico<-0
base2017_13$atipico[which(base2017_13$INGLABO>=limitesup_13)]<-1
table(base2017_13$atipico)
base2017_13$por_ing<-base2017_13$INGLABO/suma_ing_13
base2017_13$por_pob<-base2017_13$contador/suma_pob_13
resumen_curva2017_13<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_13,FUN=sum)
resumen_curva2017_13$AREA<-"13"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######AREA 17

base2017_17<-base2017[which(base2017$AREA==17),]
base2017_17<-arrange(base2017_17,INGLABO)
filas2017_17<-nrow(base2017_17)
base2017_17$obs<-c(1:filas2017_17)
base2017_17$decil<-0
base2017_17$decil[which(base2017_17$obs<=(filas2017_17/10))]<-1
base2017_17$decil[which(base2017_17$obs>filas2017_17/10&base2017_17$obs<=filas2017_17/10*2)]<-2
base2017_17$decil[which(base2017_17$obs>filas2017_17/10*2&base2017_17$obs<=filas2017_17/10*3)]<-3
base2017_17$decil[which(base2017_17$obs>filas2017_17/10*3&base2017_17$obs<=filas2017_17/10*4)]<-4
base2017_17$decil[which(base2017_17$obs>filas2017_17/10*4&base2017_17$obs<=filas2017_17/10*5)]<-5
base2017_17$decil[which(base2017_17$obs>filas2017_17/10*5&base2017_17$obs<=filas2017_17/10*6)]<-6
base2017_17$decil[which(base2017_17$obs>filas2017_17/10*6&base2017_17$obs<=filas2017_17/10*7)]<-7
base2017_17$decil[which(base2017_17$obs>filas2017_17/10*7&base2017_17$obs<=filas2017_17/10*8)]<-8
base2017_17$decil[which(base2017_17$obs>filas2017_17/10*8&base2017_17$obs<=filas2017_17/10*9)]<-9
base2017_17$decil[which(base2017_17$obs>=filas2017_17/10*9)]<-10
table(base2017_17$decil)
table(is.na(base2017_17$decil))
suma_ing_17<-sum(base2017_17$INGLABO)
suma_pob_17<-sum(base2017_17$contador)
limitesup_17<-mean(base2017_17$INGLABO)+1.96*sd(base2017_17$INGLABO)
limiteinf_17<-mean(base2017_17$INGLABO)-1.96*sd(base2017_17$INGLABO)
base2017_17$atipico<-0
base2017_17$atipico[which(base2017_17$INGLABO>=limitesup_17)]<-1
table(base2017_17$atipico)
base2017_17$por_ing<-base2017_17$INGLABO/suma_ing_17
base2017_17$por_pob<-base2017_17$contador/suma_pob_17
resumen_curva2017_17<-doBy::summaryBy(por_ing+por_pob~decil,data=base2017_17,FUN=sum)
resumen_curva2017_17$AREA<-"17"

##############################################################################################################
##############################################################################################################
##############################################################################################################
######consolidación de archivos

list.files

curvalorenz2017_depar<-rbind(resumen_curva2017_11,resumen_curva2017_13,resumen_curva2017_17,
      resumen_curva2017_23,resumen_curva2017_5,resumen_curva2017_50,resumen_curva2017_52,
      resumen_curva2017_54,resumen_curva2017_66,resumen_curva2017_68,    
      resumen_curva2017_73,resumen_curva2017_76,resumen_curva2017_8)

rm(resumen_curva2017_11,resumen_curva2017_13,resumen_curva2017_17,
   resumen_curva2017_23,resumen_curva2017_5,resumen_curva2017_50,resumen_curva2017_52,
   resumen_curva2017_54,resumen_curva2017_66,resumen_curva2017_68,    
   resumen_curva2017_73,resumen_curva2017_76,resumen_curva2017_8)

write.csv(curvalorenz2017_depar,file="curvalorenz2017_depar_primera.csv")
