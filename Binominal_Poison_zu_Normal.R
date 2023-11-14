####### Verteilungen ##############
rm(list = ls())
library(dplyr)
library(tibble)
library(magrittr)

# Set WD to path if exist (no warning)
try(setwd(rstudioapi::documentPath()), T); getwd()


# Binomialverteilung --------------------------------------------
p <- .5
x <- rbinom(1000, 100, p) %>% table %>% prop.table() %T>% plot()

range <- as.numeric(names(x)[1]):as.numeric(names(x)[length(x)])	# Range der Quantilswerte
d <- dbinom(range, 100, p) %T>% lines(x = range, type = "l", lwd = 2)


library(distributional)
dist_normal()
dist_binomial(100, .5)
dist_poisson(4.5)


# Binominal-Verteilung und Beeziehung zu Normal
k <- 100
p <- .4
q <- 1-p

dbinom(1:100, k, p) %>% plot(type = "l", lwd = 10, col = "gray")
dnorm(1:100, k*p, sqrt(k*p*q)) %>% lines(type = "l")


# Poison Verteilung und Beziehung zur Normalverteilung
lamda <- 50

dpois(1:100, lamda) %>% plot(type = "l", lwd = 10, col = "gray")
dnorm(1:100, 50, sqrt(lamda)) %>% lines(type = "l")

##############################
n <- 1000
lamda <- 2
rainDays <- rpois(n, lamda)
E.rain <- mean(rainDays)


hist(rainDays, freq = F, xlim = c(-1, 15), right = FALSE)
dpois(0:15, lambda = E.rain) %T>% lines(type = "l")
qpois(seq(0, .95, .1), E.rain) %T>% abline(v = ., col = "darkred", lwd = 3)
box()

E.rain



