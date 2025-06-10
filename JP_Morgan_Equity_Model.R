## BUA 633 Term paper - Time Series (JPMorgan) ##
## Shalini Chhetri ##

# Load the necessary packages
library("dplyr")
library("ggplot2")
library("tidyverse")
library("readxl")
library("moments")
library("tidyr")
library("broom")
library("YRmisc")
library("robust")
library("gam")
library("quantmod")
library("robustbase")

# Importing the two datasets
#spData - contains financial data of companies
spdata <- read_excel("spData.xlsx")
#spInfo - contains the sector and industry of companies
spinfo <- read_excel("spInfo.xlsx")

# Check the type/class of data and convert to dataframe
#spdata
data.class(spdata)
spdata<-as.data.frame(spdata)
data.class(spdata)
#spinfo
data.class(spinfo)
spinfo<-as.data.frame(spinfo)
data.class(spinfo)

# Merging the two datasets using common variable "tkr"
names(spdata)
names(spinfo)
spdf<-merge(spdata,spinfo,by="tkr")
dim(spdf)
names(spdf)

# Replace mm/dd/yyyy date format with yyyy
spdf$date
spdf$date<-as.numeric(substring(spdf$date,7,10)) # modify date to only keep year
names(spdf)
names(spdf)[2]<-"year"  # rename "date" to "year"
names(spdf)

## Select "JPMorgan" - "JPM" as the company for analysis and create a new dataset
unique(spdf$tkr)
JPMorgan<-spdf[spdf$tkr=="JPM",c("tkr","price","eps","bvps","cr","dta",
                              "sales","year","name")]
JPMorgan<-df.sortcol(JPMorgan,"year",FALSE)
JPMorgan$obs<-1:23
names(JPMorgan)

## Histogram of the variables
par(mfrow=c(3,3))
hist(JPMorgan$price, main="Fig. 1: Hist of Price", xlab = "Price")
hist(JPMorgan$eps,main="Fig. 2: Hist of EPS", xlab = "EPS")
hist(JPMorgan$bvps,main="Fig. 3: Hist of BVPS", xlab = "BVPS")

## Generate Timeseries plots 
par(mfrow=c(3,3))
ts.plot(JPMorgan$price, main = "Fig. 4: Ts Plot of Price", ylab = "Price", xlab = "Time")
ts.plot(JPMorgan$eps, main = "Fig. 5: Ts Plot of EPS", ylab = "EPS", xlab = "Time")
ts.plot(JPMorgan$bvps, main = "Fig. 6: Ts Plot of BVPS", ylab = "BVPS", xlab = "Time")

## Generate scatterplots of independent variables against the dependent variable
par(mfrow=c(3,3))
scatter.smooth(JPMorgan$eps,JPMorgan$price, main = "Fig. 7: Price vs EPS",
               xlab = "EPS", ylab = "Price")
scatter.smooth(JPMorgan$bvps,JPMorgan$price, main = "Fig. 8: Price vs BVPS",
               xlab = "BVPS", ylab = "Price")
scatter.smooth(JPMorgan$obs,JPMorgan$price, main = "Fig. 9: Price vs OBS",
               xlab = "OBS", ylab = "Price")

## Summary of data
names(JPMorgan)
JPMorgan<-na.omit(JPMorgan)
ds.summ(JPMorgan[,c("price","eps","bvps","obs")],2)
# Table of summary statistics
summary(JPMorgan[,c("price","eps","bvps","obs")])
# Table of correlation
round(cor(JPMorgan[,c("price","eps","bvps","obs")]),3)

## Regression Model
#OLS Model
fit<-lm(price ~ eps+bvps+obs,na.action=na.omit,data=JPMorgan); summary(fit)
cor(JPMorgan$price,predict(fit,JPMorgan))^2
summary(fit)

## Residual Plots
# Histogram
par(mfrow = c(3, 3))
hist(fit$residuals, main="Fig. 10: Hist of Residuals", xlab="Residuals")
# Scatterplot with smooth line
plot(JPMorgan$price, fit$fitted.values, main="Fig. 11: Price vs Fitted Values", xlab="Price", ylab="Fitted
Values")
lines(lowess(JPMorgan$price, fit$fitted.values))
# Timeseries plot
plot.ts(JPMorgan$price, main="Fig. 12: Time Series Plot of Price", ylab="Price")
lines(fit$fitted.values)