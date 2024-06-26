# UNIVERSIDAD EXTERNADO DE COLOMBIA
# MACROECONOMETR�A, 2020-1
#
# Modelos VEC en R
# Carlos Vel�squez Vega, Federico Medina Cifuentes

#-----------------------------------------------------------------
# EJERCICIO 1
# RELACI�N ENTRE EL CONSUMO, EL INGRESO DISPONIBLE Y LA RIQUEZA
#-----------------------------------------------------------------

# Importar archivo de Excel "EjerciciosVEC"
library(readxl)
Ejemplo1 = read_excel("EjerciciosVEC.xlsx",sheet = "Ejemplo 1")
attach(Ejemplo1)

Datos = ts(cbind(CONSUMO,INGRESO,RIQUEZA),start = 1945,frequency = 4)
plot(Datos)
plot(log(Datos))

# Las variables tienen tendencia estoc�stica, luego deben tener ra�z unitaria
PP.test(x = log(CONSUMO)) # la funci�n PP.test no funciona para vectores con missings (NA's)
library(aTSA) # se utiliza la funci�n pp.test de la librer�a aTSA
pp.test(x = log(CONSUMO))
pp.test(x = log(INGRESO))
pp.test(x = log(RIQUEZA))
# se corrobora que tienen tendencias estoc�sticas

# Se estima un VAR en niveles (primero se aplican logaritmos)
log_Datos = log(Datos)
(log_Datos)
# Se elige el periodo de muestra (1960Q1-2007Q4)
periodo.muestra = time(Datos)>=1960 & time(Datos)<2008
log_Datos = ts(log(Datos[periodo.muestra,]),start = 1960,frequency = 4)
plot(log_Datos)
library(vars)
print(VARselect(log_Datos,type = "const"),digits = 3)
# Los criterios FPE, AIC y HQ se�alan que el # de rezagos �ptimo es 2
# por tanto, el n�mero de rezagos del VEC ser�a 1

# Prueba de cointegraci�n: Engel y Granger
modelo.ols = lm(log(CONSUMO)~log(INGRESO)+log(RIQUEZA))
summary(modelo.ols)
residuos.ols = ts(resid(modelo.ols)[-(1:4)],start = c(1951,4),frequency = 4)
plot(residuos.ols,type="l",main="Residuos MCO");abline(h=0)
pp.test(residuos.ols) # se rechaza hip. de ra�z unitaria, hay cointegraci�n

# Prueba de cointegraci�n: Johansen
# En R existen dos funciones alternativas para realizar este procedimiento:
# (1) ca.jo del paquete urca y (2) rank.test del paquete tsDyn. Sus diferencias son:
# - rank.test muestra p-values, ca.jo solo valores cr�ticos
# - rank.test permite 5 especificaciones diferentes de los t�rminos deterministicos, ca.jo solo 3
    #1.include="both". Unrestricted constant and trend
    #2.include="const". Unrestricted constant and restricted trend
    #3.include="const" & LRinclude="trend". Unrestricted constant and no trend
    #4.LRinclude="const". Restricted constant and no trend
    #5.include="none". No constant nor trend
# - ca.jo permite regresores ex�genos estacionales, lo que no est� disponible en rank.test
# - El rezago se especifica de forma diferente: K en ca.jo corresponde a lag+1 en rank.test
# ejemplo de c�mo arrojar�an los mismos resultados

library(urca)
summary(ca.jo(x = log_Datos,K = 2,ecdet = "const",type = "trace",spec = "longrun"))
library(tsDyn)
summary(rank.test(vecm = VECM(data = log_Datos,lag = 1,r = 1,LRinclude="const",estim = "ML")))
# esta especificaci�n (con constante restringida en la relaci�n de coint.) sugiere 2 relaciones de largo plazo

# Se considerar� un modelo con constante no restringida en la parte VAR
# include="const" en VECM, o ecdet="none" en ca.jo

VEC1 = VECM(data = log_Datos,lag = 1,r = 1,include="const",estim = "ML") #tsDyn
summary(rank.test(VEC1)) # Johansen sugiere 1 relaci�n de cointegraci�n (sin constante)
summary(VEC1)

VEC2 = ca.jo(x = log_Datos,K = 2,ecdet = "none",type = "trace",spec = "longrun") #urca
summary(VEC2)
cajorls(VEC2) # mostrar coeficientes parte VAR
summary(cajorls(VEC2,r = 1)$rlm)

# La ecuaci�n de LP muestra que: 
#  por un incremento de 1% del ingreso, el consumo aumenta en 0.8% 
#  por un incremento de 1% en la riqueza, el consumo aumenta en 1.4%

# Pertenencia a la relaci�n de largo plazo:
coefB(VEC2) #esta es la relaci�n cointegraci�n
# Se estima un var restringido, es una prueba sobre los coeficientes "B" del VEC (A , B) 
H0.B1 = matrix(c(1,0,0,0,0,1),ncol = 2);H0.B1 # restricci�n para el ingreso
summary(blrtest(z = VEC2,H=H0.B1,r = 1))
H0.B2 = matrix(c(1,0,0,0,1,0),ncol = 2);H0.B2 # restricci�n para la riqueza
summary(blrtest(z = VEC2,H=H0.B2,r = 1))
  # en ambos casos se rechaza la H0, ambas variables pertenecen a la relaci�n de L.P.

# VEC-X:
# se a�ade una variable Dummy (choque estructural 1960-1975)
SB1975 = (ifelse(time(log_Datos)<1976,1,0))
VEC3 = ca.jo(x = log_Datos,K = 2,ecdet = "none",type = "trace",spec = "longrun",dumvar = SB1975)
summary(VEC3)
cajorls(VEC3)
summary(cajorls(VEC3)$rlm)
# puede que ese choque haya afectado el ingreso y la riqueza positivamente

# Prueba de exogeneidad d�bil:
coefA(VEC3) # Estos son los coeficientes de correcci�n de errores
# la funci�n estima un VAR restringido
(H0.A1 = matrix(c(0,0, 1,0, 0,1),ncol = 2,byrow = T)) # consumo
summary(alrtest(z = VEC3,A=H0.A1,r=1))
(H0.A2 = matrix(c(1,0, 0,0, 0,1),ncol = 2,byrow = T))
summary(alrtest(z = VEC3,A=H0.A2,r=1))
(H0.A3 = matrix(c(1,0, 0,1, 0,0),ncol = 2,byrow = T))
summary(alrtest(z = VEC3,A=H0.A3,r=1))

# Funci�n de impulso-respuesta
# el modelo VEC debe expresarse como un VAR
irf(vec2var(VEC3),response = "CONSUMO",boot = T)
plot(irf(vec2var(VEC3),response = "CONSUMO",boot = T))

# Descomposici�n de varianza del error de pron�stico
fevd(x = vec2var(VEC3),n.ahead = 20)$CONSUMO

# Pron�sticos con el VEC-X
# ya que tiene una variable ex�gena, es necesario incluir sus valores "futuros"
pronostico=predict(vec2var(VEC3),n.ahead = 4,dumvar = cbind(exo1=rep(0,4)))
pronostico
plot(pronostico)

# Regresi�n Cointegrada:
library(cointReg)
Y=log(CONSUMO[61:252])
X=cbind(INGRESO=log(INGRESO[61:252]),RIQUEZA=log(RIQUEZA[61:252]))
# Fully Modified Least Squares (FMOLS)
cointReg(method = "FM",x = X,y = Y,deter=rep(1,192))
# Dynamic Least Squares (DOLS)
cointReg(method = "D",x = X,y = Y,deter=rep(1,192))

# Pruebas de cointegraci�n:
# se recalca que no se hacen sobre los modelos, sino sobre los datos
# Engle-Granger
coint.test(y = Y,X = X)
# Phillpis-Oularis
summary(ca.po(z = log_Datos,demean = "constant"))

#----------------------------------------------------------------------------

# EJERCICIO 2
# HIP�TESIS DE FISHER Y TASA DE INTER�S REAL
#----------------------------------------------------------------------------

# Leer hoja "Ejemplo2"
Ejemplo2 = read_excel("EjerciciosVEC.xlsx",sheet = "Ejemplo 2")
View(Ejemplo2)
attach(Ejemplo2)

# Se crea matriz Y con las variables end�genas
# informaci�n de ene-2000 a sep-2017
Y = ts(cbind(TIB,INF),start = c(2000,1),freq=12)
plot(Y)

# Se recomienda utilizar una mayor cantidad de rezagos para el VAR (36)
VAR1=VAR(y = Y,p = 36,type = "none") # se estima sin intercepto
serial.test(x = VAR1,lags.pt = 39) # es un modelo que no cumple con el supuesto de RB

# Prueba de cointegraci�n de Johansen:
# con constante en la relaci�n de cointegraci�n, y dummies estacionales en la parte VAR
VEC1 = (ca.jo(x = Y,K = 36,ecdet = "const",type = "trace",season = 12,spec = "transitory"))
summary(VEC1)
# un incremento en inflaci�n de 1% lleva a que la tasa de inter�s aumente en 1.3%

# Pertenencia a la relaci�n de largo plazo de la inflaci�n:
coefB(VEC1) #esta es la relaci�n cointegraci�n
H0.B1 = matrix(c(1,0,0, 0,0,1),ncol = 2);H0.B1 # restricci�n
summary(blrtest(z = VEC1,H=H0.B1,r = 1))

# Validar si se cumple la hip�tesis de Fisher en Colombia:

  # comprobar que el coeficiente de inflaci�n en la ecuaci�n de cointegraci�n 
  # no es diferente de 1 en t�rminos estad�sticos
coefB(VEC1) #esta es la relaci�n cointegraci�n
H0.B2 = matrix(c(1,-1,0, 0,0,1),ncol = 2);H0.B2 # restricci�n
summary(blrtest(z = VEC1,H=H0.B2,r = 1))

  # probar si la inflaci�n es d�bil ex�gena
coefA(VEC1)
H0.A1 = matrix(c(1,0),ncol = 1);H0.A1 # restricci�n
summary(alrtest(z = VEC1,A=H0.A1,r = 1))

# Impulso respuesta
plot(irf(vec2var(VEC1),n.ahead = 50,impulse = "INF",response = "TIB"))
# Se muestra que la tasa de inter�s debe compensar un incremento de inflaci�n


