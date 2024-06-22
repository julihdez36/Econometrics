# Statistical programming on the R platform
# Universidad Externado de Colombia
# Faculty of Economics - Courses: MINE and SpC in Econometrics
# Name: Zahir Llerena
# CC: 101984752
# Email: arlington.llerena@uexternado.edu.co, allerenam@unal.edu.co
# Statistics, Mathematics & Physics
# Exercises in class in order to strengthen skills concerning programming


# Access routes and other items in the console

R.version

contributors()

citation()
sessionInfo()

xfun::session_info()

getwd()                   # Identify working directory

setwd("mydirectory")      # Set access directory for work

# Introduction -----------------------------------------------------------------

rm(list = ls())

setwd(choose.dir)

getwd()

savehistory(file = "save_1")
loadhistory(file = "save_1")

#-------------------------------------------------------------------------------


.libPaths()               # Identifies librarian path
library()                 # announces list of available packages
search()                  # Provides a list of loaded packages

options()                 # Default options arranged in R
                          # options(digits = 3)

memory.limit()            # only to windown
memory.size()

help.start()              # Help on the R web

help(median)
?median

install.packages()        # Display window loading packages

install.packages("AER", dep = TRUE)
packageVersion("AER")

install.packages("devtools", dep = TRUE)

library(devtools)
install_github()

install.packages("fastR2")

# Example 
install_github("rpruim/fastR2", build_vignettes = TRUE)

update.packages()         # Update packages

new.packages()


remove.packages()

history(3)                # loads the history associated with the row


# Time 

Sys.Date(); Sys.time()


# Dates are stored as days relative to 1 January 1970

as.numeric(Sys.time())
class(Sys.time())

time.list <- as.POSIXlt(Sys.time())
time.list

unlist(time.list)


# Lubridate makes it easier to do the things R does with date-times and possible
# to do the things R does not.

# Or the the development version from GitHub:
# 

install.packages("devtools")

devtools::install_github("tidyverse/lubridate")


install.packages("lubridate")

library(lubridate)

today()

# dates are stored as days relative to 1 January 1970

today() - dmy("1 January 1970")
as.numeric(Sys.time())

as.numeric(today() - dmy("1 January 1970"))


# Calendar

install.packages("calendR", dep = TRUE)
# devtools::install_github("R-CoderDotCom/calendR")

library(calendR)

calendR()

calendR(year = 1945)
calendR(year = 2028, month = 7)

?calendR

# calendR(month = 1, start = "S") # Week starts on Sunday (default)

calendR(month = 1, start = "M")   # Week starts on Monday

calendR(year = 1998, start = "M", special.days = "weekend", special.col = "pink")

calendR(year = 2021, month = 8, start = "S", col = "blue", font.style = "bold",
        days.col = "red", subtitle = "Un excelente mes")

calendR(month = 10, year = 2021, col = "blue", 
        special.days = c(1, 5, 12, 28),         # Color days of the month
        text = "Visit\n www.uexternado.edu.co", # Add some text
        text.pos = c(1, 5, 12, 28))             # Where to add the text


setwd("G:\\Mi unidad\\R_Work\\Examples_R")

mypath <- "G:\\Mi unidad\\R_Work\\Examples_R\\calendR"

invisible(sapply(1:12, function(i) calendR(month = i, pdf = TRUE,
                          doc_name = file.path(mypath, paste0("Mi Calendario", i , ".pdf")))))

invisible(sapply(c(1,3,5,7), function(i) calendR(month = i, pdf = TRUE, col = "blue", font.style = "bold",
                          days.col = "red", subtitle = "Horario SpC_XIII", special.days = "weekend", special.col = "pink",
                          doc_name = file.path(mypath, paste0("Mi Calendario SpC", i , ".pdf")))))


invisible(sapply(2010:2015 , function(j) sapply(1:12 , function(i) calendR( year = j, month = i, pdf = TRUE,
                            doc_name = file.path(mypath, paste0("Mi Calendario Year", j, i))))))


# Propuesta Horario MINE_II

fechainicial <- as.Date("2021-05-07", format = "%Y-%m-%d"); fechainicial
fechafinal <- as.Date("2021-09-10", format = "%Y-%m-%d"); fechafinal

mypath <- "G:\\Mi unidad\\R_Work\\Examples_R\\calendR"

for (i in c(5:9)){
  p = NULL
  name <- paste0("Calendario-", format(fechainicial, format = "%B-%Y"))
  while(as.numeric(format(fechainicial, format = "%m"))== i && fechainicial <= fechafinal) {
    p <- c(as.numeric(format(fechainicial, format = "%d")), p)
    fechainicial = fechainicial + 14
  }
  calendR(month = i, col = "blue", 
          special.days = p, font.style = "bold",
          subtitle = "Horario MINE_II",                          
          text = "Visita Plataformas y sistemas de informaci�n", 
          text.pos = p, 
          days.col = "orange", special.col = "pink", pdf = TRUE,
          doc_name = file.path(mypath, name))  
}

#-------------------------------------------------------------------------------

# Worked Examples of Functions

example(lm)

data() # Data available in R
CO2
View(CO2)
help(CO2)
?CO2

str(CO2)
summary(CO2)

install.packages("DescTools") 
library(DescTools)

Abstract(CO2)

head(CO2, 7)
tail(CO2, 10)

install.packages("car", dep = TRUE)
library(car)
some(CO2, 17)

dim(CO2)
class(CO2)

data()

data(package = .packages(all.available = TRUE)) # Data available in R

#############################################################################################

# Basic operations
# Essentials of the R Language  
# Each line can have at most 128 characters
# 
# 
# R uses the usual symbols for addition +, subtraction -, multiplication *, division
# /, and exponentiation ^. Parentheses ( ) can be used to specify the
# order of operations. R also provides %% for taking the modulus and %/% for
#integer division.

(1 + 1/100)^100
(1 + 1/100)**100

log(42/7.3)

log10(10000)
log(10000, 10)


5+6+3+6+4+2+4+8+
3+2+7
2+3; 5*7; 3-7

# Modulo and Integer Quotients

119 %/% 13
119 %% 13
9 %% 2
8 %% 2
15421 %% 7
15421 %% 7 == 0
17%%5


154214 %/% 7
154214 / 7

exp(1)
options(digits = 7)

options(digits = 4)

pi

# Add two numbers and assign the result into a variable.

1+2

sum(1, 2)

v <- sum(1, 2)

v <- sum(1, 2); v

v <- sum(1, 2); show(v)

(v <- sum(1, 2))

(u <- sum(1.34566, 2.54657))

# Print the value stored in a variable.
v

print(v)

# Access a particular value from a vector of data.
v[1]

v[2]

# Add two numbers using the equivalent functional form.

"+"(1, 2)
"-"(1, 2)
"*"(1, 2)
"/"(1, 2)
"^"(5, 2)
"log"(2)
log(2)

5^2
5**2

### native pipe
 
2 |> log()
2 |> sum(3)

objects()  # To see what variables you have created in the current session


# Variables
# A variable is like a folder with a name on the front. You can place something
# inside the folder, look at it, replace it with something else, but the name on
# the front of the folder stays the same.
# To assign a value to a variable we use the assignment command <-. Variables
# are created the first time you assign a value to them. You can give a variable
# any name made up of letters, numbers, and . or _, provided it starts with a
# letter, or . then a letter. Note that names are case sensitive.


# Assignment

x <- 5

weight <- c(60, 72, 57, 90, 95, 72); weight

weight = c(60, 72, 57, 90, 95, 72)

9 == 18/2

assign("weight", c(60, 72, 57, 90, 95, 72))

# Notice that there is a potential ambiguity if you get the spacing wrong.

x <  -5

x <- 100
x

(1 + 1/x)^x
(1 + 1/100)^100

x <- 200
(1 + 1/x)^x

y <- (1 + 1/x)^x; y
(y <- (1 + 1/x)^x)

# When assigning a value to a variable, the expression on the right-hand side is
# evaluated first, then that value is placed in the variable on the left-hand side.
# It is thus possible (and quite common) to have the same variable appearing
# on the right- and left-hand sides.

n <- 1
n <- n + 1
n

# In common with most programming languages, R allows the use of = for variable
# assignment, as well as <-. I prefer the latter, because there is no possibility
# of confusion with mathematical equality. For example, we understand
# the assignment n <- n + 1 by thinking of n as the name of a data location in
# the computer memory, whose contents change as the assignment is processed.
# Contrast this with the usual mathematical interpretation of n = n + 1, where
# the variable n is thought of as having the same value on both sides (so this
# equation has no finite solution)


z <- 3.5-8i
Re(z)
Im(z)
Mod(z)
Arg(z)
Conj(z)
is.complex(z)
as.complex(3.8)

#Numbers with Exponents

1.2e3
1.2e-2

# All known functions are available

log(10)
exp(1)
log10(6)
log(9,3)
pi
sin(pi/2)
cos(pi/2)

args(cos)

# Rounding
# The functions floor(x) and ceiling(x) round down and up respectively, to
# the nearest integer.


floor(5.7)
floor(10.3)
floor(123.6)
floor(-5.7)

ceiling(5.7)
ceiling(53.5)
ceiling(13.9)
ceiling(4.2)
ceiling(-4.2)
ceiling(4)

# Infinity and Things that Are Not a Number (NaN)

3/0
-12/0
exp(-Inf)
0/Inf
(0:3)^Inf
0/0
Inf-Inf
Inf/Inf
is.finite(10)
is.infinite(10)
is.infinite(Inf)

# Functions
# In mathematics a function takes one or more arguments (or inputs) and produces
# one or more outputs (or return values). Functions in R work in an analogous way.
# To call or invoke a built-in (or user-defined) function in R you write the name
# of the function followed by its argument values enclosed in parentheses and
# separated by commas.

seq(from = 1, to = 9, by = 2)
seq(1, 9, 2)

from <- 1
to <- 9

seq(from, to)


# Some arguments are optional, and have predefined default values, for example:
# if we omit by then R uses by = 1:

seq(from = 1, to = 9)


# To find out about default values and alternative usages of the built-in function
# fname, you can access the built-in help by typing help(fname) or ?fname.

?seq
help(seq)

# Every function has a default order for the arguments. If you provide arguments
# in this order, then they do not need to be named. 

# Generating Regular Sequences of Numbers

10:18 # this makes a sequence of numbers 
18:10
-0.5:8.5
seq(0, 1.5, 0.2)
seq(1.5, 0, -0.2) 

seq(1, 9, 2)

seq(to = 9, from = 1)

seq(by = -2, 9, 1)

x <- 9
seq(1, x, x/3)


# Repeats

rep(9,5)
rep(1:4, 2)
rep(1:4, each = 2)
rep(1:4, each = 2, times = 3)
rep(1:4, 1:4)
rep(1:4, c(4,1,5,2))

partido <- factor(rep(c("CD", "CH", "L", "C"), c(100, 20, 34, 98))); partido
partido <- as.factor(rep(c("CD", "CH", "L", "C"), c(100, 20, 34, 98)))
partido

?gl

levels(partido)
nlevels(partido)

sequence(5)
sequence(18)
sequence(5:1)
sequence(c(5,2,4))


# Design of a mathematical function

rounded <- function(x) floor(x + 0.5)

floor(3.8)
rounded(3.8)
rounded(5.7)
rounded(5.4)

ceiling(-5.7)
floor(-5.7)
trunc(5.7)
trunc(-5.7)

round(5.7, 0)
round(5.53, 0)
round(5.53234363, 2)
round(5.53234363, 3)
round(5.53234363, 5)
round(5.4, 0)
round(5.49, 1)
round(5.5, 0)
round(-5.7, 0)
round(-5.53234363, 2)
round(-5.53234363, 3)
round(-5.53234363, 5)

signif(12345678, 4)

signif(12345678, 5)

signif(12345678, 6)

# In R functions can have a variable number of arguments, including no arguments
# at all. A function call always needs the parentheses, even if no arguments
# are required. If you just type the name of the function, then R types
# out the function object, which is simply the program defining the function
# itself. Try typing demo and then demo() to see the difference. (Then type
# demo(graphics) to see a good demonstration of some of R graphics capabilities.)

demo(persp)
demo(graphics)
demo(Hershey)
demo(plotmath)
example(InsectSprays)

demo(package = .packages(all.available = TRUE)) # It allows to know all the demos arranged in R


# Vectors
# A vector is an indexed list of variables. You can think of a vector as a drawer
# in a filing cabinet: the drawer has a name on the outside and within it are files
# labelled sequentially 1, 2, 3, . . . from the front. Each file is a simple variable
# whose name is made up from the name of the vector and the number of the
# label/index: the name of the i-th element of vector q is q[i].

# Creating a Vector
# Vectors are variables with one or more values of the same type: logical, integer, real,
# complex, string (or character) or raw.
# 
# If the evaluation of an expression is saved, using the <- operator, then the combination
# is called an assignment.


a <- c(1, 2, 5, 3, 6, -2, 4)
b <- c("one", "two", "three"); b
(b <- c("one", "two", "three"))
d <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

typeof(a); typeof(b); typeof(c)
typeof(3L)

q <- 10:16; q

q[3]
q[c(2,4,7)]

y <- c(10, 11, 12, 13, 14, 15, 16)
y[2:5]
y[-3]

r <- 4.3
r[2]
z <- r[-1]
length(z)


metallica <- c("Lars", "James", "Jason", "Kirk"); metallica

metallica <- metallica[metallica != "Jason"]
metallica

metallica <- c(metallica, "Rob")
metallica

metallica <- metallica[metallica != "Jason"]; metallica <- c(metallica, "Rob")

# Matrix 

y <- matrix(1:20, nrow = 5); y

yr <- matrix(1:20, byrow = TRUE, ncol = 4); yr

y <- matrix(1:20, nrow = 5, byrow = TRUE); y

cells <- c(1, 26, 24, 68); cells
rnames <- c("R1", "R2"); cnames <- c("C1", "C2")

mymatrix <- matrix(cells, nrow = 2, byrow = TRUE,
                   dimnames = list(rnames, cnames))
mymatrix

mymatrix <- matrix(cells, nrow = 2, ncol = 2,
                   dimnames = list(rnames, cnames))
mymatrix



y <- scan()

(x <- seq(1, 20, by = 2))

(y <- rep(3, 4))

(z <- c(y, x))

(x <- 100:110)

i <- c(1, 3, 2)
x[i]
j <- c(-1, -2, -3)
x[j]

x

# Subscripts and Indices
# Working with Vectors and Logical Subscripts

x <- 0:10; x
sum(x)
x < 5
sum(x<5)

x[x<5]
sum(x[x<5])

which(x < 5)

x < 5
1*(x<5)
x*(x<5)
sum(x*(x<5))

y <- c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11); y
sort(y)
sort(y, decreasing = TRUE)
rev(sort(y))
rev(sort(y))[2]
rev(sort(y))[1:3]
sum(rev(sort(y))[1:3])

rev(sort(y))
y|> sort() |> rev()

library(tidyverse)

y %>% sort() %>%  rev()


# Features of a vector 

# It is possible to have a vector with no elements. The function length(x) gives
# the number of elements of x.

x <- c()
length(x)

# Algebraic operations on vectors act on each element separately, that is elementwise.

x <- c(1, 2, 3)
y <- c(4, 5, 6)
x * y 
x + y

y^x

A <- 1:10; A
B <- c(2,4,8); B
A*B


# When you apply an algebraic expression to two vectors of unequal length,
# R automatically repeats the shorter vector until it has something the same
# length as the longer vector.

c(1, 2, 3, 4) + c(1, 2)

(1:10)^c(1, 2)

(-100:37)^2 + sum(-100:37)

# This happens even when the shorter vector is of length 1, allowing the shorthand
# notation:

2 + c(1, 2, 3)

2 * c(1, 2, 3)

(1:10)^2


# R will still duplicate the shorter vector even if it cannot match the longer
# vector with a whole number of multiples, but in this case it will produce a
# warning.

c(1,2,3) + c(1,2)

# A useful set of functions taking vector arguments are sum(...), prod(...),
# max(...), min(...), sqrt(...), sort(x), mean(x), and var(x). Note that
# functions applied to a vector may be defined to act elementwise or may act
# on the whole vector input to return a result:

sqrt(1:6)

mean(1:6)
sort(c(5, 1, 3, 4, 2))


# Example: mean and variance

x <- c(1.2, 0.9, 0.8, 1, 1.2)
x.mean <- sum(x)/length(x)
x.mean - mean(x)

x.var <- sum((x - x.mean)^2)/(length(x) - 1)
x.var - var(x)

# Example: exponential limit

x <- seq(10, 200, by = 10); x
y <- (1 + 1/x)^x
exp(1) - y

windows()
plot(x, y)


CO2
plot(CO2$Type ~ CO2$Treatment)



?plot

plot(x, y, col = "blue",  xlab = "Dominio", ylab = "Rango", 
     main = "Mi Primera grafica",  pch = 21, bg = "pink") # lwd = 2, type = "o",


# Logical operations


TRUE == FALSE

T == F
T <- 0
T == FALSE

F <- 1
TRUE == F

!T == F

?"!"
  
# Logical expressions
# A logical expression is formed using the comparison operators <, >, <=, >=, ==
# (equal to), and != (not equal to); and the logical operators & (and), | (or),
#  and ! (not). The order of operations can be controlled using parentheses ( ).
# Two other comparison operators, && and ||

# The value of a logical expression is either TRUE or FALSE. The integers 1 and
# 0 can also be used to represent TRUE and FALSE, respectively (which is an
# example of what is called coercion).

# Note that A|B is TRUE if A or B or both are TRUE. If you want exclusive disjunction,
# that is either A or B is TRUE but not both, then use xor(A,B):

c(0, 0, 1, 1) | c(0, 1, 0, 1)

xor(c(0, 0, 1, 1), c(0, 1, 0, 1))

# The example above also shows that logical expressions can be applied to vectors
# to produce vectors of TRUE/FALSE values. This is particularly useful for
# selecting a subvector using the indexing operation, x[subset]
 
# One way of extracting a subvector is to provide an subset as a vector of
# TRUE/FALSE values, the same length as x. The result of the x[subset] command
# is that subvector of x for which the corresponding elements of subset
# are TRUE. Importantly, the argument subset can be generated using x.
# For example, suppose we wished to find all those integers between 1 and 20
# that are divisible by 4.

x <- 1:20
x%%4 == 0 

(y <- x[x%%4 == 0])

# R also provides the subset function, for choosing a subvector of x. The difference
# between the function subset and using the index operator is how they
# handle missing values (NA). The subset function will ignore the missing index
# values, whereas the x[subset] command preserves them, for example:
 
x <- c(1, NA, 3, 4)
x > 2

x[x > 2]

subset(x, subset = x > 2)

# If you wish to know the index positions of TRUE elements of a logical vector
# x, then use which(x).


x <- c(1, 1, 2, 3, 5, 8, 13)
x%%2 == 0
which(x%%2 == 0)


x <- rnorm(18, 10, 2)
x.values <- seq(min(x), max(x), (max(x)-min(x))/100)

seq(88, 50, along = x)
seq(88, 50 , -2.235294)


# The sample Function


x <- seq(10, 200, by = 10); x
y <- (1 + 1/x)^x

y
sample(y)
sample(y)

sample(y, 2)
sample(y, 5)
sample(y, 6, replace = T)


# Testing for equality with real numbers

x <- sqrt(2); x
x * x - 2

# Equality of floating point numbers using
x <- 0.3 - 0.2
y <- 0.1
x == y

all.equal(x,y)


library(tidyverse)

near(x, y)

# Summarizing differences between objects using

a <- c("cat","dog","goldfish")
b <- factor(a)

all.equal(a,b)
class(b)
mode(b)

attributes(b)

n1 <- c(1,2,3)
n2 <- c(1,2,3,4)
all.equal(n1, n2)

n2 <- as.character(n2)
all.equal(n1, n2)


# Generate Factor Levels

is.factor() # to check that a variable is a factor
levels()
nlevels()

unclass() # To turn factor levels into numbers (integers)

B <- gl(4,3); B
gl(4,3,24)
gl(4,3,20) 
gl(3, 2, 24, labels = c("A", "B", "C"))


##############################################################################################

# Example with dataframe

iris
help(iris)
str(iris)
summary(iris)
names(iris)


iris$Petal.Length
with(iris, Petal.Length)


Petal.Length

iris[3, 4]
iris[,3]
iris[3, ]

iris[3]

iris[3, 2:4]

data <- iris[,3]
data_1<- iris[3]; data_1


iris[ ,c(1,3,4)]


iris[23:47, c(1,3,4)]

iris[ ,"Petal.Length"]
iris["Petal.Length"]

head(iris)

attach(iris)

Petal.Length

Species

class(Species)
levels(Species)
summary(Species)

head(iris, 17)
car::some(iris)


iris[Species == "setosa", ]  # if attach() is ON
iris[iris$Species == "setosa", ]

iris[Species == "setosa", ]
iris[Species == "virginica", ]
iris[Species == "versicolor", ]


iris[Species == "virginica", c(1,4)]
iris[Species == "versicolor", ]

e <- iris[Species == "virginica", ]; e[1:4,]


plot(Sepal.Width,  Species)
plot(Sepal.Width ~ Species, col = c("blue", "pink", "red"), main = "Heidy boxplot")
grid()

abline(h = seq(2,5, 0.25), lwd = 1.3, col = "green")



# Matrix construction


x <- matrix(1:10, nrow = 2)
x
x[2,3]
x[2, ]
x[, 2]
x[1, 4]
x[1, c(4,5)]


# Using array subscripts}

dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2, 3, 4)); z

z <- array(1:24, c(2, 3, 4), dimnames = list(dim1, dim2, dim3)); z

z[1, 2, 1]
z[1,2,3]; z[ ,2,3]; z[1, ,3]; z[1, , ]

t( z[1, , ])

UCBAdmissions

HairEyeColor


UCBAdmissions[1,2,2]
UCBAdmissions[ , , 4]

# Another Example

patientID <- c(1, 2, 3, 4)
admdate <- as.Date(c("2017-10-15", "2017-11-01", "2017-07-21", "2017-09-28"))
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, admdate, age, diabetes, status)
patientdata

patientdata[3,2]
patientdata[3,]
patientdata[ ,2]
patientdata[1:2]

patientdata[c("diabetes", "status")]
patientdata$age
patientdata$status

table(patientdata$status)

table(patientdata$diabetes, patientdata$status)

# Another version

patientID <- 1:4
patientID <- gl(4, 1, labels = c("First", "Second", "Third", "Fourth"))


age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1"); diabetes <- factor(diabetes)

status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status, order = TRUE,
                 levels = c("Poor", "Improved", "Excellent"))

patientdata <- data.frame(patientID, admdate, age, diabetes, status)
patientdata
summary(patientdata)

str(patientdata)

#############################################################################################
# Handling data.frame
# Examaple 1

install.packages("car", dep = T); library(car)

help(Salaries)

Salaries 
head(Salaries); tail(Salaries)
attach(Salaries); names(Salaries) 
car::some(Salaries)

class(Salaries); dim(Salaries)
dput(Salaries)  # Formato para exportar 

str(Salaries)
summary(Salaries)

library(DescTools)
Abstract(Salaries)
Desc(Salaries)


Salaries[3,5]
Salaries[14:19, 5]
Salaries[1:5, 2:3]

Salaries[3, ]
Salaries[ ,3]

Salaries["yrs.since.phd"]
Salaries[ ,"yrs.since.phd"]

Salaries$rank; Salaries[["rank"]]
Salaries[[1]]; Salaries[1]

Salaries$salary; Salaries[ , "salary"]
Salaries[[6]]; Salaries[6]
Salaries[,6]
with(Salaries, salary)    # Using with() avoids the name collision problem introduced by attach()
Salaries["salary"]
salary

identical(Salaries$salary, Salaries[,6])

# Therefore

all.equal(Salaries$salary, Salaries[,6], 2)

library(dplyr)

near(Salaries$salary, Salaries[,6])

class(Salaries[3, ]); class(Salaries[, 3])

Salaries[ ,c(1,3)]


?unclass

attach(Salaries)

View(Salaries)

Salaries[rank == "Prof", ]

Salaries[rank == "Prof", 6]
length(Salaries[rank == "Prof", 6])
summary(Salaries[rank == "Prof", 6])

Salaries[rank == "Prof", c(1,4,5)]


Salaries[rank == "Prof", ]
Salaries[rank == "AsstProf", ]
Salaries[rank == "AssocProf", ]


split(Salaries, rank)

split(Salaries, rank)[1]
split(Salaries, rank)[[1]]
data_1 <- split(Salaries, rank)["AsstProf"]
class(data_1)

Desc(data_1)

Desc(as.data.frame(data_1))

# Se requiere el attach()

salary[rank == "Prof"]
length(salary[rank == "Prof"])
salary[rank == "AsstProf"]
salary[rank == "AssocProf"] 

salary[discipline  == "A"]
salary[discipline  == "B"]

split(salary, rank)

split(salary, sex)

split(salary, sex)[[1]]

summary(split(salary, sex)[[1]])

split(salary, sex)["Female"]

summary(split(salary, sex)[["Female"]])



tapply(salary, rank, mean)

sapply(split(salary, rank), mean) 
sapply(split(salary, rank), median)
sapply(split(salary, rank), max)
sapply(split(salary, rank), min)
sapply(split(salary, rank), var)
sapply(split(salary, rank), sd)
sapply(split(salary, rank), length)
sapply(split(salary, rank), IQR)


tapply(salary, rank, mean)
tapply(salary, discipline, mean)

tapply(salary, list(rank, sex), mean)
tapply(salary, list(rank, sex), length)

table(rank, sex)


tapply(salary, list(rank, sex, discipline), mean)
tapply(salary, list(rank, discipline, sex), mean)

tapply(salary, list(sex, discipline, rank), median) 
tapply(salary, list(sex, discipline, rank), sd)


sample(1:20,8)
Salaries[sample(1:20,8), ]

Salaries[order(yrs.service), ]
Salaries[rev(order(yrs.service)), ]


Salaries[order(rank, yrs.service), ]
Salaries[order(rank, yrs.service, yrs.since.phd), ]


Salaries[order(rank, yrs.service), c(4,1,3,6)]
Salaries[order(rank, yrs.service), c("yrs.service",  "rank", "yrs.since.phd", "salary")]


Salaries[rank == "Prof", ] 
Salaries[sex == "Female", c(2,6)] 
Salaries[sex == "Female", 2:6] 


levels(rank)

salary[rank == "Prof"]
salary[rank == "AsstProf"]
salary[rank == "AssocProf"]


split(salary, rank)


Salaries[rank == "Prof", ] 
Salaries[rank == "AsstProf", ] 
Salaries[rank == "AssocProf", ] 


data <- Salaries[salary > 127100, c("rank", "yrs.service", "sex", "salary")]
data

subset(Salaries, salary > 107300)
subset(Salaries, rank == "Prof")
subset(Salaries, salary > mean(salary)) 

mean(Salaries$salary)

subset(Salaries, salary > 107300, select = c(yrs.since.phd, sex))


subset(Salaries, rank == "AsstProf" | rank == "AssocProf")

subset(Salaries, subset = rank %in% c("AsstProf","AssocProf"))

subset(Salaries, subset = rank %in% c("AsstProf","AssocProf"), select = c(rank, discipline, salary))

subset(Salaries, salary < median(salary), select = c(rank, discipline, salary))


matriz_1 <- subset(Salaries, subset = rank %in% c("AsstProf","AssocProf"),
       select = c(rank, discipline, salary, sex))

matriz_1

matriz_1[matriz_1$sex == "Female", ]

split(matriz_1, matriz_1$sex)

matriz_1[matriz_1$sex == "Female", ]


Salaries[salary > median(salary) & yrs.service < 15, ] 

str(Salaries)

Salaries[ ,sapply(Salaries, is.numeric)] 
Salaries[ ,sapply(Salaries, is.factor)] 


Salaries[-(36:256), ]
Salaries[!(rank == "Prof"), ]
Salaries[-which(rank == "Prof"), ]

Salaries[-which(sex == "Female"), ]

Salaries[!sex == "Male", ]         # or easier
Salaries[sex == "Female", ]

NewSalaries <- Salaries
NewSalaries[12,5] <- NA; NewSalaries[1,3] <- NA
NewSalaries[2,4] <- NA; NewSalaries[5,3] <- NA


na.omit(NewSalaries)

na.exclude(NewSalaries)
NewSalaries[complete.cases(NewSalaries), ]

names(Salaries)
grep("y", names(Salaries))
grep("x", names(Salaries))
grep("S", names(Salaries))
grep("s", names(Salaries))
grep("phd", names(Salaries))

Salaries[ ,grep("y", names(Salaries))]


Salaries[order(rank, -salary), ]
Salaries[order(-rank(sex), -salary), ] # Aplicacion de la funcion rank()


# Parse the event when there are no factors but character string -------------------
library(nycflights13)
nycflights13::flights
help(flights)

View(flights)
str(flights)
# ----------------------------------------------------------------------------------

# data store

new_salaries <- write.table(Salaries, append = FALSE, 
                            sep = " ", row.names = FALSE, col.names = TRUE, 
                            file = "G:\\Mi unidad\\R_Work\\Examples_R\\new_salaries.txt")


# Para la lectura en consola
setwd("G:\\Mi unidad\\R_Work\\Examples_R")
data <- read.table("new_salaries.txt", header = TRUE)


# For console reading
setwd("G:\\Mi unidad\\R_Work\\Examples_R") 
list.files(path = ".")

# Identify items in a particular folder
list.files(path = "G:\\Mi unidad\\R_Work\\Examples_R")
dir(path = "G:\\Mi unidad\\R_Work\\Examples_R")

# Another options 

dump("Salaries", file = "G:\\Mi unidad\\R_Work\\Examples_R\\Salaries.txt")

# For console reading

Salaries_D <- source("G:\\Mi unidad\\R_Work\\Examples_R\\Salaries.txt") 
Salaries_D
Salaries_D$value


# Another Example -------------------------------------------------------------------

help(state.x77)

state.x77

state.region
is.factor(state.region)
View(state.region)
levels(state.region)
nlevels(state.region)


states <- data.frame(state.region, state.x77); states

cbind(state.region, state.x77)
rbind()

View(states)

names(states)

head(states);  tail(states)
class(states); mode(states)
dim(states)
str(states)


# Subscripts and Indices

states[3,5]
states[14:19,7]
states[1:5,2:3]
states[3,]
states[,3]

class(states[3, ])
class(states[ ,3])

states[ ,c(1,5)] 


states$Population
states$Income
states[["Income"]]
states[[3]]
states[3]

states[ , "Income"]



identical(states$Income, states[,3])

summary(states)

attach(states)        # detach(states)


# Another way to subindice
#  Select the income according to the state or department that is known in the sub-index

Income[state.region == "West"]

Income[state.region == "Northeast"]


tapply(Income, state.region, mean)

View(tapply(Income, state.region, sd))


tapply(Income, state.region, max)
tapply(Income, state.region, length)


hist(Income, freq = FALSE, col = "green", 
     main = "1er histograma", xlab = "Ingresos per capital",
     ylab = "Frecuencia relativa")
grid()

par(mfrow = c(1,1))


barplot(tapply(Income, state.region, sd))


par(mfrow = c(2,2))
barplot(tapply(Income, state.region, sd), col = "blue")
barplot(tapply(Income, state.region, mean), col = "yellow")
barplot(tapply(Income, state.region, max), col = "red")
barplot(tapply(Income, state.region, length), col = "purple")
par(mfrow = c(1,1))

title(main = "Mis diagramas de barra")


Mg <- function(x, na.omit = FALSE) {
  if (na.omit)
    x <- x[!is.na(x)]
  mg = exp(mean(log(x)))
  return(mg)
}

Mar<- function(x) 1/mean(1/x)



Mg(Income)
mean(Income)
Mar(Income)
median(Income)


by(Income, state.region, mean)
by(Income, state.region, median)
by(Income, state.region, Mg)
by(Income, state.region, Mar)


par(mfrow = c(2,2))
barplot(by(Income, state.region, median), col = "blue", 
        main = "Mediana de ingresos por estados")

barplot(by(Income, state.region, mean), col = "green", 
        main = "Media de ingresos por estados")

barplot(by(Income, state.region, Mg), col = "antiquewhite2", 
        main = "Media G de ingresos por estados")

barplot(by(Income, state.region, Mar), col = "red", 
        main = "Media A de ingresos por estados")
par(mfrow = c(1,1))


title(main = "")




# Selecting Rows from the Dataframe at Random

states[sample(1:20,8), ]

# Sorting Dataframe

states[order(Illiteracy), ]
states[rev(order(Illiteracy)), ]

states[order(state.region,Illiteracy), ]
states[order(state.region,Murder,Illiteracy), ]

states[order(state.region,Illiteracy), c(4,3,1)]

states[order(state.region,Illiteracy), c("Population", "Income", "HS.Grad", "Life.Exp")]


# Using Logical Conditions to Select Rows from the Dataframe

states[state.region == "South", ]
split(states, state.region)
split(states, state.region)[[1]]

Income[state.region == "South"]

states[ ,names(states)!= "HS.Grad"]

states[Income > median(Income) & Life.Exp < 70.1, ]


states[states$state.region == "West" | states$state.region == "South", ]

states[state.region == "West" | state.region == "South", ]


states[state.region %in% c("South", "West") & Life.Exp > median(Life.Exp), ]

subset(states, state.region == "West")


install.packages("tidyverse", dep = TRUE)
library(tidyverse)

install.packages("tidyverse")
select(states, ends_with("region"))


install.packages("haven")
library(haven)



states[ ,sapply(states, is.numeric)]

states[ ,sapply(states,is.factor)]

states[-(6:15),]
states[!(state.region == "West"), ]
states[-which(state.region == "West"), ]
states[!state.region == "West", ]
states[state.region == "West", ]


# Selection does not only extract the part of data frame, it also allows to replace existing values:

states.new <- states; states.new

states.new[, 3] <- round(states.new[, 3] *3500 )
states.new

# Another example 


setwd("G:\\Mi unidad\\R_Work\\Examples_R")
getwd()


worms <- read.table("worms.txt", header = TRUE); worms

worms <- read.table(file.choose(), header = TRUE)


### Online databases


# https://vincentarelbundock.github.io/Rdatasets/datasets.html 


# Another Example

a <- read.table("https://datanalytics.com/uploads/datos_treemap.txt")

a <- read.csv("https://datanalytics.com/uploads/datos_treemap.txt", sep = "")
a

## view the structure of the data
str(a)


url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/aptos2015'
datos <- read.table(file = url, header = T)
head(datos)


### Paquetes a Instalar
# Holaaa muy buenas, cordial saludo. A continuacion adjunto lista de paquetes a descargar 
# con el fin de utilizar en la proximas secciones de R. Copiar el codigo a continuacion en 
# la consola principal o en un scrip y correrlo. Al hacer esto, R le solicitara el pais 
# espejo, para el caso Colombia, Cali. Si tienen acceso a un ancho de Banda considerable, 
# la descarga no tardara mucho, 10 minutos quizas y es demasiado este tiempo. 
# Sabran que han descargado los paquetes cuando al observar la consola de R se visualize 
# el promt ( > ). Por otro lado, seria pertinente que se leyeran todas las presentaciones 
# que envie de estadistica Basica (Aun que si se sienten con buen nivel en estadistica 
# basica no hay necesidad de leerlas). 

# Nota: en el codigo; install.packages("boot", dep = T), el nombre del paquete - boot - 
# aparece entre comillas " ", este simbolo esta arriba de la tecla numero 2.
# Al copiar y pegar en ocasiones se desconfiguran estas comillas. 
# Asi que intente descargar un paquete al inicio observe que descarga y posterior corra el resto del codigo. 

# Installing Packages and Libraries

# Install from CRAN

install.packages("AER", dep = T)
install.packages("lattice", dep  = T)
install.packages("Rcmdr", dep = T)
install.packages("car", dep = T)
install.packages("data.table")



# Under conditional 

if (!require("devtools")) install.packages("devtools")
devtools::install_github("ropensci/plotly")

#-----------------------------------------------------------------------------------------------------------

my_packages_1 <- c("boot", "rgl", "vcd", "qcc", "MASS", "munsell", "plot3D", "animation",
                   "ISwR", "akima", "chron", "Hmisc", "pastecs", "psych", "gpairs",  "vioplot",
                   "agricolae", "fBasics", "RColorBrewer","meta", "spdep", "deSolve", "R2jags",
                   "RODBC", "rpart", "Ime4", "mcmc", "odesolve", "spdep", "spatstat", "plotrix", 
                   "aplpack", "prettyR", "tree", "doBy", "reshape", "agricolae", "yaml", "carData")


install.packages(my_packages_1, repos = "http://cran.rstudio.com")


my_packages_2 <- c("ggplot2", "dplyr", "tidyr", "tidyverse", "mosaicData", "carData",
                 "VIM", "scales", "treemapify", "gapminder", "ggmap", "choroplethr",
                 "choroplethrMaps", "CGPfunctions", "ggcorrplot", "visreg", "gcookbook", 
                 "forcats", "survival", "survminer", "ggalluvial", "ggridges", "GGally", 
                 "superheat", "waterfalls", "factoextra", "networkD3", "ggthemes",
                 "hrbrthemes", "ggpol", "ggbeeswarm", "broom", "coefplot", "dotwhisker",
                 "gapminder", "GGally", "ggjoy", "ggrepel", "gridExtra", "DescTools",
                 "interplot", "margins", "maps", "mapproj", "mapdata", "psych", "devtools",
                  "quantreg", "scales", "survey", "srvyr", "viridis", "viridisLite")

install.packages(my_packages_2, repos = "http://cran.rstudio.com")




# Install Dev version from Gitlab
install.packages("data.table", repos="https://Rdatatable.gitlab.io/data.table")
data.table::update.dev.pkg()



# Load libraries into user-defined folders


list.files("G:\\Mi unidad\\R_Work\\Examples_R\\library_AER")
dir(path = "G:\\Mi unidad\\R_Work\\Examples_R\\library_AER")

info <- download.packages("AER", destdir = "G:\\Mi unidad\\R_Work\\Examples_R\\library_AER")

file.exists("G:\\Mi unidad\\R_Work\\Examples_R\\library_AER\\aer.txt")

info

install.packages(info[1,2], repos = NULL, lib = "G:\\Mi unidad\\R_Work\\Examples_R\\library_AER")

library(AER, lib.loc = "G:\\Mi unidad\\R_Work\\Examples_R\\library_AER")


# http://adv-r.had.co.nz/Style.html




### HOW CAN I RESHAPE MY DATA IN R? 

# When there are multiple measurements of the same subject, across time or using different tools, 
# the data is often described as being in "wide" format if there is one observation row per subject 
# with each measurement present as a different variable and "long" format if there is one observation 
# row per measurement (thus, multiple rows per subject).



hsb2 <- read.table('https://stats.idre.ucla.edu/stat/r/faq/hsb2.csv', header = T, sep = ",")
hsb2[1:10,]


new_hsb2 <- write.table(hsb2, append = FALSE, 
                        sep = " ", row.names = FALSE, col.names = TRUE, 
                        file = "G:\\Mi unidad\\R_Work\\Examples_R\\new_hsb2.txt")


# To reformat this dataset into long form, we will use the reshape function. The arguments we provide 
# include a list of variable names that define the different times or metrics (varying), the name 
# we wish to give the variable containing these values in our long dataset (v.names), the name we wish 
# to give the variable describing the different times or metrics (timevar), the values this variable will 
# have (times), and the end format for the data (direction). Additionally, we have provided new row names.


## Wide to long

l <- reshape(hsb2, 
             varying = c("read", "write", "math", "science", "socst"), 
             v.names = "score",
             timevar = "subj", 
             times = c("read", "write", "math", "science", "socst"), 
             new.row.names = 1:1000,
             direction = "long")

l.sort <- l[order(l$id),]
l.sort[1:10,]


# After sorting by id, we can see that we have five rows per student and their five scores appear in the 
# score variable with the subj variable indicating which test on which the score was measured. 
# For each of the five rows per id, the female, race, ses, schtyp, and prog variables are unchanging.

# We can similarly go from this long form back to our original wide form again using reshape with different arguments 
# (most importantly, direction = "wide"). With timevar, we indicate the variable that will define the multiple 
# measurements per subject. With idvar, we list the variables that should do not vary within subject.


## Long to wide

w <- reshape(l.sort, 
             timevar = "subj",
             idvar = c("id", "female", "race", "ses", "schtyp", "prog"),
             direction = "wide")

w[1:10,]

dim(w)
dim(hsb2)






###--------------------------------------------------------------------------
###--------------------------------------------------------------------------
###--------------------------------------------------------------------------

setwd("G:\\Mi unidad\\R_Work\\Examples_R")
savehistory(file = "save_1")



# Thanks you!!!


