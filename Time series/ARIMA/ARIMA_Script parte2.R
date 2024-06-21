# Extracción de componentes de la serie en la práctica
# Tendencia y ciclo del IPC
library(readxl)
datosipc = read_excel(file.choose(),sheet = 2)
IPC = ts(datosipc$IPC,start = c(2000,1),frequency = 12)
plot(IPC)

# filtro de Hodrick y Prescott
library(mFilter)
filt1 = hpfilter(x = IPC,freq = 14400,type = "lambda")
plot(filt1)
ts.plot(diff(log(IPC),12),diff(log(filt1$trend),12),col=1:2,
        main="Variación porcentual anual del IPC")

# Filtro Baxter-King (simétrico)
plot(bkfilter(x = IPC,pl = 12,pu = 24,nfix = 12))

# Filtro Christiano-Fitzgerald (asimétrico)
plot(cffilter(x = IPC,pl = 12,pu = 24,root = T))

#-----------------------------------------------------
# Comparación de promedios, medianas y varianzas en la práctica
library(hexView)

#1.Diferencia de medias de la tasa de desempleo nacional y de 13 grandes ciudades
dat1 = readEViews(file.choose())
u.13ciud = ts(dat1$X_13_CIUDADES,start = c(2001,1),frequency = 12)
u.tnal = ts(dat1$NACIONAL,start = c(2001,1),frequency = 12)
ts.plot(u.tnal,u.13ciud,col=1:2)

# Prueba paramétrica t de diferencia de medias
t.test(x = u.tnal,y = u.13ciud)
t.test(x = u.tnal,y = u.13ciud,var.equal = F)  # ajuste por varianzas desiguales (Welch)

#2. Prueba de diferencia de medianas
# Diferencia de medianas del PIB financiero de Colombia y el Huila
dat2=readEViews(file.choose())
COL_fin=ts(dat2$COL_FINANCIERO,start=2001)
HUILA_fin=ts(dat2$HUILA_FINANCIERO,start=2001)
ts.plot(COL_fin,HUILA_fin,col=1:2)
median(COL_fin)
median(HUILA_fin)
# Test Wilcoxon/Mann-Whitney
wilcox.test(x = COL_fin,y = HUILA_fin)

#3. Prueba de diferencia de varianzas
var(u.tnal)
var(u.13ciud)
var.test(x = u.tnal,y = u.13ciud)

#--------------------------------------------------
# Prueba de estacionalidad
#La tasa de interés del consumo y su comportamiento al comienzo del año
library(readxl)
datos_cons = read_excel(file.choose())
consumo = ts(datos_cons$CONSUMO,start = c(2002,5),frequency = 12)
plot(consumo)

# dos modelos ARIMA

# Modelo 1:
# AR(1,2,3,4,10,12) MA(1,6) SMA(12) constante y dummies mensuales (excluyendo enero)

# Crar matriz de Dummies mensuales
meses=matrix(nrow = 188,ncol = 12)
colnames(meses)=months(datos_cons$fecha)[9:20]
for(i in 1:12){
  meses[,i]=ifelse(months(datos_cons$fecha)[2:189]==months(datos_cons$fecha)[9:20][i],yes = 1,no = 0)
}
head(meses)

mod1=arima(x = diff(log(consumo)),order = c(12,0,6),seasonal = c(0,0,1),xreg = meses[,-1],
      fixed = c(rep(NA,4),rep(0,5),NA,0,NA,
                NA,rep(0,4),NA,
                NA,
                NA,
                rep(NA,11)),
      method = "ML")
library(lmtest)
coeftest(mod1)

# Modelo 2:
# AR(1,2,3,4,10,12) MA(1,6) SMA(12) con dummies mensuales y sin constante
mod2=arima(x = diff(log(consumo)),order = c(12,0,6),seasonal = c(0,0,1),xreg = meses,
           include.mean = F,
           fixed = c(rep(NA,4),rep(0,5),NA,0,NA,
                     NA,rep(0,4),NA,
                     NA,
                     rep(NA,12)),
           method = "ML")
coeftest(mod2)
# se prueba la existencia de estacionalidad

# Método X-12
library(seasonal)
plot(decompose(consumo,type = "multiplicative"))

library(x12)
pruebax12=x12(consumo)
summary(pruebax12)
plot(pruebax12)

s <- new("x12Single", ts = consumo, tsName = "cons")
s = x12(s)
summary(s)
plotSeasFac(s)
# The SI Ratio is the ratio of the original series to the estimated trend
plot(s@x12Output,sa=TRUE,original=T)

# otra alternativa es la descomposición utilizando media móvil 
plot(decompose(x = consumo,type = "multiplicative"))
