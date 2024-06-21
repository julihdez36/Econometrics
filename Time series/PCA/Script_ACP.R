# UNIVERSIDAD EXTERNADO DE COLOMBIA
# MACROECONOMETRÍA, 2020-1
#
# Análisis de Componentes Principales en R
# Carlos Velásquez Vega, Federico Medina Cifuentes

#--------------------------------------------------------
# EJERCICIO 1
# MOVIMIENTOS DE LA CURVA DE RENDIMIENTOS
#--------------------------------------------------------

# Importar archivo de Excel "Curva_rendimientos"
library(readxl)
datos = read_excel(file.choose())
# Crear matriz de datos como serie de tiempo con xts
library(xts)
tasas = xts(x = datos[,-1],order.by = datos$Fecha)
head(tasas)

# Gráfico apilado con ggplot2
library(ggplot2)
autoplot(tasas,facets = NULL)

# Múltiples gráficos en una sola ventana
x11() # x11 permite crear un panel grande
par(mfrow=c(4,2))
par(mar=c(0,0,0,0))
for (j in 1:8) {
  p=plot(tasas[,j],main = names(tasas)[j]) 
  print(p)
}

# Matriz de Correlaciones
cor(tasas)
library(corrplot)
par(mfrow=c(1,1))
par(mar=c(2,2,2,2))
corrplot(corr = cor(tasas),method = "color",addCoef.col = 1)
# La correlación cambia a través del tiempo, 
# ejemplo: a correlación entre los títulos de la parte corta es alta

# Análisis de Componentes Principales (ACP)

# Dos funciones disponibles en R: prcomp y princomp, mismos resultados
# 1. Argumentos de prcomp():
#   x: matriz numérica o data frame
#   scale: valor lógico, indica si las variables deben estandarizarse
pca1=prcomp(tasas,scale. = TRUE)
summary(pca1)

# 2. Argumentos de princomp():
#   x: matriz numérica o data frame
#   cor: valor lógico que indica si las variables se estandarizan utilizando la matriz de correlación
#   fix_sign: lógico, si es TRUE los signos se eligen de manera que el primer elemento de cada factor es no negativo
pca2=princomp(tasas,cor = TRUE,fix_sign = TRUE)
summary(pca2)

#Cargas Factoriales
# la única diferencia es el signo de los coeficientes
pca1$rotation[,1:3]
pca2$loadings[,1:3]

#Gráfico de valores propios
library(factoextra)
library(ggpubr)

fviz_eig(pca2,choice = "eigenvalue")

# Gráfico biplot: carga de cada variable en un plano factorial
fviz_pca_var(pca2,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)     # Evitar texto sobrepuesto

# Extraer las variables resultantes o factores latentes (scores)
Componentes = xts(pca2$scores[,1:3],order.by = datos$Fecha)
head(Componentes)
cor(Componentes)
plot(Componentes)

#-----------------------------------------------------------------------
# EJERCICIO 2
# BIENES PÚBLICOS E INDICADORES DE DESAROLLO
#--------------------------------------------------------------

# Importar archivo de Excel "ACP Bienes publicos"
library(readxl)
datos_bienpub = read_excel(file.choose(),sheet = "estandarizadas")
# Se crea la matriz solamente con las variables para el análisis 
# se excluyen las columnas 1 y 2, y se eliminan entradas con datos omitidos
datos = as.matrix.data.frame(na.omit(datos_bienpub[,-(1:2)]))
head(datos)

# Análisis de CP
pca = princomp(x = datos,cor = T,scores = T,fix_sign = T)
# Resumen
summary(pca)
# Cargas factoriales
pca$loadings[,1:4]

# Prueba KMO (Kaiser-Meyer-Olkin) 
library(psych)
KMO(datos) # valor de 0,73: es adecuado realizar el análisis

# Prueba de esfericidad de Bartlett
cortest.bartlett(R = cor(datos),n = 337)
# P-valor cercano a cero, la técnica de componentes principales es pertinente
