# Statistical programming on the R platform
# Universidad Externado de Colombia
# Faculty of Economics - Master in Business intelligence -
# Name: Zahir Llerena
# CC: 101984752
# Email: zahir.llerena@gmail.com, arlington.llerena@uexternado.edu.co
# Statistics, Mathematics & Physics
# Exercises in class in order to strengthen skills concerning programming


# Introduction -----------------------------------------------------------------

rm(list = ls())

setwd("G:\\Mi unidad\\R_Work\\Examples_R")

getwd()

savehistory(file = "save_2")
loadhistory(file = "save_2")

#-------------------------------------------------------------------------------

# Start


options(prompt = "Zahir>", continue = " + ")
options(repos = c(CRAN = "http://cran.rstudio.com"))

update.packages()

# Files in current directory

list.files(path = ".")

dir(path = "G:\\Mi unidad\\R_Work\\Examples_R")


### Data Transformation with dplyr

## Introduction

# Visualization is an important tool for insight generation, but it is
# rare that you get the data in exactly the right form you need. Often
# you'll need to create some new variable summaries, or maybe
# you just want to rename the variables or reorder the observations in
# order to make the data a little easier to work with.

## Prerequisites

# In this chapter we are going to focus on how to use the dplyr package,
# another core member of the tidyverse. We will illustrate the key ideas
# using data from the nycflights13 package, and use ggplot2 to help
# us understand the data.


install.packages("tidyverse", dep = T); library(tidyverse)

# The tidyverse package is a meta R package suite that loads eight core packages when
# invoked, and also bundles numerous other packages upon installation. These packages all
# share a design philosophy as well as common grammar and data structures.

install.packages("nycflights13", dep = T); library(nycflights13)

# nycflights13
# This data frame contains all 336,776 flights that departed from New York City in 2013.
# The data comes from the US: https://www.transtats.bts.gov/DatabaseInfo.asp?DB_ID=120&Link=0


nycflights13::flights

help(flights)

head(flights); tail(flights)
names(flights); colnames(flights) 
class(flights); mode(flights)
dim(flights)

View(flights)

str(flights)

library(DescTools)
Abstract(flights)

object.size(flights)
complete.cases(flights)
na.omit(flights)
na.exclude(flights)


flights[complete.cases(flights), ]

?flights

# You might notice that this data frame prints a little differently from
# other data frames you might have used in the past: it only shows the
# first few rows and all the columns that fit on one screen. (To see the
# whole dataset, you can run View(flights), which will open the
# dataset in the RStudio viewer).

View(flights)

# It prints differently because it's a tibble

### dplyr Basics

# You are going to learn the five key dplyr functions
# that allow you to solve the vast majority of your data-manipulation
# challenges:


# - Pick observations by their values (filter()).
# - Reorder the rows (arrange()).
# - Pick variables by their names (select()).
# - Create new variables with functions of existing variables (mutate()).
# - Collapse many values down to a single summary (summarize()).

# These can all be used in conjunction with group_by(), which
# changes the scope of each function from operating on the entire
# dataset to operating on it group-by-group. These six functions provide
# the verbs for a language of data manipulation.

# All verbs work similarly:

# 1. The first argument is a data frame.
# 2. The subsequent arguments describe what to do with the data-frame, 
# using the variable names (without quotes).

# 3. The result is a new data frame.

# Together these properties make it easy to chain together multiple
# simple steps to achieve a complex result.


### Filter Rows

# filter() allows you to subset observations based on their values.

# The first argument is the name of the data frame. The second and
# subsequent arguments are the expressions that filter the data frame.
# For example, we can select all flights on January 1st with:

filter(flights, month == 1, day == 1)


# When you run that line of code, dplyr executes the filtering operation
# and returns a new data frame. dplyr functions never modify
# their inputs, so

jan1 <- filter(flights, month == 1, day == 1); jan1

(dec25 <- filter(flights, month == 12, day == 25))

# Another options

flights[flights$month == 12 & flights$day == 25, ]

### Comparisons
# To use filtering effectively, you have to know how to select the observations
# that you want using the comparison operators

# R provides the standard suite: >, >=, <, <=, != (not equal), and == (equal).

filter(flights, month = 1)


### Logical Operators

View(filter(flights, month == 11 | month == 12))

nov_dec <- filter(flights, month %in% c(11, 12))

# Another option 

subset(flights, subset = month %in% c(11,12))

subset(flights, subset = month %in% c(11,12), select = -year)

flights[flights$month == 11 | flights$month == 12, -1]


# De Morgan law:
# !(x & y) is the same as !x | !y, and !(x | y) is the same as !x & !y.

# For example, if you wanted to find flights
# that weren't delayed (on arrival or departure) by more than two
# hours, you could use either of the following two filters:

filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)

# Whenever you start using complicated, multipart expressions in filter(), 
# consider making them explicit variables instead. That makes
# it much easier to check your work. You'll learn how to create new
# variables shortly.

# filter() only includes rows where the condition is TRUE; it
# excludes both FALSE and NA values


### Arrange Rows with arrange()

# arrange() works similarly to filter() except that instead of selecting
# rows, it changes their order. It takes a data frame and a set of column
# names (or more complicated expressions) to order by.

arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))
View(arrange(flights, desc(arr_delay)))

library(DescTools)
Abstract(arrange(flights, desc(arr_delay)))


# Another option 
flights[order(flights$year, flights$month, flights$day), ]

flights[rev(order(flights$arr_delay)), ]


library(DescTools)
Abstract(flights[rev(order(flights$arr_delay)), ])

# It is necessary to test both commands under another condition


library(AER)

data("CPS1985", package = "AER"); head(CPS1985)
str(CPS1985)

# 1- 

View(arrange(CPS1985, desc(wage)))
class(arrange(CPS1985, desc(wage)))
mode(arrange(CPS1985, desc(wage)))
attributes(arrange(CPS1985, desc(wage)))

attributes(arrange(CPS1985, desc(wage)))$row.names
rownames(arrange(CPS1985, desc(wage)))

# 2-

View(CPS1985[rev(order(CPS1985$wage)), ])
class(CPS1985[rev(order(CPS1985$wage)), ])
mode(CPS1985[rev(order(CPS1985$wage)), ])
attributes(CPS1985[rev(order(CPS1985$wage)), ])

attributes(CPS1985[rev(order(CPS1985$wage)), ])$row.names
rownames(CPS1985[rev(order(CPS1985$wage)), ])

# Therefore

identical(arrange(CPS1985, desc(wage)), CPS1985[rev(order(CPS1985$wage)), ])

all.equal(arrange(CPS1985, desc(wage)), CPS1985[rev(order(CPS1985$wage)), ], 2)

library(dplyr)
near(arrange(CPS1985, desc(wage)), CPS1985[rev(order(CPS1985$wage)), ])



### Select Columns with select()

# It's not uncommon to get datasets with hundreds or even thousands
# of variables. In this case, the first challenge is often narrowing in on
# the variables

# Select columns by name

select(flights, year, month, day)

flights


# Select all columns between year and day (inclusive)

select(flights, year:day)

# Select all columns except those from year to day (inclusive)

select(flights, -(year:day))

select(flights, !(year:day))

# There are a number of helper functions you can use within select():

# - starts_with("abc") matches names that begin with abc
# - ends_with("xyz") matches names that end with xyz
# - contains("ijk") matches names that contain ijk
# - matches("(.)\\1") selects variables that match a regular expression.
# - num_range("x", 1:3) matches x1, x2, and x3.


flights

select(flights, !ends_with("delay"))

select(flights, starts_with("dep") & ends_with("delay"))

select(flights, starts_with("dep") | ends_with("delay"))

select(flights, contains("time"))

select(flights, contains("TIME"))

str(flights)


# select() can be used to rename variables, but it's rarely useful
# because it drops all of the variables not explicitly mentioned.
# Instead, use rename(), which is a variant of select() that keeps all
# the variables that aren't explicitly mentioned:

rename(flights, tail_num = tailnum)

str(flights)
str(rename(flights, tail_num = tailnum))


# Another option is to use select() in conjunction with the everything() helper

select(flights, time_hour, air_time, everything())

# This is useful if you have a handful of variables
# you'd like to move to the start of the data frame


# Another option 

flights[ , c(1,4,6,5)]

flights[flights$year == 2013, ] 

flights[flights$year == 2013, 3:7] 

flights[-(36:256), ]
flights[!(flights$carrier == "UA"), ]


grep("y", names(flights))

flights[ ,grep("y", names(flights))]


### Add New Variables with mutate()

# Besides selecting sets of existing columns, it's often useful to add
# new columns that are functions of existing columns.

# mutate() always adds new columns at the end of your dataset so
# we'll start by creating a narrower dataset so we can see the new variables.

flights_sml <- select(flights,
  year:day,
  ends_with("delay"),
  distance,
  air_time
)

head(flights_sml)

summary(flights_sml)


newdata <- mutate(flights_sml, Distancia = ifelse(distance > 872, "far", "near"))

newdata <- mutate(flights_sml, height = ifelse(distance < 502 | distance > 1389, "lejos", "centrado"))


summary(flights)

table(flights$origin)

View(mutate(flights, Origen = ifelse(origin %in% c("EWR", "JFK"), "importantes", "no-importantes")))


table(flights$dest)


mutate(flights_sml,
  gain = arr_delay - dep_delay,
  speed = distance / air_time * 60)

# Note that you can refer to columns that you've just created:
# The new variable is added to the initial database - flights_sml - .


mutate(flights_sml,
  gain = arr_delay - dep_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours
)

# If you only want to keep the new variables, use transmute():

transmute(flights,
  gain = arr_delay - dep_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours
)


### Useful Creation Functions
# There are many functions for creating new variables that you can
# use with mutate(). The key property is that the function must be
# vectorized: it must take a vector of values as input, and return a vector
# with the same number of values as output.

View(flights)

transmute(flights,
  dep_time,
  hour = dep_time %/% 100,
  minute = dep_time %% 100
)

### Grouped Summaries with summarize() 

# The last key verb is summarize(). It collapses a data frame to a single
# row:

summarize(flights, delay = mean(dep_delay, na.rm = TRUE))

#-----------------------------------------------------------------------------
library(tidyverse)
library(dplyr)


a <- f(x)
b <- g(a)
h(b)


f(x) %>%  g() %>% h()



select(flights, dep_delay)

flights %>% select(dep_delay)


mean(CPS1985$wage)

CPS1985$wage %>% mean( na.rm = TRUE)

sd(CPS1985$wage, na.rm = TRUE)

CPS1985$wage %>% sd( na.rm = TRUE)

colMeans(select(flights, dep_delay), na.rm = TRUE) 

colSums(flights %>% select(dep_delay), na.rm = TRUE) %>% abs()

head(WorldPhones)

rowMeans(WorldPhones) %>% sum()
rowSums(WorldPhones)
#-----------------------------------------------------------------------------

by_day <- group_by(flights, year, month, day)

head(by_day)

summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))

flights_o <- group_by(flights, origin)


summarize(flights_o, mean_dist = mean(distance, na.rm = TRUE), mean_h = mean(hour, na.rm = TRUE))


# Another example


library(AER)

data("CPS1985", package = "AER"); head(CPS1985)
str(CPS1985)


by_occupation <- group_by(CPS1985, occupation)

summarize(by_occupation , media_O = mean(wage, na.rm = TRUE))

tapply(CPS1985$wage, CPS1985$occupation, mean)


by_occ.sec <- group_by(CPS1985, occupation, sector)
summarize(by_occ.sec , media_OS = mean(wage, na.rm = TRUE))

tapply(CPS1985$wage, list(CPS1985$occupation, CPS1985$sector), mean)



setwd("G:\\Mi unidad\\R_Work\\Examples_R")

library(AER)

data("CPS1985", package = "AER"); head(CPS1985)

object.size(CPS1985)

install.packages(c("writexl", "readxl"), dep = TRUE)
library(writexl)
library(readxl)

example_0 <- write_xlsx(list(mysheet = CPS1985), "example_0.xlsx")

readxl::read_xlsx(example_0)

data("CPS1985", package = "AER"); head(CPS1985)
data("CPS1988", package = "AER"); head(CPS1988)
data("CPSSW9204", package = "AER"); head(CPSSW9204)
data("CPSSW9298", package = "AER"); head(CPSSW9298)
data("CPSSW04", package = "AER"); head(CPSSW04)
data("CPSSW3", package = "AER"); head(CPSSW3)
data("CPSSW8", package = "AER"); head(CPSSW8)
data("CPSSWEducation", package = "AER"); head(CPSSWEducation)
data("CASchools", package = "AER"); head(CASchools)
data("GSOEP9402", package = "AER"); head(GSOEP9402)

write.table(CPS1985, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPS1985.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CPS1988, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPS1988.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CPSSW9204, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPSSW9204.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CPSSW9298, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPSSW9298.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CPSSW04, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPSSW04.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CPSSW3, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPSSW3.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CPSSW8, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPSSW8.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CPSSWEducation, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CPSSWEducation.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(CASchools, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_CASchools.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

write.table(GSOEP9402, file = "G:\\Mi unidad\\R_Work\\Examples_R\\New_GSOEP9402.txt", 
  append = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)


example_1 <- write_xlsx(list(CPS1985 = CPS1985, 
                             CPS1988 = CPS1988, 
                             CPSSW9204 = CPSSW9204,
                             CPSSW9298 = CPSSW9298,
                             CPSSW04 = CPSSW04,
                             CPSSW3 = CPSSW3,
                             CPSSW8 = CPSSW8,
                             CASchools = CASchools,
                             GSOEP9402 = GSOEP9402, 
                             CPSSWEducation = CPSSWEducation), "example_1.xlsx")

object.size(example_1)

### What task am I carrying out?

library(microbenchmark)
microbenchmark(
  writexl = writexl::write_xlsx(CPS1985, tempfile()),
  openxlsx = openxlsx::write.xlsx(CPS1985, tempfile()),
  times = 5
)



##--------------------------------------------------------------------------
###--------------------------------------------------------------------------
###--------------------------------------------------------------------------

setwd("G:\\Mi unidad\\R_Work\\Examples_R")
savehistory(file = "save_2")



# Thanks you!!!

