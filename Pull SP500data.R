install.packages("quantmod")
library(quantmod)
GSPC <- getSymbols("^GSPC", auto.assign=FALSE, from = as.Date("2000-01-01"), to = as.Date("2022-06-30"), src="yahoo", periodicity = "weekly")
GSPC[1:10]
colnames(GSPC)
?write.csv()
write.csv(as.data.frame(GSPC),"GSPC_Weekly_stockdata_2000-2022.06.csv", row.names = TRUE)


