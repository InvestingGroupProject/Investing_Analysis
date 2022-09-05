#***********************************************

#linear regression tests the following hypotheses:
  
#  H0 : The slope of the linear model is zero, or m = 0
  
#  Ha : The slope of the linear model is not zero, or m ≠ 0

#***********************************************

library(dplyr)
library(ggplot2)
# Gas price vs SP500 Index price
setwd("C:/Users/miaom/OneDrive/DataCamp/Class/Final Project")
gas_stock <- read.csv('Gas and Stocks.csv',check.names = F,stringsAsFactors = F)
head(gas_stock)
colnames(gas_stock)

# Perform linear regression using the lm() function. 
lm(gas_stock$GasPrice ~ gas_stock$SP_500_Closed_Adj,data=gas_stock)
# Determine the pvalue adn the rsqured value for the linear regression model
summary(lm(gas_stock$GasPrice ~ gas_stock$SP_500_Closed_Adj,data=gas_stock))


#determine y-axis values from linear model
model <- lm(gas_stock$GasPrice ~ gas_stock$SP_500_Closed_Adj,data=gas_stock) #create linear model
#regression line function y = mx + b : Gas price ~ SP500 Index price
yvals <- model$coefficients["gas_stock$SP_500_Closed_Adj"]*gas_stock$SP_500_Closed_Adj + model$coefficients["(Intercept)"]


plt <- ggplot(gas_stock,aes(x=SP_500_Closed_Adj,y=GasPrice)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

# The chi-squared test is used to compare the distribution of frequencies across two groups and tests the following hypotheses:
  
# H0 : There is no difference in frequency distribution between both groups.

# Ha : There is a difference in frequency distribution between both groups

tb1 <- table(gas_stock$GasPrice, gas_stock$SP_500_Closed_Adj)
chisq.test(tb1) #compare categorical distributions

# fail to reject null



#******************************************************************************************
# Gas price vs oil company stock price: XOM

# Perform linear regression using the lm() function. 
lm(gas_stock$GasPrice ~ gas_stock$XOM,data=gas_stock)
# Determine the pvalue and the rsqured value for the linear regression model
summary(lm(gas_stock$GasPrice ~ gas_stock$XOM,data=gas_stock))


#determine y-axis values from linear model
model <- lm(gas_stock$GasPrice ~ gas_stock$XOM,data=gas_stock) #create linear model
#regression line function y = mx + b : Gas price ~ SP500 Index price
yvals <- model$coefficients["gas_stock$XOM"]*gas_stock$XOM + model$coefficients["(Intercept)"]


plt <- ggplot(gas_stock,aes(x=XOM,y=GasPrice)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

#******************************************************************************************
# Gas price vs oil company stock price: CVX
  
# Perform linear regression using the lm() function. 
lm(gas_stock$GasPrice ~ gas_stock$CVX,data=gas_stock)
# Determine the pvalue adn the rsqured value for the linear regression model
summary(lm(gas_stock$GasPrice ~ gas_stock$CVX,data=gas_stock))


#determine y-axis values from linear model
model <- lm(gas_stock$GasPrice ~ gas_stock$CVX,data=gas_stock) #create linear model
#regression line function y = mx + b : Gas price ~ SP500 Index price
yvals <- model$coefficients["gas_stock$CVX"]*gas_stock$CVX + model$coefficients["(Intercept)"]


plt <- ggplot(gas_stock,aes(x=CVX,y=GasPrice)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

#******************************************************************************************
# Plot four lines SP500 CVX OMX
typeof(gas_stock$Date)
plotdate <- as.Date(gas_stock$Date, format = "%m/%d/%y")
plotdate 

ggplot(gas_stock, aes((plotdate))) + 
  geom_line(aes(y = GasPrice, colour = "GasPrice")) + 
  geom_line(aes(y = CVX/100, colour = "CVX")) +
  geom_line(aes(y = XOM/100, colour = "XOM")) +
  geom_line(aes(y = SP_500_Closed_Adj, colour = "SP_500_Closed_Adj")) +
  labs(x = "Date", y = "Adjusted Gas and Stock prices($)", 
       title = "Trend For Gas Price, For SP500 and For Oil Company Stocks (CVX&XOM)")


#********************************multiple linear regression**********************************************************

library(dplyr)
gas_factors <- read.csv('summary_gasoline_price_factors.csv',check.names = F,stringsAsFactors = F)

head(gas_factors)
tail(gas_factors)
colnames(gas_factors)

# Perform linear regression using the lm() function. 
lm(`US gasoline price` ~ `Saudi Production Change Crude oil`+ gasoline_net_imports + `gasoline U.S. refinery production`, data=gas_factors)
# Determine the pvalue and the rsqured value for the linear regression model
summary(lm(`US gasoline price` ~ `Saudi Production Change Crude oil`+ gasoline_net_imports + `gasoline U.S. refinery production`, data=gas_factors))
gas_factors$DATE

gas_factors$DATE <- format(gas_factors$DATE, format = "%Y-%q")
typeof(gas_factors$DATE)

plot <- ggplot(data=gas_factors, aes(x = DATE, y = `US gasoline price`, group=1)) + 
  geom_line(aes(y = `US gasoline price`, colour = "GasPrice")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.background = element_blank()) +
  theme(axis.text.x=element_text(angle=-45, hjust=0.001))

plot <- plot +  geom_line(aes(y = `Saudi Production Change Crude oil`, colour = "production of Crude oil")) 
plot <- plot +  geom_line(aes(y = `gasoline U.S. refinery production`, colour = "US refinery gasoline production"))
plot <- plot + geom_line(aes(y = gasoline_net_imports, colour = "gasoline_net_imports")) + labs(x = "Date", y = "Factos", 
                                                                                               title = "Trend For Factos Might Effect Gasoline Prices")
plot
