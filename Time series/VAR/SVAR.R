library(hexView)
library(tidyverse)
library(dplyr)
library(tidyr)
library(vars)
library(svars)

# Importar datos
datos = readEViews(file.choose())

datos = datos %>% dplyr::select(Date,NACIONAL,PIB)

# La muestra va hasta 2017, se eliminan observaciones desp�es de ese a�o
datos = datos[-(44:46),]

pib=ts(datos$PIB,start = 1975)
td=ts(datos$NACIONAL,start = 1975)

dlpib=diff(log(pib))
plot(dlpib)

# Dummy de crisis: 1 para los a�os entre 1997-2003, 0 en otro caso
dum_crisis=ifelse(time(td)>=1997&time(td)<=2003,1,0)
td_nueva=resid(lm(td~dum_crisis)) # regresi�n de la TD en funci�n de dummy de crisis
td_nueva=ts(td_nueva,start = 1975)
plot(td_nueva)

Y1 = na.omit(cbind(dlpib,td_nueva=td_nueva[-1]))

# Dummy 1999: 1 para a�o 1999, 0 en otro caso
dum_99=ifelse(time(td)==1999,1,0)[-1]
VARselect(y = Y1,exogen = dum_99,type = "const")
# los criterios sugieren VAR 1

# Estimaci�n VAR en forma reducida
var1=VAR(y = Y1,exogen = cbind(dum99=dum_99),type = "const")
summary(var1)

# Pruebas autocorrelaci�n
LMBreush.var(modelo = var1,rezago.max = 10)
Portmanteau.var(modelo = var1,rezago.max = 10)
# Ambas pruebas apuntan a que los errores son ruido blanco (p valores mayores a 0.05)

# Estimaci�n SVAR, restricciones sobre matriz de imp. de largo plazo
svar1=BQ(var1)
svar1 # resultados generales de la estimaci�n
summary(svar1) # resumen

svar1$A # matriz A  (es diagonal, por c�mo se defini� el SVAR)
svar1$B # matriz B (matriz de impacto contempor�neo)
svar1$LRIM # matriz de impacto de largo plazo


# Impulsos respuesta
plot(irf(svar1,response = "dlpib"))
plot(irf(svar1,response = "td_nueva"))


# Impulsos respuesta acumulados
plot(irf(svar1,response = "dlpib",cumulative = T))
plot(irf(svar1,response = "td_nueva",cumulative = T))

# Descomposici�n de varianza
fevd(svar1)

# Descomposici�n hist�rica
?hd
BQ
hd(svar1,series = 1)

# Causalidad de Granger
causality(var1,cause = "td_nueva")$Granger
causality(var1,cause = "dlpib")$Granger

# Derivar choques de oferta y demanda

residuals(svar1)
plot(ts(residuals(var1),end = 2017))
