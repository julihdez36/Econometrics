# Statistical programming on the R platform
# Universidad Externado de Colombia
# Faculty of Economics, Specialty in Econometrics
# Name: Zahir Llerena
# CC: 101984752
# Email: zahir.llerena@gmail.com, zahir.llerena@icloud.com
# Statistics, Mathematics & Physics
# Exercises in class in order to strengthen skills concerning programming


# Introduction -----------------------------------------------------------------

R.version

rm(list = ls())

setwd("G:\\Mi unidad\\R_Work\\Examples_R")

getwd()

savehistory(file = "save_3")
#loadhistory(file = "save_3")

#--------------------------------------------------------------------------------

# Start

options(prompt = "Zahir>", continue = " + ")
options(repos = c(CRAN = "http://cran.rstudio.com"))

update.packages()


# Files in current directory

list.files(path = ".")

dir(path = "G:\\Mi unidad\\R_Work\\Examples_R")


# Go to the folder set as the main path

# First step, invoke the database

xfun::session_info()

install.packages("AER", dep = T) 
library(AER)
packageVersion("AER")

# options(digits = 5)

data("CPS1985", package = "AER"); CPS1985

help(CPS1985)

View(CPS1985)

head(CPS1985); tail(CPS1985)
names(CPS1985); colnames(CPS1985)
class(CPS1985) 
mode(CPS1985); dim(CPS1985)

str(CPS1985)

library(DescTools)
Abstract(CPS1985)

library(tidyverse)
dplyr::glimpse(CPS1985)  # glimpse lives in the dplyr package


object.size(CPS1985)
complete.cases(CPS1985)
na.omit(CPS1985)

# Another option is

install.packages("pryr")

library(pryr)

pryr::object_size(CPS1985)


# Edition 

newCPS1985 <- edit(CPS1985)

data1985 <- fix(CPS1985)

fix(var)

# Another way to edit

install.packages("DataEditR", dep = TRUE)
library(DataEditR)

data_edit(CPS1985)

data_edit(CPS1985, viewer = FALSE)

cps1985_edit <- data_edit(CPS1985,
                          read_fun = "read.csv",
                          read_args = list(header = T))

?data_edit



if (!require(DT)) install.packages("DT") 
library(DT)


datatable(CPS1985)

datatable(head(CPS1985), rownames = FALSE)  # no row names

datatable(head(CPS1985), rownames = head(LETTERS))

datatable(CPS1985, class = "cell-border stripe")

datatable(head(CPS1985), class = "cell-border stripe")

DT::datatable(head(CPS1985), editable = "cell")


# Second step ----- How can we use the subscripts?

CPS1985[3,5]; CPS1985[14:19,7]; CPS1985[1:5,2:3]
CPS1985[3, ]; CPS1985[ ,3]; CPS1985[ ,c(1,5)] 

class(CPS1985[3,]); class(CPS1985[,3])

# Column vector 

CPS1985$wage
CPS1985[["wage"]]
CPS1985[[1]]
CPS1985[1]

identical(CPS1985$wage, CPS1985[,1])
identical(CPS1985$wage, CPS1985[, 1], CPS1985[[1]])


all.equal(CPS1985$wage, CPS1985[,1], 2)
all.equal(CPS1985[1], CPS1985["wage"], 2)

library(dplyr)
dplyr::near(CPS1985$wage, CPS1985[, 1])


## How can we make the database columns available?

with(CPS1985, wage)   # Invoking the attach() function is not required


# An alternative approach is to use the with() function. You can write the previous example as

with(CPS1985, {
  print(summary(wage))
  plot(experience, wage)
  plot(wage ~ sector)
})


# In this case, the statements within the {} brackets are evaluated with reference to the
# CPS1985 data frame. You don't have to worry about name conflicts.

# The limitation of the with() function is that assignments exist only within the
# function brackets. Consider the following:

with(CPS1985, {
  stats <- summary(wage)
  stats
})

stats

# If you need to create objects that will exist outside of the with() construct, use the
# special assignment operator <<- instead of the standard one (<-).

with(CPS1985, {
  nokeepstats <- summary(wage)
  keepstats <<- summary(wage)
})


nokeepstats
keepstats

#--Making variables available by their names-------------------------------------------


attach(CPS1985)             # detach(CPS1985)

wage; age; sector


CPS1985[order(education), ]
CPS1985[rev(order(education)), ]

CPS1985[order(region, education), ]
CPS1985[order(region, wage,education), ]

CPS1985[order(region,education), c(4,3,1)]
CPS1985[order(region, education), c("wage", "sector", "age", "union")]


# Selecting Rows from the Dataframe at Random

CPS1985[sample(1:20,8), ]

str(CPS1985)

table(occupation)

wage[occupation == "worker"]
wage[occupation == "technical"]


split(wage, occupation)
split(wage, occupation)$worker
split(wage, occupation)[1]
split(wage, occupation)["worker"]
sapply(split(wage, occupation), mean)

split(wage, sector)
tapply(wage, sector, mean)
tapply(wage, sector, mean)[[1]]

# Using Logical Conditions to Select Rows from the Dataframe

occupation == "worker"

CPS1985[occupation == "worker", ]
CPS1985[occupation == "worker", 1]
wage[occupation == "worker"]


data <- CPS1985[wage > median(wage) & experience < 10.1, ]
data

CPS1985[ ,sapply(CPS1985, is.numeric)]         # I want to get all the numerical columns

CPS1985[ ,sapply(CPS1985, is.factor)]


subset(CPS1985, wage > median(wage))

tapply(wage, occupation, mean)
tapply(wage, occupation, mean)["services"]
tapply(wage, occupation, mean)[3]
tapply(wage, occupation, mean)[[3]]


subset(CPS1985, wage > tapply(wage, occupation, mean)[[1]])

names(CPS1985)

subset(CPS1985, wage > 8.4, select = c(gender, occupation, experience))

subset(CPS1985, subset = occupation %in% c("worker","management"),
       select = c(education, gender, wage, occupation))

grep("w", names(CPS1985))
grep("ge", names(CPS1985))

CPS1985[ ,grep("ge", names(CPS1985))]


CPS1985[-(6:250), ]
CPS1985[-(7:25), ]

CPS1985[!(region == "south"), ]
CPS1985[-which(region == "south"), ]
CPS1985[!region == "south", ]
CPS1985[region == "south", ]

#### --------- Descriptive partial summaries -------------------

library(car) 
car::some(CPS1985, 13)

summary(CPS1985, digits = 3)
str(CPS1985)


# Descriptive statistics (DescTools package)

library(DescTools)
Abstract(CPS1985)
Desc(CPS1985)

# Descriptive statistics (psych package)

library(psych)
psych::describe(CPS1985)

psych::describe(wage) 
psych::describe(wage)[[7]]

psych::describe(CPS1985[ ,sapply(CPS1985, is.numeric)])

# Descriptive statistics (Hmisc package)

library(Hmisc)
Hmisc::describe(CPS1985)

Hmisc::describe(CPS1985)$wage
Hmisc::describe(CPS1985)[1]
Hmisc::describe(CPS1985)["wage"]

Hmisc::describe(CPS1985)[8]
Hmisc::describe(CPS1985)[[8]]
Hmisc::describe(CPS1985)["occupation"]

# Descriptive statistics (pastecs package)

library(pastecs)
pastecs::stat.desc(CPS1985)

stat.desc(CPS1985)$wage
stat.desc(wage)
stat.desc(wage)[14]

CPS1985[ ,sapply(CPS1985, is.numeric)] |> head()
stat.desc(CPS1985[ ,sapply(CPS1985, is.numeric)]) |> round(3)

tapply(wage, occupation, mean)

stat.desc(wage) |> round(3)

by(wage, occupation, pastecs::stat.desc)
by(wage, occupation, psych::describe)


tapply(wage, occupation, pastecs::stat.desc)


#### -----------------------  Color --------------------------------------------

# You can specify colors in R by index, name, hexadecimal, RGB, or HSV.

# col = 1, col = "white", col = "#FFFFFF", colors()[1], col = rgb(1,1,1), and col = hsv(0,0,1)

# The function colors() returns all available color names

colors()

barplot(1:10, col = "chocolate2")


# R also has a number of functions that can be used to create vectors of contiguous colors:

rainbow() 
heat.colors()
terrain.colors() 
topo.colors()

barplot(1:10, col = rainbow(10))
barplot(1:10, col = heat.colors(10))
barplot(1:10, col = terrain.colors(10))
barplot(1:10, col = topo.colors(10))


# There is also a colorRampPalette() function that allows us to create a color gradient.

barplot(1:10, col = colorRampPalette(c("blue", "red"))(10), axes = FALSE)

barplot(1:25, col = colorRampPalette(c("blue", "white", "red"))(25), axes = FALSE)

barplot(1:25, col =  colorRampPalette(c(rgb(255, 136, 0, maxColorValue = 255),  
              rgb(0, 94, 255, maxColorValue = 255)))(25), axes = FALSE)

### Palettes

library(RColorBrewer)
# To display all the color palettes in the package
display.brewer.all()

# View a single RColorBrewer palette by specifying its name
display.brewer.pal(n = 3, name = "Reds")
display.brewer.pal(n = 8, name = "Spectral")

# Hexadecimal color specification
brewer.pal(n = 3, name = "Reds")
brewer.pal(n = 8, name = "Dark2")


# Example
display.brewer.pal(n = 6, name = "Dark2")
barplot(1:10, col = brewer.pal(10, "Dark2"))
plot(wage ~ occupation, col = brewer.pal(6, "Dark2"))

# Another options 
library(wesanderson)
names(wes_palettes)

# The key R function in the package, for generating a vector of colors, is:
# wes_palette(name, n, type = c("discrete", "continuous"))

# Example
barplot(1:10, col = wes_palette("Zissou1", 10, type = "continuous"))
plot(wage ~ occupation, col = wes_palette("Zissou1", 6, type = "continuous"))

#-------------------- Applications ---------------------------------------------

# Graphical summaries of a database

CPS1985
attach(CPS1985)

pairs(~ wage + education + experience + ethnicity + region, col = "red")


library(RColorBrewer)
plot(CPS1985[ ,1:6], panel = panel.smooth, col = brewer.pal(3, "Set1"))


install.packages("gpairs")
library(gpairs)

gpairs(CPS1985)

gpairs(CPS1985[ ,1:6])
windows()
gpairs(CPS1985[ ,1:6], lower.pars = list(scatter = "corrgram"),
  upper.pars = list(conditional = "boxplot", scatter = "loess"), 
  scatter.pars = list(pch = 20))


library(car)

scatterplotMatrix(~ wage + education + experience + age, data = CPS1985, col = carPalette())
scatterplotMatrix(~ wage + education + experience + age | sector, data = CPS1985)

 #### Version with ggplot2 

library(tidyverse)

plot(CPS1985$experience, CPS1985$wage, col = "blue")

qplot(CPS1985$experience, CPS1985$wage)
qplot(CPS1985$experience, CPS1985$wage, color = CPS1985$gender)

qplot(experience, wage, data = CPS1985)

# Change the size of points according 

qplot(experience, wage, size = wage, data = CPS1985)

# Change point shapes by groups

qplot(experience, wage, size = wage, shape = gender, data = CPS1985)


# Add line

qplot(experience, wage, geom = c("point", "line"), data = CPS1985)

# Smoothing

qplot(experience, wage, geom = c("point", "smooth"), data = CPS1985)

qplot(experience, wage, geom = c("point", "smooth"), color = gender, data = CPS1985) 

qplot(experience, wage, geom = c("point", "smooth"), colour = sector, data = CPS1985)


qplot(x = experience, y = wage, geom = c("point", "smooth"), method = "lm", data = CPS1985)
qplot(x = experience, y = wage, geom = c("point", "smooth"),  data = CPS1985)

lm(CPS1985$wage ~ CPS1985$experience) |> summary()


# Scatter plot with texts.
# The argument label is used to specify the texts to be used for each points:

qplot(education, wage, label = rownames(CPS1985), geom = c("point", "text"), 
      hjust = 0, vjust = 0, data = CPS1985)

qplot(x = education, y = wage, alpha = I(0.2), data = CPS1985)


#### Graphical parameters

# You can customize many features of a graph (fonts, colors, axes, and labels) through
# options called graphical parameters.


par()                           # produces a list of the current graphical settings.
par(no.readonly = TRUE)         # produces a list of current graphical settings that can be modified.

opar <- par(no.readonly = TRUE) # We make a copy of the current configuration, "par(opar)" restores


# 

par(bg = "azure1", col.axis = "dodgerblue4",   
    col.main = "brown", col.lab = "navy", cex.lab = 1.2,
    font.main = 3, font.lab = 3, font = 4)

# --------- Bar chart associated with the categories ---------------


table(ethnicity)

par(mfrow = c(2,2))

barplot(table(ethnicity), col = rainbow(3))

barplot(table(region), col = heat.colors(2))

barplot(table(occupation), col = terrain.colors(6))

barplot(table(sector), col = topo.colors(3))

par(mfrow = c(1,1))

barplot(table(sector), col = c("yellow", "blue", "red"), border = "grey")
grid(NA, 10, lty = 3) # grid only in y-direction

title(main = "Diagrama de barras", sub = "Sector")

table(sector) 
table(sector)[1]

barplot(table(sector), col = 1:3, ylim = c(-0.5, 430), main = "Barplot")

legend(0.4, 120, paste("#", table(sector)[[1]]), cex = 0.8, box.col = 0)
legend(1.6, 45, paste("#", table(sector)[[2]]), cex = 0.8, box.col = 0)
legend(2.8, 430, paste("#", table(sector)[[3]]), cex = 0.8, box.col = 0)

# Another example

levels(CPS1985$ethnicity)

CPS1985$ethnicity <- factor(CPS1985$ethnicity, levels = levels(CPS1985$ethnicity),  
                              labels = c("Caucasico", "Hispano", "Otros"))

tabla1 <- table(ethnicity) |> sort()
tabla1

(round(100*prop.table(tabla1), 2) -> tabla2)

library(RColorBrewer)
display.brewer.all()
brewer.pal(n = 3, name = "Blues")


barplot(tabla1, border = "pink",
        col = brewer.pal(n = 3, name = "Blues"), 
        ylim = c(-0.5, 500), main = "Barplot",
        xlab = "Etnicidad", ylab = "Frecuencia")

# One click is necessary for each line

legend(locator(1), paste(tabla2[1], "%"), text.col = "blue", cex = 0.8, box.col = 0)
legend(locator(1), paste(tabla2[2], "%"), text.col = "blue", cex = 0.8, box.col = 0)
legend(locator(1), paste(tabla2[3], "%"), text.col = "blue", cex = 0.8, box.col = 0)

#### Version with ggplot2 

library(tidyverse)

qplot(x = sector, colour = sector, data = CPS1985)
qplot(x = sector, fill = sector, data = CPS1985)

qplot(sector, wage, geom = "jitter", alpha =  I(0.3), data = CPS1985)
qplot(wage, sector, geom = "jitter", alpha =  I(0.3), data = CPS1985)


# Bivariate tables

par(mfrow = c(1,1))

# Stacked barplot

library(RColorBrewer)
display.brewer.all()
brewer.pal(n = 6, name = "Pastel2")

counts <- table(occupation, sector); counts

100*prop.table(counts) |> round(4)

barplot(counts, main = "Stacked Bar Plot", xlab = "Sector", 
  ylab = "Frequency", border = "grey", col = brewer.pal(6, "Pastel2"))

levels(occupation)

legend(locator(1), levels(occupation),
       lty = 1, lwd = 3, col = brewer.pal(6, "Pastel2"), box.col = 0)



# Grouped barplot

library(RColorBrewer)
display.brewer.all()
brewer.pal(n = 6, name = "Pastel2")

barplot(counts, beside = TRUE, 
        xlab = "Sector", ylab = "Frequency", 
        ylim = c(0, 100), col = brewer.pal(6, "Pastel2"),  border = "grey", 
        legend.text = rownames(counts), args.legend = list(x = "topleft"))

title(main = list("Barplot: Sector and Occupation", cex = 1.2,
                  col = "brown", font = 4), sub = "Industria", font.sub = 3, col.sub = "blue")

par(mfrow = c(1,1))

# Circular Diagram

table(occupation)
is.factor(occupation)
nlevels(occupation)
levels(occupation)

sort(unique(occupation))

rownames(table(occupation))

100*prop.table(table(occupation)) |> round(4)
pie(table(occupation))

(nombre <- levels(occupation))

porcentaje <- 100*prop.table(table(occupation)); porcentaje
round(porcentaje, 2) -> porcentaje

etiquetas <- paste(nombre, "\n", " (", porcentaje, "%)", sep = "")
etiquetas

pie(table(occupation), labels = etiquetas, main = "Porcentaje del sector")


library(RColorBrewer)
display.brewer.all()
brewer.pal(n = 6, name = "Pastel2")

pie(table(occupation), labels = etiquetas, 
    col = brewer.pal(6, "Pastel2"), 
    main = "Porcentaje al sector")


pie(table(occupation), labels = etiquetas, col = terrain.colors(6))
pie(table(occupation), labels = etiquetas, col = heat.colors(6))


library(plotrix)

(tabla.labor <- table(occupation))
trabajos <- rownames(table(occupation)); trabajos
trabajos <- levels(occupation); trabajos

pie3D(tabla.labor, labels = trabajos, explode = 0.1, main = "Diagrama Circular 3D")


porcentaje <- 100*prop.table(table(occupation)); porcentaje
round(porcentaje, 2) -> porcentaje

etiquetas <- paste(nombre, "\n", " (", porcentaje, "%)", sep = "")
etiquetas

pie3D(tabla.labor, labels = etiquetas, 
      explode = 0.1, shade = 0.7, 
      labelcex = 0.8, labelcol = "brown",
      main = "Diagrama Circular 3D")



# fan plots

library(plotrix)

(tabla.labor <- sort(table(occupation)))
trabajos <- rownames(tabla.labor); trabajos

fan.plot(tabla.labor, labels = trabajos, main = "Fan Plot")

porcentaje <- 100*prop.table(tabla.labor); porcentaje
round(porcentaje, 2) -> porcentaje

etiquetas <- paste(trabajos, " (", porcentaje, "%)", sep = "")
etiquetas


fan.plot(tabla.labor, labels = trabajos, 
         col = RColorBrewer::brewer.pal(6, "Pastel2"), 
         main = "Fan Plot")


legend(locator(1), etiquetas,
       lty = 1, lwd =3, box.col = 0,
       col = RColorBrewer::brewer.pal(6, "Pastel2"))


fan.plot(tabla.labor, 
         col = RColorBrewer::brewer.pal(6, "Pastel2"),
         max.span = pi, ticks = 180, 
         labels = etiquetas, main = "Fan Plot")

# Pareto diagram

library(qcc)

tabla.labor <- table(occupation)
100*prop.table(tabla.labor) |> round(4) |> sort()

qcc::pareto.chart(tabla.labor)


# Tool of the library Destool

library(DescTools)

DescTools::Desc(CPS1985)

Desc(sector, plotit = TRUE)
Desc(occupation, plotit = TRUE)

plot(Desc(occupation), main = NULL, maxlablen = 6, type = "bar", 
     col = SetAlpha(hecru, 0.6), border = "red", xlim = c(0, 160), ecdf = TRUE)

plot(Desc(occupation), main = NULL, maxlablen = 6,
     type = "dot", col = hred, pch = 16, xlim = c(0, 200))

# Dichotomous variables 

Desc(gender, plotit = TRUE)
Desc(region, plotit = TRUE)

# Numeric Analysis

DescTools::PlotFdist(education, args.hist = list(type = "mass"))

PlotFdist(education, args.hist = list(type = "mass", pch = 21, col = horange,
  cex.pch = 2.5, col.pch = hred, lwd = 3, bg.pch = "white"),
  args.boxplot = NULL, args.ecdf = NA, main = "Probability mass function")

# Another Example

DescTools::Desc(wage, main = "Numeric Analysis - salary", plotit = TRUE)

DescTools::PlotFdist(wage, args.hist = list(type = "mass", pch = 21, col = horange,
  cex.pch = 1.2, col.pch = hred, lwd = 3, bg.pch = "white"),
  args.boxplot = NULL, args.ecdf = NA, main = "Probability mass function")

# Transformations can easily be entered in place.

Desc(1/wage, digits = 3, main = "")
title(expression(frac(1,x)))

#### Comparative bar chart

tabla.GO <- table(gender, occupation); tabla.GO
margin.table(tabla.GO, 1)
margin.table(tabla.GO, 2)


plot(gender ~ occupation, data = CPS1985, 
  main = "Genero por ocupaci?n", 
  border = "grey", col = c("pink2", "lightblue"))


plot(gender ~ occupation, data = CPS1985, 
  main = "Grafico de comparacion entre categoria", density = 65, 
  angle = 45, border = "grey", 
  col = terrain.colors(2))


tabla.GO

100*tabla.GO[,1]/margin.table(tabla.GO, 2)[1]


(dataGO <- matrix(numeric(12), ncol = 2))

for (i in 1:6) {
  dataGO[i,] = round(100*tabla.GO[,i]/margin.table(tabla.GO, 2)[i],2)
}

dataGO

rownames(dataGO) <- levels(occupation); colnames(dataGO) <- levels(gender)
dataGO
t(dataGO)

t(dataGO)[2,1]

# worker
legend(0.1, 0.85, paste(t(dataGO)[1,1], "%"), cex = 0.6, bty = "n")
legend(0.1, 0.1, paste(t(dataGO)[2,1], "%"), cex = 0.6, bty = "n")

# technical
legend(0.37, 0.85, paste(t(dataGO)[1,2], "%"), cex = 0.6, bty = "n")
legend(0.37, 0.1, paste(t(dataGO)[2,2], "%"), cex = 0.6, bty = "n")

# services
legend(0.56, 0.85, paste(t(dataGO)[1,3], "%"), cex = 0.6, bty = "n")
legend(0.56, 0.1, paste(t(dataGO)[2,3], "%"), cex = 0.6, bty = "n")

# office
legend(0.75, 0.85, paste(t(dataGO)[1,4], "%"), cex = 0.6, bty = "n")
legend(0.75, 0.1, paste(t(dataGO)[2,4], "%"), cex = 0.6, bty = "n")

# sales
legend(0.89, 0.85, paste(t(dataGO)[1,5], "%"), cex = 0.6, bty = "n")
legend(0.89, 0.1, paste(t(dataGO)[2,5], "%"), cex = 0.6, bty = "n")

# management
legend(1.01, 0.85, paste(t(dataGO)[1,6], "%"), cex = 0.6, bty = "n")
legend(1.01, 0.1, paste(t(dataGO)[2,6], "%"), cex = 0.6, bty = "n")


# Harmonic Media

Mar <- function(x) 1/(mean(1/x))

# Geometric mean

Mg <- function(x) exp(mean(log(x)))

medias.S <- tapply(wage, occupation, base::mean); medias.S
medianas.S <- tapply(wage, occupation, stats::median); medianas.S
m.geomet.S <- tapply(wage, occupation,  Mg); m.geomet.S
m.armonic.S <- tapply(wage, occupation,  Mar); m.armonic.S


library(psych)

m.geomet.S <- tapply(wage, occupation,  psych::geometric.mean); m.geomet.S
m.armonic.S <- tapply(wage, occupation,  psych::harmonic.mean); m.armonic.S

sort(medias.S)
sort(medianas.S)
sort(m.geomet.S)
sort(m.armonic.S)

# Bar diagram by measures of centrality

par(mfrow = c(2,2))

barplot(sort(medias.S), col = brewer.pal(6, "Set3"), main = "Barra de Medias", 
        density = 60, angle = 90, border = "blue", lwd = 1, las = 2)

barplot(sort(medianas.S), col = heat.colors(10), main = "Barra de Medianas", 
        density = 60, angle = 90, border = "brown", lwd = 1, las = 2, horiz = TRUE)

barplot(sort(m.geomet.S), col = brewer.pal(6, "Set1"), main = "Barra de M.Geometrica",
        density = 60, angle = 90, border = FALSE, lwd = 1, las = 2)

barplot(sort(m.armonic.S), col = brewer.pal(6, "Greys"), main = "Barra de M.Armonica", 
        density = 60, angle = 90, border = "pink", lwd = 1, las = 2, horiz = TRUE)

par(mfrow = c(1,1))


# title(main = "medidas de centralidad")

range_m <- function(x) 0.5*(min(x) + max(x))
wage_o <- split(wage, occupation); wage_o
sapply(wage_o, range_m)

sort(sapply(wage_o, range_m))
by(wage, occupation, range_m)

by(wage, occupation, psych::winsor.mean)
sapply(wage_o, psych::winsor.mean)


par(mfrow = c(2,3))

barplot(sort(medias.S), col = brewer.pal(6, "Set3"), main = "Barra de Medias", 
        density = 60, angle = 90, border = "blue", lwd = 1, las = 2)

barplot(sort(medianas.S), col = heat.colors(6), main = "Barra de Medianas", 
        density = 60, angle = 90, border = "brown", lwd = 1, las = 2, horiz = TRUE)

barplot(sort(m.geomet.S), col = brewer.pal(6, "Set1"), main = "Barra de M.Geometrica",
        density = 60, angle = 90, border = FALSE, lwd = 1, las = 2)

barplot(sort(m.armonic.S), col = brewer.pal(6, "Greys"), main = "Barra de M.Armonica", 
        density = 60, angle = 90, border = "pink", lwd = 1, las = 2, horiz = TRUE)

barplot(sort(sapply(wage_o, range_m)), col = 1:6, main = "Barra de Rango medio", 
        density = 60, angle = 90, border = "orange", lwd = 1, las = 2, horiz = TRUE)

barplot(sort(sapply(wage_o, psych::winsor.mean)), col = brewer.pal(6, "Set3"), main = "Media Winsor", 
        density = 30, angle = 80, border = "purple", lwd = 1, las = 2)

par(mfrow = c(1,1))

#---------------------------------------------------------------------------

library(psych)
library(pastecs)

psych::describe(wage)

pastecs::stat.desc(wage, basic = TRUE, norm = FALSE)
stat.desc(wage, basic = FALSE, norm = TRUE)

round(stat.desc(wage, basic = FALSE, norm = TRUE), 3)

summary(CPS1985, 3)
table(gender)

wage[gender == "male"]
wage[gender == "female"]


tabla_G <- rbind(psych::describe(wage[gender == "male"]), psych::describe(wage[gender == "female"]))
tabla_G
as.matrix(tabla_G)

table(gender)
levels(gender)

row.names(tabla_G) <- levels(gender)
tabla_G
rownames(tabla_G)
View(tabla_G)


tabla2_G <- round(rbind(pastecs::stat.desc(wage[gender == "male"], basic = FALSE, norm = TRUE), 
            pastecs::stat.desc(wage[gender == "female"], basic = FALSE, norm = TRUE)), digits = 4)

as.matrix(tabla2_G)
row.names(tabla2_G) <- levels(gender)
View(tabla2_G)


# Running the analysis for different groups
# by() is what is known as a 'wrapper' function


by(wage, sector, psych::describe)
by(wage, sector, Hmisc::describe)


by(wage, sector, stat.desc)
by(data = CPS1985, INDICES = CPS1985$gender, FUN = psych::describe)

cps1985_num <- CPS1985[ ,sapply(CPS1985, is.numeric)]  
by(cps1985_num, INDICES = CPS1985$gender, FUN = pastecs::stat.desc)


by(wage, sector, pastecs::stat.desc, basic = FALSE, norm = TRUE)

table(gender, sector)
by(cbind(data = CPS1985$wage, data = CPS1985$gender), CPS1985$sector, psych::describe)

by(cbind(data = CPS1985$wage, data = CPS1985$gender), CPS1985$sector, Hmisc::describe)


by(CPS1985$wage, CPS1985$occupation, shapiro.test)

shapiro.test(wage)

library(MASS)

MASS::truehist(wage)

#---------------------------------------------------------------------------------------

# Abstract function

resumen <- function(x, ...) {
  x = x[!is.na(x)]
  m = mean(x, ...)
  me = median(x, ...)
  s = sd(x, ...)
  mn = min(x, ...)
  mx = max(x, ...)
  iqr = IQR(x,...)
  output <<- round(c(m, me, s, mn, mx, iqr), 3)
  names(output) = c("Media", "Mediana", "Sd", "Min", "Max", "IQR")
  return(output)
}


resumen(wage)


stata <- function(x, miss = T) {
  media = mean(x, na.rm = miss)
  mediana = median(x, na.rm = miss)
  desv.s = sd(x, na.rm = miss)
  minimo = min(x, na.rm = miss)
  maximo = max(x, na.rm = miss)
  CV = desv.s/media
  long = sum(!is.na(x))
  tabla1 = round(matrix(c(media, mediana, desv.s, minimo, maximo, CV, long)), 3)
  row.names(tabla1) <- c("MEDIA","MEDIANA","DESV.STAND.","MINIMO","MAXIMO","COEF.VAR","n")
  tabla1
}

stata(wage)


sample(wage, 100, replace = TRUE)

df <- data.frame(muestra_1 = sample(wage, 50, replace = TRUE), 
                 muestra_2 = sample(wage, 50, replace = TRUE))

df

do.call(cbind, lapply(df, stata))

sapply(df, stata)

sapply(df, resumen)

# Another option

resumen.opc <- function(x, measure) {
  switch(measure,
         Mean = mean(x),
         Geometric = exp(mean(log(x))),
         Harmonic = 1/mean(1/x),
         Median = median(x),
         stop("Measure not included")) 
}

resumen.opc(wage, "Harmonic")
resumen.opc(wage, "Median")


# Another option 


mystats <- function(x, parametric = TRUE, print = FALSE) {
  if (parametric) {center <- mean(x); spread <- sd(x) 
  } else {center <- median(x); spread <- mad(x)}
  if (print & parametric) {cat(" Mean = ", center, "\n", " SD = ", spread, "\n")
  } else if (print & !parametric) {cat("Median = ", center, "\n", "MAD = ", spread, "\n")}
  result <- list(center = center, spread = spread)
  return(result)
}

# Trying it out

r1 <- mystats(wage, parametric = FALSE, print = TRUE); r1

r2 <- mystats(wage, parametric = TRUE, print = TRUE); r2



# Bar diagrams with association levels


tapply(wage, occupation, mean)

tapply(wage, list(occupation, gender), length)
tapply(wage, list(occupation, region), mean)
tapply(wage, list(occupation, region, ethnicity), mean)

media.O <- aggregate(wage ~ occupation, data = CPS1985, mean)
media.O

media.OR <- aggregate(wage ~ occupation + region, data = CPS1985, mean) 
media.OR

media.ORE <- aggregate(wage ~ occupation + region + ethnicity, data = CPS1985, mean)
media.ORE


library(lattice)

barchart(wage ~ occupation, data = media.O, col =  brewer.pal(6, "Set3"), border = "grey")

barchart(wage ~ occupation, data = media.OR, groups = region, border = "grey",
  auto.key = TRUE, par.settings = simpleTheme(col = terrain.colors(2)))

barchart(wage ~ occupation, data = media.ORE, groups = ethnicity, border = "grey",
         auto.key = TRUE, par.settings = simpleTheme(col = terrain.colors(6)))

barchart(wage ~ occupation, data = media.ORE, groups = ethnicity, border = "grey",
         auto.key = TRUE, panel = lattice.getOption("panel.barchart"))



library(psych)

par(mfrow = c(2,2))

interaction.plot(occupation, sector, wage, col = "green4",
  main = "Graficos de comparacion Media") # mean 

interaction.plot(occupation, sector, wage, col = "blue", 
  main = "Graficos de comparacion Mediana", xlab = "Niveles de ocupacion", fun = median)

interaction.plot(occupation, sector, wage, col = "orange", 
  main = "Graficos de comparacion Media G", xlab = "Niveles de ocupacion", fun = psych::geometric.mean)

interaction.plot(occupation, sector, wage, col = "red", 
  main = "Graficos de comparacion Media H", xlab = "Niveles de ocupacion", fun = psych::harmonic.mean)

par(mfrow = c(1,1))


# Another function 

plot.design(wage ~ sector*gender*occupation, fun = "sd", col = "purple")

par(mfrow = c(1,4))

plot.design(wage ~ occupation*sector*gender, col = "red", ylim = c(5,13))

plot.design(wage ~ occupation*sector*gender, fun = median, col = "orange", ylim = c(5,13))

plot.design(wage ~ occupation*sector*gender, fun = geometric.mean, col = "green3", ylim = c(5,13))

plot.design(wage ~ occupation*sector*gender, fun = harmonic.mean, col = "navy", ylim = c(5,13))

par(mfrow = c(1,2))

plot.design(wage ~ occupation*sector*gender, fun = sd, col = "green3", ylim = c(2,8))

plot.design(wage ~ occupation*sector*gender, fun = MAD, col = "navy", ylim = c(2,8))

# Comparative Boxplot

library(RColorBrewer)

par(mfrow = c(1,1))

# Save the graphic in the file 

setwd("G:\\Mi unidad\\R_Work\\Examples_R")

pdf(file = "BoxPlot.pdf", width = 5, height = 4)

boxplot(wage ~ occupation, col = brewer.pal(6, "Set3"), 
  main = "Boxplot agrupados por categorias", 
  ylab = "Ingresos", xlab = "Ocupacion")

dev.off()


(lim_sw <- quantile(wage, 0.75) + 1.5*IQR(wage))
(lim_iw <- quantile(wage, 0.25) - 1.5*IQR(wage))


boxplot(wage, col = "lightblue", main = "Boxplot ingresos por hora")
boxplot.stats(wage)
boxplot.stats(wage)$out

boxplot(wage ~ occupation, notch = T, varwidth = TRUE, col = 2:6, 
  main = "Boxplot agrupados por categorias", ylab = "Ingresos", xlab = "Ocupacion")

table(occupation)

100*prop.table(table(occupation)) |> round(4)

porcentaje <- 100*prop.table(table(occupation)); porcentaje
round(porcentaje, 1) -> porcentaje

etiquetas <- paste(levels(occupation), " (", porcentaje, "%)", sep = "")
etiquetas

legend(locator(1), etiquetas, lty = 1, lwd = 2, col = 2:6, box.col = 0, fill = 2:7)

boxplot(wage ~ sector*gender, notch = T, varwidth = TRUE, col = brewer.pal(6, "Set3"), 
        main = "Ingresos agrupados por sector y genero", 
        ylab = "Ingresos", xlab = "Ocupacion")


### Version ggplot2

library(tidyverse)

qplot(sector, wage, geom = "boxplot", data = CPS1985)
qplot(sector, wage, geom = "boxplot", fill = gender,  data = CPS1985)


qplot(sector, wage, geom = c("boxplot", "jitter"), fill = sector, data = CPS1985)

qplot(wage, sector, geom = c("boxplot", "jitter"), fill = sector, data = CPS1985)


### Violin plot 

wage[occupation == "worker"]
split(wage, occupation)$worker
CPS1985[occupation == "worker", 1]

salario.w <- wage[occupation == "worker"]
salario.t <- wage[occupation == "technical"]
salario.s <- wage[occupation == "services"]
salario.o <- wage[occupation == "office"]
salario.sa <- wage[occupation == "sales"]
salario.m <- wage[occupation == "management"]


hist(salario.m, freq = FALSE, border = "grey", 
     col = colorRampPalette(c("white", "red"))(7))
lines(density(salario.m), col = "blue")


RColorBrewer::brewer.pal(7, "RdGy") -> x 
colorRampPalette(x) -> f

hist(salario.m, freq = FALSE, col = f(6))
lines(density(salario.m), col = "blue")


library(vioplot)

levels(occupation)[c(-1,-2,-5)]


vioplot(salario.s, salario.o, salario.m,  
        border = "pink",
        names = levels(occupation)[c(-1,-2,-5)], col = "aquamarine2")


table(occupation)
names(table(occupation))
rownames(table(occupation))

vioplot(salario.w, salario.t, salario.s, salario.o, salario.sa, salario.m,
  names = levels(occupation), border = "lightblue", rectCol = "grey", lineCol = "blue",
  col = colorRampPalette(c("white", "red"))(6))


# stripchart

stripchart(wage ~ occupation, ylab = "Ingresos", 
  vertical = TRUE, col = brewer.pal(6, "Set3"), main = "Grafico Stripchart")

stripchart(wage ~ occupation, ylab = "Log de Ingresos", vertical = TRUE, 
  log = "y", pch = 21, bg = "navy", col = brewer.pal(6, "Set3"), 
  main = "Grafico Stripchart")

# Again the library Desctool
# Pairwise Numeric ~ Categorical

library(DescTools)

Desc(wage ~ ., data = CPS1985[, c("gender","wage")])


Desc(wage ~ sector, CPS1985, digits = 1, plotit = TRUE)
Desc(wage ~ ethnicity, CPS1985, digits = 2, plotit = TRUE)



(tool_wage.O <- Desc(wage ~ occupation, data = CPS1985, test = t.test, digits = 1, plotit = FALSE))

plot(tool_wage.O, type = "dens")


(tool_wage.gender <- Desc(wage ~ gender, data = CPS1985, test = t.test, digits = 1, plotit = FALSE))

plot(tool_wage.gender, type = "dens")


# Pairwise Categorical ~ Numeric


Desc(sector ~ wage, data = CPS1985, digits = 1)

# Pairwise Categorical ~ Categorical


Desc(sector ~ gender, data = CPS1985, digits = 1) # Buscar ayuda...


(z <- Desc(wage ~ sector, CPS1985, test = t.test, digits = 3, plotit = FALSE))

plot(z, type = "dens")


# Pairwise Numeric ~ Numeric


Desc(wage ~ education, data = CPS1985, plotit = TRUE)


PlotMarDens(y = wage, x = education, grp = sector,
  xlab = "Education", ylab = "Wage",
  col = c("brown","orange","lightsteelblue"), panel.first = grid(),
  main = "wage ~ education | sector")



# This is the official way to program in R


stripchart(wage ~ occupation, ylab = "Ingresos", 
           vertical = TRUE, col = brewer.pal(7, "Set3"), main = "Grafico Stripchart")



with(CPS1985, stripchart(wage ~ occupation, ylab = "Ingresos", 
  vertical = TRUE, col = brewer.pal(7, "Set3"), main = "Grafico Stripchart"))

# In this code the command is not required: attach(CPS1985)

head(CPS1985)


boxplot(wage ~ sector*gender, col = 1:6)

library(lattice); trellis.par.set(col.whitebg())

bwplot(wage ~  sector|gender, col = "red")

bwplot(wage ~  ethnicity|occupation, col = "red")

bwplot(wage ~ gender + married|sector, col = "blue", 
  panel = "panel.superpose", pch = 21)

bwplot(wage ~ region + union |occupation, col = "navy", 
  panel = "panel.superpose", panel.groups = "panel.linejoin")





# ------ Analysis of continuous variables-------------------

library(RColorBrewer); library(agricolae)

stem(wage) # Tree diagram


library(aplpack)
stem.leaf(wage)                  
stem.leaf.backback(wage)


Hdatos <- hist(wage, freq = FALSE, main = "Histograma", ylab = "Frecuencia Relativa",
  xlab = "Intervalos de Clase", col = brewer.pal(5, "Set3"))

Hdatos

grid()

lines(density(wage), col = "brown", lwd = 1)
rug(wage)
Hdatos 

hist(wage, freq = FALSE, main = "Histograma Ingresos", ylab = "Frecuencia Relativa",
  xlab = "Intervalos de Clase", col = brewer.pal(5, "Set3"))

lines(density(wage, bw = 2), col = "brown", lwd = 1)
rug(wage, col = "navy")
rug(jitter(wage, amount = 0.01), side = 3, col = "brown")
grid()
box()

# Se dise�a una funcion para el histograma 

h <- function(x, xlab = " ", ylab = "Density", main = " ", ...){
  hist(x, xlab = xlab, main = "Histograma", freq = FALSE, col = topo.colors(7),
  col.lab = "red", col.axis = "green4", bty = "o", border = "mediumseagreen",
  font = 4, font.main = 3, font.lab = 3,
  ylab = ylab, ...); grid(); box()
  lines(density(x, bw = 2), col = "orange", lwd = 1)
  rug(x, col = "navy")
  rug(jitter(x, amount = 0.01), side = 3, col = "brown")
}

h(wage)



# Almacenamiento de una imagen 

setwd("G:\\Mi unidad\\R_Work\\Examples_R")
getwd()
list.files(path = ".")

pdf(file = "Histograma.pdf", width = 5, height = 4) 

h <- function(x, xlab = " ", ylab = "Density", main = " ", ...){
  hist(x, xlab = xlab, main = "Histograma", freq = FALSE, col = topo.colors(7),
       col.lab = "red", col.axis = "green4", bty = "o", border = "mediumseagreen",
       font = 4, font.main = 3, font.lab = 3,
       ylab = ylab, ...); grid(); box()
  lines(density(x, bw = 2), col = "orange", lwd = 1)
  rug(x, col = "navy")
  rug(jitter(x, amount = 0.01), side = 3, col = "brown")
}


h(wage) -> Histograma


dev.off()



m <- mean(wage); v <- var(wage)
(beta.hat <- v/m); (alpha.hat <- m^2/v)


h <- function(x, xlab = " ", ylab = "Density", main = " ", ...){
  hist(x, xlab = xlab, main = " ", freq = FALSE,
       col = "deepskyblue2", ylab = ylab, ...)}

h(wage)

x <- seq(0, 60, length = 534)

lines(x, dgamma(x, shape = alpha.hat, scale = beta.hat) , lwd = 2, col = "darkorange2")

diff(pgamma(c(10, 20), shape = alpha.hat, scale = beta.hat))

ks.test(wage, "pgamma", shape = alpha.hat, scale = beta.hat)


boxplot(wage)




# Get Environment Variables
# Sys.getenv(): will return a named vector giving the values of all the environment variables.
# Construct Path to File
file.path()


Sys.getenv()
Sys.getenv("USERDOMAIN")
Sys.getenv("SystemDrive")
Sys.getenv("HOME")


library(tidyverse)

grafico_1 <- ggplot(data = CPS1985) +
  geom_histogram(mapping = aes(x = wage), fill = "cornflowerblue", color = "white", bins = 7) + 
  labs(title = "Histograma de ingresos", subtitle = "number of bins = 20", x = "Wage")

grafico_1
                 
# Creaci?n de una ruta ficticia

Directory_I <- file.path(Sys.getenv("HOME"), "Carpeta_1", "Discovering_Statistics")


imagen_grafico <- file.path(Directory_I,"grafico_1.png") # the .png format is important

ggplot2::ggsave(imagen_grafico)



# --------Histogram by parcels---------------------------------------

layout(mat = matrix(c(1, 2), 2, 1, byrow = TRUE), height = c(3, 1))
par(mar = c(3.1, 3.1, 1.1, 2.1))

hist(wage, main = "Histograma de ingresos", 
  col = heat.colors(7), freq = FALSE, xlim = c(0, 50))

rug(wage, col = "red")
lines(density(wage, bw = 2), lwd = 1, col = "brown")

boxplot(wage, horizontal = TRUE, outline = TRUE, 
  frame = FALSE, col = "orange", width = 10, ylim = c(0, 50))

# Histogram various

require(agricolae)

par(mfrow = c(1,3), bg = "lightblue", col.main = "brown", 
  col.lab = "navy", col.axis = "black", oma = c(1,1,2,1))

#--------------------------------------------------------------

h1 <- hist(wage, breaks = ceiling(3.3*log10(length(wage))+1), 
  xlab = "Intervalos de clase", ylab = "Frecuencia", main = "", 
  col = "beige", border = "grey")

rug(wage); normal.freq(h1, col = "red")


library(MASS)

h2 <- truehist(wage, xlab = "Intervalos de clase", ylab = "Frecuencia", 
main = "", col = "beige", border = "grey")

rug(wage); lines(density(wage), col = "blue")

h3 <- graph.freq(wage, frequency = 2, ylab = "Frecuencia relativa", 
  xlab = "Intervalos de clase", col = "beige", border = "grey")

rug(wage); lines(density(wage, bw = 1), col = "blue")

normal.freq(h3, col = "red", frequency = 2)

title(main = list("Valoracion del supuesto de normalidad", cex = 1.5, font = 3), outer = T)
legend(locator(1), c("Poligono", "Densidad Normal"), 
  lty = c(1,1), col = c("blue", "red"), box.col = 0)



par(mfrow = c(1,1))

# Diagrama de Ojivas requiere library(agricolae)

library(agricolae)

Hdatos <- hist(wage, freq = FALSE, main = "Histograma", ylab = "Frecuencia Relativa",
  xlab = "Intervalos de Clase", col = brewer.pal(5, "Set3"))

ogive.freq(Hdatos, main = "Digrama de Ojiva", 
xlab = "Rango de la variable datos", ylab = "Frecuencia Relativa",
col = "pink3", bg = "black", pch = 21)


n <- length(wage)

plot(sort(wage),(1:n)/n, type = "s", ylim = c(0,1), col = "blue", 
ylab = "Frecuencia relativa Acumulada") 

plot(ecdf(wage), do.points = FALSE, verticals = TRUE, col = "green4", 
  main = "Distribucion acumulada", xlab = "Realizaciones de la V.a wage",
  ylab = "Probabilidad Acumulada F(y)")



### Identificacion de distribucion subyacente

install.packages("rriskDistributions")
library(rriskDistributions)

fit.cont(CPS1985$wage)


###-----------------------------------------------------------------------------------
# DETECTION OF OUTLIERS 

library(AER)
data("CPS1985", package = "AER"); CPS1985
summary(CPS1985)
str(CPS1985)
attach(CPS1985)

# Outlier detection method using plot


g_caja <- boxplot(wage, col = "skyblue", frame.plot = F)

# You can see that there are some outliers. So if we want to know the outliers. 
# We only call the outliers with the command $ out

g_caja$out

# Eliminating the outlier values. 
(new_wage <- wage[!(wage %in% g_caja$out)])
length(new_wage)

#

boxplot(new_wage, col = "skyblue", frame.plot = F)



### STANDARDIZATION METHOD
# For this exercise we are going to try to determine if the variable wage from CPS1985 contains outlier elements. 
# For this we are going to use standardization, which subtracts the mean from the variable and divides it by its standard deviation.

# To look for outliers we could
# convert our variable to z-scores and then count how many
# fall within certain important limits. If we take the absolute
# value (i.e., we ignore whether the z-score is positive or negative) then in a normal distribution we'd expect about
# 5% to have absolute values greater than 1.96 (we often use 2 for convenience), and 1% to have absolute values
# greater than 2.58, and none to be greater than about 3.29

# In this case our variable x is the variable wage. 
# So if the standardized value is greater than 3 then that observation is an outlier.

outlier_std <- function(x){
  media = mean(x)
  desv = sd(x)
  t <- c()
  for (i in 1:length(x)) {
    x_e <- (x[i]-media)/desv
    t <- c(t,abs(x_e)>3)
  }
  return(t)
}
#

outlier_std(CPS1985$wage)

CPS1985$wage[outlier_std(CPS1985$wage)]



### Grubbs test.

# This test uses statistical tests to determine if an observation is an outlier. 
# https://en.wikipedia.org/wiki/Grubbs%27s_test

# It is necessary to supply the value (x1) that is considered atypical in the vector

test_grubbs <- function(x1, x, alpha = .05, num_colas = 2, vista = TRUE){
  v_g = abs(x1 - mean(x))/sd(x)
  
  if(num_colas == 2){
    G <- ((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(2*length(x)), df = length(x)-2)^2/(length(x)-2+(qt(alpha/(2*length(x)), df = length(x)-2)^2)))
  } else if(num_colas == 1){
    G <- ((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(length(x)), df = length(x)-2)^2/(length(x)-2+(qt(alpha/(length(x)), df = length(x)-2)^2)))
  } else {
    stop("No es un numero de colas permitido.")
  }
  if(vista == FALSE){
    v_g > G
  } else if(vista == TRUE){
    list(Grubbs_test = v_g, Grubbs_critico = G, Eleccion = paste0(v_g,">",G), Resultado = v_g>G)
  } else{
    stop("Tiene que ser un valor logico TRUE o FALSE")
  }
}

test_grubbs(24.98, CPS1985$wage)


# General version

grubbs_total <- function(x, alpha = 0.05, num_colas = 2){
  if(num_colas == 2){
    G <- ((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(2*length(x)), df = length(x)-2)^2/(length(x)-2+(qt(alpha/(2*length(x)), df = length(x)-2)^2)))
  } else if(num_colas == 1){
    G <- ((length(x)-1)/sqrt(length(x)))*sqrt(qt(alpha/(length(x)), df = length(x)-2)^2/(length(x)-2+(qt(alpha/(length(x)), df = length(x)-2)^2)))
  } else {
    stop("No es un n�mero de colas permitido.")
  }
  t<-c()
  for (i in 1:length(x)) {
    v_g = abs(x[i]-mean(x))/sd(x)
    t<-c(t, v_g>G)
  }
  t
}


grubbs_total(CPS1985$wage)


# Bonous track 


#' @title Number of items per percentile.
#' @description Returns the number of items found for each specified percentile.
#' @param x Numeric vector.
#' @param len numeric parameter that is equivalent to the number of cuts you want to make, so if
#' you want to calculate the elements divided by tertiles, 'len' takes the value of 3. len takes the
#' value of 4 by default.
#' @param p_corte logical value that takes the value of TRUE by default, which indicates that in the results
#' shows the cutoff points of the percentiles. If it is FALSE, in the result it will be shown by
#' parts, so if you choose quartiles, the name of the rows from one to 4 will be displayed, which does
#' reference to the parts into which it was split. 

n_percentil <- function(x,len = 4, p_corte = TRUE){
  if(isTRUE(p_corte)){
    a <- quantile(x, prob = seq(0, 1, length = len+1), na.rm = TRUE)
    b <- as.matrix(table(cut(x, breaks = a, right = T, include.lowest = T)))
  } else {
    a <- quantile(x, prob = seq(0, 1, length = len+1))
    b <- as.matrix(table(cut(x, breaks = a, labels = seq(len), right = T, include.lowest = T)))
  }
  return(b)
}


n_percentil(sample(1:100, 400, replace = TRUE), len = 5, p_corte = FALSE)
n_percentil(sample(1:100, 400, replace = TRUE), len = 5)

n_percentil(wage, len = 5)



##--------------------------------------------------------------------------
###--------------------------------------------------------------------------
###--------------------------------------------------------------------------

setwd("G:\\Mi unidad\\R_Work\\Examples_R")
savehistory(file = "save_2")



# Thanks you!!!



