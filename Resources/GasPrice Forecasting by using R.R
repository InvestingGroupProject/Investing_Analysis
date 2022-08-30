# Load Libraries
library(lattice)
library(foreign)
library(MASS)
require(stats)
require(stats4)
library(KernSmooth)
library(fastICA)
library(cluster)
library(leaps)
library(mgcv)
library(rpart)
library(pan)
library(mgcv)
library(DAAG)
library("TTR")
library(tis)
require("datasets")
require(graphics)
#install.packages("forecast")
library("forecast")
#install.packages("astsa")
#require(astsa)
library(xtable)
library(stats)


setwd("C:/Users/miaom/OneDrive/DataCamp/Class/Final Project")
gas_price <- read.csv('Gasoline_price.csv',check.names = F,stringsAsFactors = F)


# Convert data to time series format:
price_ts<-ts(gas_price$Gasoline_Prices,start=2001,freq=52)
price_ts
t<-seq(2001, 2021,length=length(price_ts))
t


#Linear Fit
m1=lm(price_ts~t)
par(mfrow=c(2,1))
plot(price_ts,ylab="GasolinePrice", xlab="Time", lwd=2, col='skyblue3',ylim=c(0,6), xlim=c(2001,2021))

nberShade()
lines(t,m1$fit,col="red3",lwd=2)
plot(t,m1$res, ylab="Residuals",type='l',xlab="Time")

#Quadratic Fit
m2=lm(price_ts~t+I(t^2))
par(mfrow=c(2,1))
plot(price_ts,ylab="GasolinePrice", xlab="Time", lwd=2, col='skyblue3',ylim=c(0,6), xlim=c(2001,2021))
lines(t,m2$fit,col="red3",lwd=2)
plot(t,m2$res, ylab="Residuals",type='l',xlab="Time")

#Log-Linear Fit
m3=lm(log(price_ts) ~ t)
par(mfrow=c(2,1))
plot(log(price_ts),ylab="GasolinePrice", xlab="Time", lwd=2, col='skyblue3', xlim=c(2001,2021))
lines(t,m3$fit,col="red3",lwd=2)
plot(t,m3$res, ylab="Residuals",type='l',xlab="Time")

#Exponential Fit
ds=data.frame(x=t, y=price_ts)
par(mfrow=c(2,1))
plot(price_ts,ylab="GasolinePrice", xlab="Time", lwd=2, col='skyblue3',ylim=c(0,6), xlim=c(2001,2021))
#lines(t,m1$fit,col="green",lwd=2)
m4=nls(y ~ exp(a + b * t),data=ds, start = list(a = 0, b = 0))
lines(ds$x, predict(m4, list(x = ds$x)),col="red3",lwd=2)
plot(t,residuals(m4), ylab="Residuals",type='l',xlab="Time")
summary(m4)

#-------------[2] MODEL SELECTION--------------
# Compare models using AIC and BIC
AIC(m1,m2,m3,m4)
BIC(m1,m2,m3,m4)

plot(stl(price_ts,s.window="periodic"))
### The smaller the value returned from AIC and BIC, the better the model. Model 3 is the winner


#-------------[3] TREND FORECASTING--------------
tn = data.frame(t = seq(2022,2029))
pred=predict(lm(price_ts ~ t), tn, se.fit = TRUE)
#plot(c(male_ts,pred$fit),type='l',xlim=c(1940,2000))
pred.plim = predict(lm(price_ts ~ t),tn, level =0.95, interval="prediction")
pred.clim = predict(lm(price_ts ~ t), tn,level=0.95, interval="confidence")
matplot(tn$t,cbind(pred.clim, pred.plim[,-1]),
        lty=c(1,1,1,3,3), type="l", lwd=2, ylab="predicted y",xlab="Time")


#dev.print(device=postscript,"tsfig.eps",width=7,height=7, horizontal=FALSE)
#dev.off()

#-------------[4] Holt-Winters Filter--------------
hwfit<-HoltWinters(price_ts)
hwpred <- predict(hwfit, 60, prediction.interval = TRUE,level=0.5)
plot(hwfit,hwpred,ylab="GasolinePrice", xlab="Time",xlim=c(2001,2029))
#lines(predict(hwfit,n.ahead=60),lwd=1.5, col='blue')
#plot(hwfit,ylab="Participation Rate (Male)", xlab="Time", lwd=1, col='black',xlim=c(1948,1999))
#lines(predict(hwfit,n.ahead=60),lwd=1.5, col='blue')